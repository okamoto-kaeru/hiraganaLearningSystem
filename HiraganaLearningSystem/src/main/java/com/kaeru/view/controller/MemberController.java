package com.kaeru.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kaeru.eLearning.address.AddressService;
import com.kaeru.eLearning.address.AddressVO;
import com.kaeru.eLearning.member.MemberService;
import com.kaeru.eLearning.member.MemberVO;
import com.kaeru.eLearning.member.impl.GradeServiceImpl;

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private GradeServiceImpl gradeService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView() {
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginAction(@RequestParam(value="jump", defaultValue="") String jump,
							  @RequestParam(value="pseq", defaultValue="") String pseq,
							  @RequestParam(value="hiraganaLine", defaultValue="") String hiraganaLine,
							  @RequestParam(value="whatQuiz", defaultValue="") String whatQuiz,
							  MemberVO vo, Model model) {
		MemberVO loginUser = memberService.getMemberByMemberId(vo.getMemberId());
		
		// 로그인 화면전 화면 정보를 Model 객체에 담는다.
		model.addAttribute("jump", jump);
		model.addAttribute("pseq", pseq);
		model.addAttribute("hiraganaLine", hiraganaLine);
		model.addAttribute("whatQuiz", whatQuiz);
		
		if (loginUser == null) { // 아이디가 없음
			model.addAttribute("message", "아이디가 존재하지 않습니다.");	
			return "member/login";
		} else if(loginUser.getUseyn().equals("n")) {
			model.addAttribute("message", "이 계정은 사용정지되어 있습니다.");
			return "member/login";
		} else { // 입력ID와 같은 아이디가 있다.
			if ((loginUser.getPwd()).equals(vo.getPwd())) { // id, password가 일치
				model.addAttribute("loginUser", loginUser);
				if(jump.equals("")) {
					return "index";
				} else {
					if(pseq != null) {
						return "redirect:" + jump + "?pseq=" + pseq;
					} else if(hiraganaLine != null) {
						return "redirect:" + jump + "?hiraganaLine=" + hiraganaLine;
					} else {
						return "redirect:" + jump;
					}
				}
				
			} else { // password가 일치하지 않다.
				model.addAttribute("message", "암호가 틀렸습니다.");
				return "member/login";
			}
		}

	}
	
	@RequestMapping(value = "/idCheckForm", method = RequestMethod.GET)
	public String idCheck(@RequestParam(value = "memberId", defaultValue = "") String memberId, Model model) {
		MemberVO vo = memberService.getMemberByMemberId(memberId);
		Boolean result = false;

		if (vo != null) {
			result = true;
		}
		model.addAttribute("memberId", memberId);
		model.addAttribute("result", result);
		return "member/idCheckForm";
	}
	
	// 회원 가입 화면 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinView() {
		return "member/join";
	}
	
	// 회원 가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinAction(@RequestParam(value="address1", defaultValue="") String address1,
							 @RequestParam(value="address2", defaultValue="") String address2,
							  MemberVO vo, Model model) {
		vo.setAddress(address1 + address2);
		
		// 회원 등록
		int result = memberService.insertMember(vo);
		
		if (result > 0) {
			return "member/joinOK";
		}
		return "member/joinNG";
	}

	@RequestMapping(value = "/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:login";
	}
	
	
	@RequestMapping(value="/mypage")
	public String myPageView(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("jump", "mypage");
			return "member/login";
		} else {
			return "redirect:orderList";
		}
	}
	
	
	// 주소찾기 위한 화면 출력
	@RequestMapping(value="/searchAddress")
	public String searchAddressView() {
		return "member/searchAddress";
	}
	
	// 동 이름으로 주소 찾기
	@RequestMapping(value="/findAddress")
	public String findAddress(@RequestParam(value="dong", defaultValue="") String dong, Model model) {
		List<AddressVO> addressList = addressService.selectAddressByDong(dong);
		model.addAttribute("addressList", addressList);
		return "member/searchAddress";
	}
	
	
	// 아이디를 잊을 때 해결 화면 출력
	@RequestMapping(value="/findIdForm")
	public String findIdView(Model model) {
		return "member/findIdForm";
	}
	
	
	// 비밀번호를 잊을 때 해결 화면 출력
	@RequestMapping(value="/findPasswordForm")
	public String findPasswordView(Model model) {
		return "member/findPasswordForm";
	}
	
	
	// 아이디 검색
	@RequestMapping(value="/findId")
	public String findId(MemberVO vo, String email, Model model) {
		MemberVO member = memberService.findId(vo);
		if(member == null) {
			model.addAttribute("idMessage", "이름이 틀리거나 이메일 입력이 잘 못했습니다.");
		} else {
			model.addAttribute("memberId", member.getMemberId());
		}
		return "member/findId";
	}
	
	
	// 비밀번호 검색
	@RequestMapping(value="/findPassword")
	public String findPassword(MemberVO vo, Model model) {
		MemberVO member = memberService.findPassword(vo);
		if(member == null) {
			model.addAttribute("passwordMessage", "이름이 틀리거나 아이디가 틀리거나 이메일 입력이 잘 못했습니다.");
			return "member/updatePasswordForm";
		} else {
			model.addAttribute("memberId", member.getMemberId());
			return "member/updatePasswordForm";
		}
	}
	
	
	// 비밀번호 변경
	@RequestMapping(value="updatePassword")
	public String updatePassword(MemberVO vo) {
		memberService.updatePassword(vo);
		return "member/updatePasswordOK";
	}
}

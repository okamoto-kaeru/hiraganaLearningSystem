package com.kaeru.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kaeru.eLearning.address.AddressService;
import com.kaeru.eLearning.address.AddressVO;
import com.kaeru.eLearning.board.BoardService;
import com.kaeru.eLearning.board.BoardVO;
import com.kaeru.eLearning.cart.CartService;
import com.kaeru.eLearning.cart.CartVO;
import com.kaeru.eLearning.member.GoogleChartService;
import com.kaeru.eLearning.member.GradeService;
import com.kaeru.eLearning.member.GradeVO;
import com.kaeru.eLearning.member.MemberService;
import com.kaeru.eLearning.member.MemberVO;
import com.kaeru.eLearning.order.OrderService;

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private GoogleChartService googleChartService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(@RequestParam(value="jump", defaultValue="") String jump,
						  @RequestParam(value="pseq", defaultValue="") String pseq,
						  @RequestParam(value="bseq", defaultValue="") String bseq,
						  @RequestParam(value="hiraganaLine", defaultValue="") String hiraganaLine,
						  @RequestParam(value="whatQuiz", defaultValue="") String whatQuiz,
						  Model model) {
			
			// 로그인 화면에 도기 전 화면 정보를 Model 객체에 담는다.
			model.addAttribute("jump", jump);
			model.addAttribute("pseq", pseq);
			model.addAttribute("bseq", bseq);
			model.addAttribute("hiraganaLine", hiraganaLine);
			model.addAttribute("whatQuiz", whatQuiz);
			return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginAction(@RequestParam(value="jump", defaultValue="") String jump,
							  @RequestParam(value="pseq", defaultValue="") String pseq,
							  @RequestParam(value="bseq", defaultValue="") String bseq,
							  @RequestParam(value="hiraganaLine", defaultValue="") String hiraganaLine,
							  @RequestParam(value="whatQuiz", defaultValue="") String whatQuiz,
							  MemberVO vo, Model model) {
		
		MemberVO loginUser = memberService.getMemberByMemberId(vo.getMemberId());
		
		// 로그인 실패시 필요한 전 화면 정보를 Model 객체에 담는다.
		model.addAttribute("jump", jump);
		model.addAttribute("pseq", pseq);
		model.addAttribute("bseq", bseq);
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
					} else if(bseq != null) {
						return "redirect:" + jump + "?bseq=" + bseq;
					} else if(hiraganaLine != null) {
						if(whatQuiz != null) {
							hiraganaLine += "&whatQuiz=" + whatQuiz;
						}
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
	public String joinAction(MemberVO vo, Model model) {
		// 이름하고 이메일이 이미 등록되어 있는 사람이 또 같은 이름, 이메일로 등록하면, id찾기를 할 때,
		// 오류가 생기니까, 그 경우에는 다른 이름으로 등록하라고 메시지를 표시
		MemberVO member = memberService.findId(vo);
		if(member != null) {
			return "member/joinNG";
		} else {
			// 회원 등록
			memberService.insertMember(vo);
			gradeService.initGrade(vo.getMemberId());	// 성적보기를 위한 처리(null데이터 삽입)
			return "member/joinOK";
		}
	}

	@RequestMapping(value = "/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:login";
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
	
	
	// 회원정보 수정
	@RequestMapping(value="updateMemberInfo")
	public String updateMemberInfo(MemberVO vo, @RequestParam(value="url", defaultValue="") String url) {
		memberService.updateMemberInfo(vo);
		if(url.isEmpty()) {
			return "mypage/MypageMain";
		} else {
			return "redirect:" + url;
		}
		
	}
	
	
	// 마이페이지 화면 표시
	@RequestMapping(value="goMypage")
	public String mypageView(HttpSession session, Model model) {
		// login 여부를 확인 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("jump", "goMypage");
			return "member/login";
		} else {
			// 장바구니 정보를 얻어 옴
			String memberId = loginUser.getMemberId();
			model.addAttribute("memberId", memberId);
			
			List<CartVO> cartList = cartService.getCartList(memberId);
			if(cartList.isEmpty()) {
				model.addAttribute("cart", false);
			} else {
				model.addAttribute("cart", true);
				String productName = cartList.get(0).getProductName();
				if(cartList.size() == 1) {
					model.addAttribute("cartInfo", "장바구니에<br><span style='color: orange; font-size: 0.4rem'>" + productName + "</span><br>이/가 있습니다.");
				} else {
					model.addAttribute("cartInfo", "장바구니에<br><span style='color: orange; font-size: 0.4rem'>" + productName + "</span> 외 <span style='color: red; font-size: 0.4rem'>" + (cartList.size() - 1) + "개</span><br>상품이 있습니다.");
				}		
			}
			
			// 주문 정보를 얻어 옴
			List<Integer> oseqList = orderService.getOrderNumber(memberId);
			if(oseqList.isEmpty()) {
				model.addAttribute("order", false);
			} else {
				model.addAttribute("order", true);
			}
			
			// 게시판 정보를 얻어 옴
			List<BoardVO> boardList = boardService.getBoardListByWriterId(memberId);
			model.addAttribute("boardList", boardList);
			if(boardList.isEmpty()) {
				model.addAttribute("board", false);
			} else {
				model.addAttribute("board", true);
			}
			
			// 진도 정보를 얻어 옴
			List<GradeVO> gradeList = gradeService.getGradeByMemberId(memberId);
			
			// 어떤 행을 공부했는지 저장
			String hiraganaLine = gradeList.get(0).getHiraganaLine();
			model.addAttribute("hiraganaLine", hiraganaLine);
							
			// 어떤 공부를 했는지 저장
			String kind = gradeList.get(0).getWhatQuiz();
			model.addAttribute("kind", kind);

			return "mypage/mypageMain";
		}
	}
	
	@RequestMapping(value="showGrade")
	public String showGrade(HttpSession session, Model model) {
		// login 여부를 확인 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("jump", "showGrade");
			return "member/login";
		} else {
			model.addAttribute("memberId", loginUser.getMemberId());
			return "mypage/myGrade";
		}
	}
	
	@RequestMapping(value="gradeGraph", produces="application/json; charset=UTF-8")
	@ResponseBody
	public JSONObject gradeGraph(@RequestParam(value="memberId") String memberId) {
		return googleChartService.getChartData(memberId);
	}
}

package com.kaeru.view.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaeru.eLearning.hiragana.HiraganaService;
import com.kaeru.eLearning.hiragana.HiraganaVO;
import com.kaeru.eLearning.hiragana.HiraganaWordQuizVO;
import com.kaeru.eLearning.member.GradeService;
import com.kaeru.eLearning.member.GradeVO;
import com.kaeru.eLearning.member.MemberService;
import com.kaeru.eLearning.member.MemberVO;

@Controller
public class HiraganaController {
	
	@Autowired
	private HiraganaService hiraganaService;
	
	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/hiraganaHome", method=RequestMethod.GET)
	public String hiraganaHomeView() {
		return "hiragana/hiraganaHome";
	}
	
	@RequestMapping(value="/hiraganaSelectMethods")
	public String hiraganaSelectMethods(@RequestParam(value="hiraganaLine") String hiraganaLine, Model model) {
		model.addAttribute("hiraganaLine", hiraganaLine);
		return "hiragana/hiraganaSelectMethods";
	}
	
	// 동영상 url를 조회하고 화면 표시
	@RequestMapping(value="/goHiraganaMovie")
	public String goHiraganaMovie(@RequestParam(value="hiraganaLine") String hiraganaLine, Model model) {
		String movie = hiraganaService.getHiraganaMovie(hiraganaLine);
		model.addAttribute("movie", movie);
		model.addAttribute("hiraganaLine", hiraganaLine);
		return "hiragana/hiraganaMovie";
	}
	
	
	
	// hiragana 퀴즈로 화면 이동
	@RequestMapping(value="/hiraganaAssociativeQuizForm")
	public String hiraganaAssociativeQuizView(@RequestParam(value="hiraganaLine") String hiraganaLine,
											@RequestParam(value="whatQuiz", defaultValue="") String whatQuiz,
											HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		model.addAttribute("hiraganaLine", hiraganaLine);
		model.addAttribute("whatQuiz", whatQuiz);

		if(loginUser == null) {
			model.addAttribute("jump", "hiraganaAssociativeQuizForm");
			return "member/login";
		} else {
			model.addAttribute("memberId", loginUser.getMemberId());
			
			// や행하고 わ행인 경우 선택자가 5개가 아니고 3개이므로 다른 화면의로 이동
			if(hiraganaLine.equals("や행") || hiraganaLine.equals("わ행")) {
				return "hiragana/hiraganaAssociativeQuizForYaAndWa";
			} else {
				return "hiragana/hiraganaAssociativeQuiz";
			}
		}
	}
	
	
	/* ajax를 이용하여 hiragana퀴즈에 필요한 데이터 전송 */
	@RequestMapping(value="/hiraganaQuiz", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> hiraganaQuizData(@RequestParam(value="hiraganaLine") String hiraganaLine,
												@RequestParam(value="whatQuiz") String whatQuiz) {
				
		List<HiraganaVO> hiraganaLineList = hiraganaService.getHiraganaLine(hiraganaLine);
		Map<String, Object> map = new HashMap<>();
		map.put("hiraganaLineList", hiraganaLineList);
		map.put("whatQuiz", whatQuiz);
		return map;
	}
	
	// 히라가나 퀴즈 결과를 저장한다
	@RequestMapping(value="/newGradeAndOneMoreTime")
	public String newGradeAndOneMoreTime(GradeVO gradeVO) throws UnsupportedEncodingException {
		gradeService.insertGrade(gradeVO);
		String encodedHiraganaLine = URLEncoder.encode(gradeVO.getHiraganaLine(), "UTF-8");
		return "redirect: hiraganaAssociativeQuizForm?hiraganaLine=" + encodedHiraganaLine + "&whatQuiz=" + gradeVO.getWhatQuiz();
	}
	
	@RequestMapping(value="/newGradeAndGoHiraganaTextQuiz")
	public String goNewGradeAndGoHiraganaTextQuiz(GradeVO gradeVO) throws UnsupportedEncodingException {
		gradeService.insertGrade(gradeVO);
		String encodedHiraganaLine = URLEncoder.encode(gradeVO.getHiraganaLine(), "UTF-8");
		return "redirect: hiraganaAssociativeQuizForm?hiraganaLine=" + encodedHiraganaLine + "&whatQuiz=hiraganaTextQuiz";
	}
	
	/* 프린트 출력 화면으로 이동 */
	@RequestMapping(value="/newGradeAndGoHiraganaWrite")
	public String hiraganaWriteView(GradeVO gradeVO) {
		gradeService.insertGrade(gradeVO);
		return "hiraganaWrite?hiraganaLine=" + gradeVO.getHiraganaLine();
	}
	
	
	// 단어형 퀴즈 화면 이동
	@RequestMapping(value="/hiraganaWordQuizForm")
	public String hiraganaWordQuizView(@RequestParam(value="hiraganaLine") String hiraganaLine,
										HttpSession session, Model model) {
		model.addAttribute("hiraganaLine", hiraganaLine);
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("jump", "hiraganaWordQuizForm");
			return "member/login";
		} else {
			model.addAttribute("memberId", loginUser.getMemberId());
			model.addAttribute("whatQuiz", "hiraganaWordQuiz");

			return "hiragana/hiraganaWordQuiz";
		}
	}
	
	
	/* ajax를 이용하여 hiragana퀴즈에 필요한 데이터 전송 */
	@RequestMapping(value="/hiraganaWordQuiz", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<HiraganaWordQuizVO> hiraganaQuizData(@RequestParam(value="hiraganaLine") String hiraganaLine) {
				
		List<HiraganaWordQuizVO> hiraganaWordList = hiraganaService.getHiraganaWordQuiz(hiraganaLine);
		return hiraganaWordList;
	}
	
	@RequestMapping(value="gradeAndHiraganaWordOneMoreTime")
	public String gradeAndHiraganaWordOneMoreTime(GradeVO gradeVO) throws UnsupportedEncodingException {
		gradeService.insertGrade(gradeVO);
		String encodedHiraganaLine = URLEncoder.encode(gradeVO.getHiraganaLine(), "UTF-8");
		return "redirect: hiraganaWordQuizForm?hiraganaLine=" + encodedHiraganaLine;
	}
	
	@RequestMapping(value="gradeAndGoHiraganaHome")
	public String gradeAndGoHiraganaHome(GradeVO gradeVO) {
		gradeService.insertGrade(gradeVO);
		return "hiragana/hiraganaHome";
	}

}

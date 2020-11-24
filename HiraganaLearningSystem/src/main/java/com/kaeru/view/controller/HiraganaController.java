package com.kaeru.view.controller;

import java.util.List;

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
import com.kaeru.eLearning.member.GradeService;
import com.kaeru.eLearning.member.GradeVO;
import com.kaeru.eLearning.member.MemberVO;

@Controller
public class HiraganaController {
	
	@Autowired
	private HiraganaService hiraganaService;
	
	@Autowired
	private GradeService gradeService;
	
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
	@RequestMapping(value="/hiraganaTestForm")
	public String hiraganaTestView(@RequestParam(value="hiraganaLine") String hiraganaLine, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		model.addAttribute("hiraganaLine", hiraganaLine);

		if(loginUser == null) {
			model.addAttribute("jump", "hiraganaTestForm");
			return "member/login";
		} else {
			model.addAttribute("memberId", loginUser.getMemberId());
			return "hiragana/hiraganaTextTest";
		}
	}
	
	// ajax를 이용하여 hiragana퀴즈에 필요한 데이터 전송
	@RequestMapping(value="/hiraganaQuiz", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<HiraganaVO> hiraganaQuizData(@RequestParam(value="hiraganaLine") String hiraganaLine, Model model) {
				
		List<HiraganaVO> hiraganaLineList = hiraganaService.getHiraganaLine(hiraganaLine);
		return hiraganaLineList;
	}
	
	
	// 히라가나 퀴즈 결과하고 진행도를 저장한다
	@RequestMapping(value="/newGradeAndOneMoreTime")
	public String newGradeAndOneMoreTime(GradeVO gradeVO) {
		gradeService.insertGrade(gradeVO);
		return "redirect: hiraganaTestForm?hiraganaLine=" + gradeVO.getHiraganaLine();
	}
	
	
	// 프린트 출력 화면으로 이동
	@RequestMapping(value="newGradeAndGohiraganaWrite")
	public String hiraganaWriteView(GradeVO gradeVO) {
		gradeService.insertGrade(gradeVO);
		return "hiraganaWrite?hiraganaLine=" + gradeVO.getHiraganaLine();
	}
}

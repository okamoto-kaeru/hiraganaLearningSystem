package com.kaeru.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kaeru.eLearning.board.BoardService;
import com.kaeru.eLearning.board.BoardVO;
import com.kaeru.eLearning.member.MemberVO;
import com.kaeru.eLearning.util.Criteria;
import com.kaeru.eLearning.util.PageMaker;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 게시판 글을 list에 담아 화면 표시
	@RequestMapping(value="/boardMain")
	public String getBoardList(Model model, Criteria criteria) {
		criteria.setNumPerPage(5);
		List<BoardVO> boardList = boardService.getBoardList(criteria);
		model.addAttribute("boardList", boardList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.getTotalBoard());
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/boardMain";
	}
	
	// 새글 작성 화면 표시
	@RequestMapping(value="/writeBoard", method=RequestMethod.GET)
	public String writeBoardView(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("jump", "writeBoard");
			return "member/login";
		} else {
			return "board/writeBoard";
		}
	}
	
	// 새글 등록후 게시글 표시
	@RequestMapping(value="/writeBoard", method=RequestMethod.POST)
	public String writeBoardAction(BoardVO vo, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		vo.setWriterId(loginUser.getMemberId());
		boardService.writeBoard(vo);
		
		return "redirect:boardMain";
			
	}
	
	// 게시판 한개의 정보를 조회
	@RequestMapping(value="/getBoard")
	public String getBoardView(@RequestParam(value="bseq") int bseq, Model model) {
		// 게시판 정보
		BoardVO board = boardService.getBoard(bseq);
		
		// 줄 바꾸기가 그대로 표시할 수 있게 해줌
		String content = board.getContent();
		content = content.replaceAll("\r\n", "<br>");
		board.setContent(content);
		
		// 댓글 정보
		List<BoardVO> rep = boardService.getReply(bseq);
		
		// model에 저장
		model.addAttribute("board", board);
		model.addAttribute("rep", rep);
		
		return "board/boardDetail";
	}
	
	// repWrite 요청을 받으면, reply를 DB에 저장후 다시 댓글 작성한 게시판에 이동
	@RequestMapping(value="/repWrite")
	public String replyWriteAction(BoardVO rep, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("jump", "getBoard");
			model.addAttribute("rep", rep);
			model.addAttribute("bseq", rep.getBseq());
			return "member/login";
		} else {
			rep.setReplyId(loginUser.getMemberId());
			boardService.replyBoard(rep);
			return "redirect:getBoard?bseq=" + rep.getBseq();
		}
	}
	
	
	// 게시글 수정, 삭제 화면으로 이동
	@RequestMapping(value="/modifyBoard")
	public String modifyBoardView(@RequestParam(value="bseq") int bseq, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("jump", "modifyBoard");
			model.addAttribute("bseq", bseq);
			return "member/login";
		} else {
			BoardVO board = boardService.getBoard(bseq);
			model.addAttribute("board", board);
			return "board/modifyBoard";
		}
	}
	
	
	// 게시글 삭제
	@RequestMapping(value="deleteBoard")
	public String deleteBoard(@RequestParam(value="bseq") int bseq, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("jump", "modifyBoard");
			model.addAttribute("bseq", bseq);
			return "member/login";
		} else {
			boardService.deleteBoard(bseq);
			return "redirect:boardMain";
		}
	}
	
	// 게시글 수정
	@RequestMapping(value="/updateBoard")
	public String updateBoard(BoardVO vo, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

		vo.setWriterId(loginUser.getMemberId());
		boardService.updateBoard(vo);
		return "redirect:getBoard?bseq=" + vo.getBseq();
	}
	
	// 댓글 삭제
	@RequestMapping(value="/deleteReply")
	public String deleteReply(BoardVO vo, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("jump", "modifyBoard");
			model.addAttribute("bseq", vo.getBseq());
			return "member/login";
		} else {
			vo.setReplyId(loginUser.getMemberId());
			boardService.deleteReply(vo);
			return "redirect:getBoard?bseq=" + vo.getBseq();
		}
	}
}

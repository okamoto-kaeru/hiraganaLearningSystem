package com.kaeru.view.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kaeru.eLearning.board.BoardService;
import com.kaeru.eLearning.board.BoardVO;
import com.kaeru.eLearning.member.MemberVO;
import com.kaeru.eLearning.order.OrderVO;
import com.kaeru.eLearning.product.ProductService;
import com.kaeru.eLearning.product.ProductVO;
import com.kaeru.eLearning.util.Criteria;
import com.kaeru.eLearning.util.PageMaker;
import com.kaeru.eLearning.worker.WorkerService;
import com.kaeru.eLearning.worker.WorkerVO;

@SessionAttributes("adminUser")
@Controller
public class AdminController {
	
	@Autowired
	private WorkerService workerService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	public String adminLogin() {
		return "admin/adminLogin";
	}
	
	// 관리자 로그인 기능
	@RequestMapping(value="/adminLogin", method=RequestMethod.POST)
	public String adminLogin(WorkerVO vo, Model model) {
		int result = workerService.isWorker(vo);
		if(result == 1) { // id, password가 일치
			WorkerVO adminUser = workerService.getWorker(vo);
			model.addAttribute("adminUser", adminUser);
			return "redirect:adminProduct";
		} else if(result == 0) {	// password가 틀름
			model.addAttribute("message", "비밀번호가 틀렸습니다.");
			return "admin/adminLogin";
		} else {
			model.addAttribute("message", "아이디가 존재하지 않습니다.");
			return "admin/adminLogin";
		}
	}
	
	
	// 로그아웃
	@RequestMapping(value="/adminLogout")
	public String adminLogout(SessionStatus status) {
		status.setComplete();
		return "admin/adminLogin";
	}
	
	
	// -------------- product 관련 -------------------
	// productList 표시
	@RequestMapping(value="/adminProduct")
	public String getProductList(@RequestParam(value="productName", defaultValue="") String productName, Model model, Criteria criteria) {
		List<ProductVO> productList = workerService.getProductList(productName, criteria);
		model.addAttribute("productList", productList);
		model.addAttribute("productName", productName);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(workerService.getTotalProduct(productName));
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/adminProduct/adminProduct";
	}
	
	
	// 상품 상세 정보
	@RequestMapping(value="adminProductDetail")
	public String adminProductDetailView(@RequestParam(value="pseq") int pseq, Model model) {
		ProductVO product = productService.getProductByPseq(pseq);
		model.addAttribute("product", product);
		return "admin/adminProduct/adminProductDetail";
	}
	
	
	// 새 상품 추가 화면 표시
	@RequestMapping(value="insertProduct", method=RequestMethod.GET)
	public String insertProductView() {
		return "admin/adminProduct/insertProductForm";
	}
	
	// 새 상품 추가 기능
	@RequestMapping(value="insertProduct", method=RequestMethod.POST)
	public String insertProductAction(@RequestParam(value="productImage") MultipartFile uploadFile, ProductVO vo, Model model, HttpSession session) {
		String fileName= "";
		
		if(!uploadFile.isEmpty()) {	// 상품 이미지가 업로드 됨
			String rootPath = session.getServletContext().getRealPath("WEB-INF/resource/images/productImages/");
			
			// logging용
			System.out.println("---------------------------------------------");
			System.out.println("project root path: " + rootPath);
			System.out.println("---------------------------------------------");
			
			fileName = uploadFile.getOriginalFilename();
			File file = new File(rootPath + fileName);
			try {
				uploadFile.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		vo.setImage(fileName);
		
		if(vo.getUseyn() == null) {
			vo.setUseyn("n");
		}
		workerService.insertProduct(vo);
		return "redirect:adminProduct";
	}
	
	
	// 상품정보 수정 화면 표시
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProductView(@RequestParam(value="pseq") int pseq, Model model) {
		ProductVO vo = productService.getProductByPseq(pseq);
		model.addAttribute("product", vo);
		return "admin/adminProduct/updateProductForm";
	}
	
	
	// 상품정보 수정
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct(@RequestParam(value="productImage") MultipartFile uploadFile,
								@RequestParam(value="oldFileImage", defaultValue = "") String oldFileImage,
								 ProductVO vo, HttpSession session) {
		String fileName = "";
		
		if(!uploadFile.isEmpty()) {
			String rootPath = session.getServletContext().getRealPath("WEB-INF/resource/images/productImages/");
			
			fileName = uploadFile.getOriginalFilename();
			
			File file = new File(rootPath + fileName);
			
			try {
				uploadFile.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(fileName.equals("")) {
			vo.setImage(oldFileImage);
		} else {
			vo.setImage(fileName);
		}
		
		if(vo.getUseyn() == null) {
			vo.setUseyn("n");
		}
		workerService.updateProduct(vo);
		return "redirect:adminProductDetail?pseq=" + vo.getPseq();
	}
	
	
	
	// ----------------- 주문관리 ----------------------
	// 주문 리스트 표시
	@RequestMapping(value="adminOrderList")
	public String adminOrderList(@RequestParam(value="memberName", defaultValue="") String memberName, Model model, Criteria criteria) {
		List<OrderVO> orderList = workerService.getOrderList(memberName, criteria);
		model.addAttribute("orderList", orderList);
		model.addAttribute("memberName", memberName);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		
		int productCount = workerService.getTotalOrder(memberName);		
		pageMaker.setTotalCount(productCount);
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/adminOrder/adminOrderList";
	}
	
	// 주문 처리후 result를 처리로 변경
	@RequestMapping(value="updateOrderDetail")
	public String updateOrder(@RequestParam(value="odseq") int[] odseqArr) {
		for(int odseq : odseqArr) {
			workerService.updateOrderDetail(odseq);
		}
		return "redirect:adminOrderList";
	}
	
	
	// ----------------- 회원관리 ----------------------
	// 전회원 리스트 표시
	@RequestMapping(value="memberList")
	public String getMemberList(@RequestParam(value="memberName", defaultValue="") String memberName, Model model, Criteria criteria) {
		List<MemberVO> memberList = workerService.getMemberList(memberName, criteria);
		model.addAttribute("memberList", memberList);
		model.addAttribute("memberName", memberName);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(workerService.getTotalMember(memberName));
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/memberManagement/memberManagement";
	}
	
	
	// 회원 계정을 정지하거나 다시 활성화하는 메소드
	@RequestMapping(value="updateMember")
	public String updateMember(MemberVO vo) {
		if(vo.getUseyn().equals("y")) {
			vo.setUseyn("n");
		} else {
			vo.setUseyn("y");
		}
		workerService.updateMember(vo);
		return "redirect:memberList";
	}
	
	
	
	// ----------------- 게시판 관리 ----------------------
	// 게시글 작성자 이름으로 검색하고 표시
	@RequestMapping(value="adminBoardList")
	public String getBoardListByWriterId(@RequestParam(value="writerId", defaultValue="") String writerId, Model model, Criteria criteria) {
		criteria.setNumPerPage(5);
		List<BoardVO> boardList = workerService.getBoardListByWriterId(writerId, criteria);
		model.addAttribute("boardList", boardList);
		model.addAttribute("writerId", writerId);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(workerService.getTotalBoard(writerId));
		
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/adminBoard/adminBoardList";
	}
	
	@RequestMapping(value="getBoardAdmin")
	public String getBoardAdmin(@RequestParam(value="bseq") int bseq, Model model) {
		// 게시판 정보
		BoardVO board = boardService.getBoard(bseq);
		
		// 줄 바꾸기가 그대로 표시할 수 있게 해줌
		String content = board.getContent();
		content = content.replaceAll("\r\n", "<br>");
		board.setContent(content);
		
		// 댓글 정보
		List<BoardVO> rep = boardService.getReply(bseq);
		
		model.addAttribute("board", board);
		model.addAttribute("rep", rep);
		
		return "admin/adminBoard/adminBoardDetail";
	}
	
	
	// 게시글 삭제
	@RequestMapping(value="deleteBoardAdmin")
	public String deleteBoard(@RequestParam(value="bseq") int bseq, HttpSession session) {
		boardService.deleteBoard(bseq);
		return "redirect:adminBoardList";
	}
	

	
	// 댓글 삭제
	@RequestMapping(value="/deleteReplyAdmin")
	public String deleteReply(BoardVO vo, HttpSession session) {
		boardService.deleteReply(vo);
		System.out.println(vo);
		return "redirect:getBoardAdmin?bseq=" + vo.getBseq();
	}
}
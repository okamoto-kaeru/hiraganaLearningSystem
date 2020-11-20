package com.kaeru.view.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kaeru.eLearning.cart.CartService;
import com.kaeru.eLearning.cart.CartVO;
import com.kaeru.eLearning.member.MemberVO;
import com.kaeru.eLearning.order.OrderService;
import com.kaeru.eLearning.order.OrderVO;
import com.kaeru.eLearning.product.ProductService;
import com.kaeru.eLearning.product.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired 
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	// 쇼핑 페이지 표시
	@RequestMapping("/shopping")
	public String shoppingView(Model model) {
		List<ProductVO> newProductList = productService.getNewProduct();
		model.addAttribute("newProductList", newProductList);
		
		List<ProductVO> bestProductList = productService.getBestProduct();
		model.addAttribute("bestProductList", bestProductList);
		return "shopping/productShopping";
	}
	
	
	// 신제품 5개를 조회
	@RequestMapping(value="/newProduct", method=RequestMethod.GET)
	public String getProductList(Model model) {
		List<ProductVO> productList = productService.getNewProduct();
		model.addAttribute("productList", productList);
		return "shopping/ProductShopping";
	}
	
	
	// 종류 별로 상품 표시
	@RequestMapping(value="/kindList")
	public String getProductListByKind(@RequestParam(value="kind") String kind, Model model) {
		List<ProductVO> kindList = productService.getProductListByKind(kind);
		model.addAttribute("kindList", kindList);
		return "shopping/productKind";
	}
	
	
	// 상품 상세 화면 표시
	@RequestMapping(value="/productDetail", method=RequestMethod.GET)
	public String productDetailView(@RequestParam(value="pseq") int pseq, Model model) {
		ProductVO productVO = productService.getProductByPseq(pseq);
		model.addAttribute("productVO", productVO);
		return "shopping/productDetail";
	}

	
	// 장바구니에 상품 담기
	@RequestMapping(value="/putCart")
	public String putCart(CartVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "member/login";
		} else {
			vo.setMemberId(loginUser.getMemberId());
			cartService.insertCart(vo);
			return "redirect:cartList";
		}
		
	}
	
	// 장바구니에 있는 상품을 모두 조회
	@RequestMapping(value="/cartList")
	public String getCartList(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "member/login";
		} else {
			String memberId = loginUser.getMemberId();
			List<CartVO> cartList = cartService.getCartList(memberId);
			System.out.println("cartList :" + cartList);
			model.addAttribute("cartList", cartList);
			
			int totalPrice = 0;
			for(CartVO cartVO : cartList) {
				totalPrice += cartVO.getPrice2();
			}
			
			model.addAttribute("totalPrice", totalPrice);
			return "mypage/cartList";
		}
	}
	
	// 장바구니에서 상품 취소 처리
	@RequestMapping(value="/deleteCart")
	public String deleteCart(@RequestParam(value="cseq", defaultValue="") int[] cseqArr) {
		for(int cseq : cseqArr) {
			cartService.deleteCart(cseq);
		}
		return "redirect:cartList";
	}
	
	
	// 장바구니에 있는 상품을 주문 처리
	@RequestMapping(value="/insertOrder")
	public String insertOrder(HttpSession session, OrderVO vo, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "member/login";
		} else {
			// oseq의 최대값을 조회
			int maxOseq = orderService.getMaxOseq();
			
			// orders 테이블에 주문자를 먼저 놓어 준다.
			String memberId = loginUser.getMemberId();
			vo.setMemberId(memberId);
			vo.setOseq(maxOseq + 1);
			orderService.insertOrders(vo);
			
			// cartList를 조회
			List<CartVO> cartList = cartService.getCartList(memberId);
			
			// 장바구니에 있는 각 상세 주문 정보를 order_detail 테이블에 저장
			for(CartVO cartVO : cartList) {
				vo.setPseq(cartVO.getPseq());
				vo.setQuantity(cartVO.getQuantity());
				orderService.insertOrderDetail(vo);
				cartService.updateCart(cartVO);
			}
			
			model.addAttribute("oseq", maxOseq + 1);
			return "redirect:orderedNowList";
		}
	}
	
	
	// 주문한 내역 조회
	@RequestMapping(value="/orderedNowList")
	public String orderedNowListView(@RequestParam(value="oseq") int oseq, OrderVO orderVO, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "member/login";
		} else {
			// 지금 주문한 내역을 저장
			orderVO.setMemberId(loginUser.getMemberId());
			orderVO.setOseq(oseq);
			List<OrderVO> orderList = orderService.getOrderedNow(orderVO);
			
			
			
			model.addAttribute("orderList", orderList);
			
			// 각 주문 가격을 더한다.
			int totalPrice = 0;
			for(OrderVO vo : orderList) {
				totalPrice += vo.getPrice2() * vo.getQuantity();
			}
			model.addAttribute("totalPrice", totalPrice);
			
			return "mypage/orderedNowList";
		}
	}
	
	
	// 발송 처리를 기다리는 주문 리스트 조회
	@RequestMapping(value="/orderList")
	public String orderListView(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "member/login";
		} else {
			// 발송 미처리의 주문번호를 조회 List에 담는다.
			String memberId = loginUser.getMemberId();
			List<Integer> oseqList = orderService.getOrderNumber(memberId);
			
			// 화면에 출력 하기 위해 orderList를 만든다.
			List<OrderVO> orderList = new ArrayList<>();
			
			// 각 주문번호의 상품을 조회하고, orderList에 저장
			for(int oseq : oseqList) {
				OrderVO orderVO = new OrderVO();
				orderVO.setMemberId(memberId);
				orderVO.setOseq(oseq);
				List<OrderVO> list = orderService.getOrderedNow(orderVO);
				
				// 등록일 저장
				orderVO.setIndate(list.get(0).getIndate());
				
				// 상품 이름 저장
				String name = list.get(0).getProductName();
				if(list.size() > 1) {
					name = name + " 외 " + (list.size() - 1) + "개 상품"; 
				}
				orderVO.setProductName(name);
				
				// 상품 가격 합계 저장
				int totalPrice = 0;
				for(OrderVO item : list) {
					totalPrice += item.getPrice2() * item.getQuantity();
				}
				orderVO.setPrice2(totalPrice);
				
				orderList.add(orderVO);
			}
			
			model.addAttribute("orderList", orderList);
			return "mypage/orderList";
		}
	}
	
	
	// 주문 상세 정보 조회
	@RequestMapping(value="/orderDetail")
	public String orderDetailView(OrderVO orderVO, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "member/login";
		} else {
			orderVO.setMemberId(loginUser.getMemberId());
			List<OrderVO> orderList = orderService.getOrdered(orderVO);
			
			model.addAttribute("orderList", orderList);
			
			
			String result = "2";
			
			// 각 주문 가격을 더한다.
			int totalPrice = 0;
			for(OrderVO vo : orderList) {
				totalPrice += vo.getPrice2() * vo.getQuantity();
				if(vo.getResult().equals("1")) { // 발송 처리 정보를 보고, 하나라도 안되면, 준비중으로 하기
					result = "1";
				}
			}
			
			// 등록 일자등 공통 정보를 조회하기 위해서 첫번째 요소를 저장
			OrderVO detailInfo = orderList.get(0);
			detailInfo.setResult(result);
			model.addAttribute("detailInfo", detailInfo);
			
			model.addAttribute("totalPrice", totalPrice);
			
			return "mypage/orderDetail";
		}
	}
	
	// 전체 주문 리스트(주문 미처리 + 주문 처리)
	@RequestMapping(value="/orderListAll")
	public String orderListAllView(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "member/login";
		} else {
			// 발송 미처리의 주문번호를 조회 List에 담는다.
			String memberId = loginUser.getMemberId();
			List<Integer> oseqList = orderService.getAllOrderNumber(memberId);
			
			// 화면에 출력 하기 위해 orderList를 만든다.
			List<OrderVO> orderList = new ArrayList<>();
			
			// 각 주문번호의 상품을 조회하고, orderList에 저장
			for(int oseq : oseqList) {
				OrderVO orderVO = new OrderVO();
				orderVO.setMemberId(memberId);
				orderVO.setOseq(oseq);
				List<OrderVO> list = orderService.getOrdered(orderVO);
				
				// 등록일 저장
				orderVO.setIndate(list.get(0).getIndate());
				
				// 상품 이름 저장
				String name = list.get(0).getProductName();
				if(list.size() > 1) {
					name = name + " 외 " + (list.size() - 1) + "개 상품"; 
				}
				orderVO.setProductName(name);
				
				// 상품 가격 합계 저장
				int totalPrice = 0;
				for(OrderVO item : list) {
					totalPrice += item.getPrice2() * item.getQuantity();
				}
				orderVO.setPrice2(totalPrice);
				
				// 발송 처리 여부 저장
				orderVO.setResult(list.get(0).getResult());
				
				orderList.add(orderVO);
			}
			model.addAttribute("orderList", orderList);
			
			return "mypage/orderListAll";
		}
	}
}

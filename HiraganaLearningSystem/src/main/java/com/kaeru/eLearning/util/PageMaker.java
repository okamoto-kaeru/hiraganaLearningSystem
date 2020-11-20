package com.kaeru.eLearning.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private Criteria criteria;	// 현재 페이지 정보
	private int totalCount;	 	// 전체 게시글 수
	private int startPage;		// 지금 페이지의 시작 페이지 번호     [3] [4] [5] [6] [7] : 의 [3]
	private int endPage;		// 지금 페이지의 끝 페이지 번호						   : 의 [7]
	private boolean prev;	    // 이전 페이지의 유무
	private boolean next;		// 다음 페이지의 유무
	
	private int displayPageNumber = 5;		// 화면 하단에 보이는 페이지의 수
	private int realEndPage;		// 전페 항목 수에 따른 실제 마지막 페이지의 번호
	
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	public int getTotalCount() {
		return totalCount;
	}
	
	// 조회한 전페 항목을 저장할 때 각 멤버변수를 초기화 수행
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		memberInit();
	}
	
	// 멤버 변수에 초기값 설정
	public void memberInit() {
		endPage = (int)Math.ceil(criteria.getPageNumberNow() / (double)displayPageNumber) * displayPageNumber;
		
		startPage = endPage - displayPageNumber + 1;
		
		realEndPage = (int)Math.ceil(totalCount / (double)criteria.getNumPerPage());
		
		// 실제 마지막 페이지와 계산한 마지막 페이지가 값이 틀리면 마지막 페이지를 realEndPage로 수정함
		if(endPage > realEndPage) {
			endPage = realEndPage;
		}
		
		prev = (startPage == 1 ? false : true);
		next = (totalCount > endPage * criteria.getNumPerPage() ? true : false);
	}
	
	// 페이지번호를 입력 받아 admin_product_list의 쿼리 스트링을 만들어 주는 메소드
	public String makeQuery(int page) {
		UriComponents uriComp = UriComponentsBuilder.newInstance().queryParam("pageNumberNow", page).queryParam("numPerPage", criteria.getNumPerPage()).build();
		return uriComp.toString();
	}
	
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNumber() {
		return displayPageNumber;
	}
	public void setDisplayPageNumber(int displayPageNumber) {
		this.displayPageNumber = displayPageNumber;
	}
	public int getRealEndPage() {
		return realEndPage;
	}
	public void setRealEndPage(int realEndPage) {
		this.realEndPage = realEndPage;
	}
	@Override
	public String toString() {
		return "PageMaker [criteria=" + criteria + ", totalCount=" + totalCount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayPageNumber="
				+ displayPageNumber + ", realEndPage=" + realEndPage + "]";
	}
	
	
}

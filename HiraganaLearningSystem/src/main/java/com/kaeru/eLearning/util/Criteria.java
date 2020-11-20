package com.kaeru.eLearning.util;

//	현제 페이지와 관련된 정보를 저장하는 클래스
public class Criteria {
	private int pageNumberNow;
	private int numPerPage;
	final int AMOUNT = 30;	// 최재 항목수
	
	public Criteria(int pageNumberNow, int numPerPage) {
		this.pageNumberNow = pageNumberNow;
		this.numPerPage = numPerPage;
	}
	
	public Criteria() {
		this(1, 10);
	}
	
	public int getPageNumberNow() {
		return pageNumberNow;
	}
	
	public void setPageNumberNow(int pageNumberNow) {
		if(pageNumberNow <= 0) {
			pageNumberNow = 1;
		} else {
			this.pageNumberNow = pageNumberNow;
		}
		this.pageNumberNow = pageNumberNow;
	}
	
	public int getNumPerPage() {
		return numPerPage;
	}
	
	public void setNumPerPage(int numPerPage) {
		if(numPerPage <= 0 || numPerPage > AMOUNT) {
			this.numPerPage = AMOUNT;
		} else {
			this.numPerPage = numPerPage;
		}
		this.numPerPage = numPerPage;
	}
	
	// 현제 페이지의 시작 항목 번호를 반환
	public int getStartPage() {
		return (this.pageNumberNow - 1) * this.numPerPage + 1;
	}

	@Override
	public String toString() {
		return "Criteria [pageNumberNow=" + pageNumberNow + ", numPerPage=" + numPerPage + ", 최대 항목수=" + AMOUNT + "]";
	}
	
	
}

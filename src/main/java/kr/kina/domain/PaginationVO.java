package kr.kina.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PaginationVO {

	private int count;  
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 16;
	
	private Criteria cri;
	
	public PaginationVO(){}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		calcData();
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

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	
	public void calcData(){  
		endPage = (int) (Math.ceil(cri.getPage()/ (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(count / (double) cri.getPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		
		next = endPage * cri.getPageNum() >= count ? false : true;
	}
	
	public String makeQuery(int page){
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("pageNum", cri.getPageNum()).build();
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page){
		
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
					.queryParam("keyword", cri.getKeyword())
					.queryParam("page", page)
					.queryParam("pageNum", cri.getPageNum())
					.build();		
		return uriComponents.toString();
	}
	
	@Override
	public String toString() {
		return "[totalCount= "+ count + ", startPage= " + startPage+ ", endPage= " +endPage+ "]"; 
	}
}

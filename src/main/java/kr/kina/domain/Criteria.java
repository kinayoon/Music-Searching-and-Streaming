package kr.kina.domain;

public class Criteria {

	private int page;   //1
	private int pageNum; //12
	private String keyword; 

	public Criteria(){
		this.page = 1;
		this.pageNum = 12;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if (page <= 0){
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	
	public void setPageNum(int pagenum) {
		if(pagenum <= 0 || pagenum > 100){
			this.pageNum = 12;
			return;
		}
		this.pageNum = pagenum;
	}
	
	public int getPageStart(){
		return (this.page-1) * pageNum;
	}
	
	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String searchText) {
		this.keyword = searchText;
	}
	
	@Override
	public String toString(){
		return "Criteria [page=" + page + "," + "pageNum=" + pageNum + "]";
	} 
	
	
}

package kr.co.jhta.pony.util;

/*
	페이징처리를 할 수 있는 Criteria.class
 */

public class Criteria {
	
	// DB에서 페이지 처리된 데이터를 가져오는데 필요한 정보
	// 현재 페이지, 한 페이지에 표시할 데이터의 갯수(perPageNum)
	private int pageNum, perPageNum;

	// 스킵할 게시글 수( (pageNum-1) * pagePerNum ) 
	private int skip;

	/* 기본 생성자 */
	public Criteria() {
		// 초기값 (나중에 전달되는 값으로 바뀜. 전달되는 값이 없으면 유지)

		pageNum = 1;

		perPageNum = 10;


	}// end of Const.

	/* 생성자 => 원하는 pageNum, 원하는 perPageNum */
	public Criteria(int page, int perPageNum) {
		
		this.pageNum = page;
		this.perPageNum = perPageNum;
		this.skip = (pageNum-1)*perPageNum;
		
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.perPageNum;
		
		this.pageNum = pageNum;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.skip = (this.pageNum-1)*perPageNum;
		this.perPageNum = perPageNum;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", perPageNum=" + perPageNum + ", skip=" + skip + "]";
	}
	

}// end of class Criteria{}

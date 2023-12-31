package kr.co.jhta.pony.dto;

import kr.co.jhta.pony.util.Criteria;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
/* 페이징 처리값 화면에 구현하기 위한 DTO */
public class PageMakeDTO {

	/* 페이지 시작 번호 */
	private int startPage;
	
	/* 페이지 끝 번호 */
	private int endPage;
	
	/* 이전, 다음 페이지 존재유무 확인 */
	private boolean prev, next;
	
	/* 전체 게시글 수 */
	private int total;
		
	/* 현재 페이지(pageNum), 페이지당 보여줄 게시물 수(perPageNum), 
	 * 검색키워드(keyword), 검색 종류(type) 정보 */
	private Criteria cri;
	
	
	/* 생성자(클래스 호출 시 각 변수 값 초기화) */
	public PageMakeDTO(Criteria cri, int total) {
		
		/* cri, total 초기화 */
		this.cri = cri;
		this.total = total;
		
		/* 페이지 끝 번호 */
		/* 현재 페이지 / 10 의 결과를 올림하고 다시 10을 곱해준다.
		   현재 페이지가 7인경우 endPage 값이 10, 현재 페이지 23인 경우 endPage 30*/
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		
		/* 페이지 시작 번호 */
		this.startPage = this.endPage - 9;

		/* 전체 마지막 페이지 번호 */
		/* (전체 게시글 수 / 화면에 표시될 게시물 수)의 값을 Math.ceil()을 통해 올림해줌.
		   (int형/int형) 계산 시 소수점이 나오는 경우에도 소수점을 없애기 때문에 1.0값을 곱해줌으로서 
		   int형을 double 타입으로 형변환하고 getPerPageNum로 나눈 결과 또한 형변환하여
		   값이 소수점으로 출력될 수 있도록 함 */
		int realEnd = (int)(Math.ceil(total * 1.0/cri.getPerPageNum()));
	
		/* 페이지 끝 번호 유효성 체크 */
		/* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우 
		   화면의 마지막 페이지를 진짜 마지막 페이지 수로 조정 */
		if(realEnd < endPage) {
			this.endPage = realEnd;
		}
		
		/* 이전 버튼 값 초기화 */
		this.prev = this.startPage > 1;
		
		/* 다음 버튼 값 초기화 */
		this.next = this.endPage < realEnd;
		
	}
	
}


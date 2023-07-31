package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.util.Criteria;

public interface QuestionService {

	/* 고객 */
	
	// 내가 쓴 1:1 문의 조회
	public List<QuestionDTO> selectAll(int startNo, int endNo, int memberNo);
	public int getTotal();
	public QuestionDTO selectOne(int questionNo);
	public void deleteOne(QuestionDTO dto);
	public void insertOne(QuestionDTO dto);
	
	
	/* 관리자 */
	
	// 질문 전체 목록(페이징)
	public List<QuestionDTO> selectAllByAdmin(Criteria cri);

	public void qnaAddOne(QuestionDTO dto);
	// 답변상태 변경
	public void updateAnswerStatus(QuestionDTO qdto);
	// 체크박스 선택 값 삭제
	public void deletecheck(String no);	
	// 답변 수정
	public void qnamodifyOne(QuestionDTO dto);

}

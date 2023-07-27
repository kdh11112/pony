package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dto.QuestionDTO;

public interface QuestionService {

	public List<QuestionDTO> selectAll(int startNo, int endNo, int memberNo);
	public int getTotal();
	public QuestionDTO selectOne(int questionNo);
	public void deleteOne(QuestionDTO dto);
	public void insertOne(QuestionDTO dto);

	public List<QuestionDTO>  selectAllByAdmin(int startNo, int endNo);
	public void qnaAddOne(QuestionDTO dto);

}

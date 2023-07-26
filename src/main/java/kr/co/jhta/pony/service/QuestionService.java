package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dto.QuestionDTO;

public interface QuestionService {

	public List<QuestionDTO> selectAll(int startNo, int endNo);
	public int getTotal();
	public QuestionDTO selectOne(int questionNo);
	public void deleteOne(QuestionDTO dto);
}

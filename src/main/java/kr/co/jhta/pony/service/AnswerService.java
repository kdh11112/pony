package kr.co.jhta.pony.service;

import kr.co.jhta.pony.dto.AnswerDTO;

public interface AnswerService {
	public void insertAnswer(AnswerDTO dto);
	public AnswerDTO selectOne(int questionNo);
}

package kr.co.jhta.pony.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.AnswerDAO;
import kr.co.jhta.pony.dto.AnswerDTO;

@Service
public class AnswerServiceImple implements AnswerService{

	@Autowired
	private AnswerDAO dao;

	@Override
	public void insertAnswer(AnswerDTO dto) {
		dao.insertAnswer(dto);
		
	}

	@Override
	public AnswerDTO selectOne(int questionNo) {
		return dao.selectOne(questionNo);
	}

	@Override
	public void deleteOne(int questionNo) {
		dao.deleteOne(questionNo);
		
	}

	
	
}

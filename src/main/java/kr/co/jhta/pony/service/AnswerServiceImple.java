package kr.co.jhta.pony.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.AnswerDAO;
import kr.co.jhta.pony.dto.AnswerDTO;

@Service
public class AnswerServiceImple implements AnswerService{

	@Autowired
	private AnswerDAO dao;

	@Override
	@Transactional
	public void insertAnswer(AnswerDTO dto) {
		dao.insertAnswer(dto);
	}

	@Override
	public AnswerDTO selectOne(int questionNo) {
		return dao.selectOne(questionNo);
	}

	@Override
	@Transactional
	public void deleteOne(int questionNo) {
		dao.deleteOne(questionNo);
		
	}

	@Override
	@Transactional
	public void modifyAnswer(AnswerDTO dto) {
		dao.modifyAnswer(dto);
		
	}

}

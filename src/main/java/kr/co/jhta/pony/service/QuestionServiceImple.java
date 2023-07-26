package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.QuestionDAO;
import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.dto.StartEnd;

@Service
public class QuestionServiceImple implements QuestionService {

	@Autowired
	private QuestionDAO dao;

	@Override
	public List<QuestionDTO> selectAll(int startNo, int endNo) {
		StartEnd se =  new StartEnd(startNo, endNo);
		return dao.getAll(se);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public QuestionDTO selectOne(int questionNo) {
		return dao.selectOne(questionNo);
	}

	@Override
	public void deleteOne(QuestionDTO dto) {
		dao.deleteOne(dto);
	}

	@Override
	public void insertOne(QuestionDTO dto) {
		dao.insertOne(dto);
		
	}
	
	
	
	
}

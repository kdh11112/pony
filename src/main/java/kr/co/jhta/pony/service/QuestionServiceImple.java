package kr.co.jhta.pony.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.QuestionDAO;
import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.dto.StartEnd;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QuestionServiceImple implements QuestionService {

	@Autowired
	private QuestionDAO dao;

	@Override
	public List<QuestionDTO> selectAll(int startNo, int endNo, int memberNo) {
		log.info(" 여기도 오고 있지 {} {} {}", startNo, endNo, memberNo);
		
		StartEnd se =  new StartEnd(startNo, endNo);
		HashMap<String, Object> map = new HashMap<>();
				map.put("memeberNo", memberNo);
				map.put("startNo", startNo);
				map.put("endNo", endNo);
		return dao.getAll(map);
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
	public List<QuestionDTO>  selectAllByAdmin(int startNo, int endNo) {

		StartEnd se =  new StartEnd(startNo, endNo);
		return dao.getAllByAdmin(se);
	}

	@Override
	public void qnaAddOne(QuestionDTO dto) {
		dao.qnaAddOne(dto);
	}
	
	
	
	
}

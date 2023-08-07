package kr.co.jhta.pony.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.PartDAO;
import kr.co.jhta.pony.dao.QuestionDAO;
import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.dto.StartEnd;
import kr.co.jhta.pony.util.Criteria;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QuestionServiceImple implements QuestionService {

	private final QuestionDAO qdao;
	
	@Autowired
	public QuestionServiceImple(QuestionDAO questiondao) {
		this.qdao = questiondao;
	}

	@Override
	public List<QuestionDTO> selectAll(int startNo, int endNo, int memberNo) {
		log.info(" 여기도 오고 있지 {} {} {}", startNo, endNo, memberNo);


		StartEnd se = new StartEnd(startNo, endNo);

		//StartEnd se =  new StartEnd(startNo, endNo);

		HashMap<String, Object> map = new HashMap<>();

				map.put("memberNo", memberNo);
				map.put("startNo", startNo);
				map.put("endNo", endNo);
				log.info("map : {} {} {} ", map, map.get("memberNo"), map.get("startNo"));

		return qdao.getAll(map);
	}

	@Override
	public int getTotal() {
		return qdao.getTotal();
	}

	@Override
	public QuestionDTO selectOne(int questionNo) {
		return qdao.selectOne(questionNo);
	}

	@Override
	@Transactional
	public void deleteOne(QuestionDTO dto) {
		qdao.deleteOne(dto);
	}

	@Override
	public void insertOne(QuestionDTO dto) {
		qdao.insertOne(dto);
	}

	public List<QuestionDTO> selectAllByAdmin(Criteria cri) {
		return qdao.getAllByAdmin(cri);
	}

	@Override
	@Transactional
	public void qnaAddOne(QuestionDTO dto) {
		qdao.qnaAddOne(dto);

	}

	@Override
	@Transactional
	public void updateAnswerStatus(QuestionDTO dto) {
		qdao.updateAnswerStatus(dto);
		
	}

	//체크박스 삭제
	@Override
	@Transactional
	public void deletecheck(String no) {
		qdao.deleteCheck(no);
	}
	
	@Override
	@Transactional
	public void qnamodifyOne(QuestionDTO dto) {
		qdao.qnaModifyOne(dto);
		
	}

	@Override
	public Object getqnaCount(int memberNo) {
		// TODO Auto-generated method stub
		return qdao.getqnaCount(memberNo);
	}


}

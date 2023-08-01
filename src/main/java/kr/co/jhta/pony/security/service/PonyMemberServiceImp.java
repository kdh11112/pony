package kr.co.jhta.pony.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.PonyMemberDAO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.dto.StartEnd;

@Service
public class PonyMemberServiceImp implements PonyMemberService {

	@Autowired
	PonyMemberDAO dao;
	
	@Override
	public void createMember(PonyMemberDTO dto) {
	
		dao.createPonyMember(dto);
		
	}

	@Override
	public PonyMemberDTO getMemberEmail(String email) {

		return dao.getMemberEmail(email);
	}

	@Override
	public int idChk(PonyMemberDTO dto) throws Exception {
		int result = dao.idChk(dto);
		return result;
	}
	
	@Override
	public Object selectAll(int startNo, int endNo) {
		StartEnd se =  new StartEnd(startNo, endNo);
		return dao.getAll(se); 
	}

	@Override
	public int getTotal() {
		
		return dao.getTotal();
	}

	@Override
	public void increaseHits(int questionNo) {
		dao.increaseHits(questionNo);
		
	}

	@Override
	public Object selectOne(int questionNo) {
		
		return dao.selectOne(questionNo);
	}
	

	@Override
	public void modifyOne(QuestionDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOne(QuestionDTO dto) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}

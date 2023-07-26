package kr.co.jhta.pony.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.PonyMemberDAO;
import kr.co.jhta.pony.dto.PonyMemberDTO;

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
	
	
}

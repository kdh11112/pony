package kr.co.jhta.pony.security.service;

import kr.co.jhta.pony.dto.PonyMemberDTO;

public interface PonyMemberService {

	public PonyMemberDTO getMemberEmail(String email);
	void createMember(PonyMemberDTO dto);
	
	public int idChk(PonyMemberDTO dto) throws Exception;
}

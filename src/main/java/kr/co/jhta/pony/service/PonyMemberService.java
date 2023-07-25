package kr.co.jhta.pony.service;

import kr.co.jhta.pony.dto.PonyMemberDTO;

public interface PonyMemberService {

	public PonyMemberDTO getMemberEmail(String email);
	void createMember(PonyMemberDTO dto);
}

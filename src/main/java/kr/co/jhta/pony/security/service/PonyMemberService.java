package kr.co.jhta.pony.security.service;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.QuestionDTO;

public interface PonyMemberService {

	public PonyMemberDTO getMemberEmail(String email);
	void createMember(PonyMemberDTO dto);
	
	public int idChk(PonyMemberDTO dto) throws Exception;
	
	public Object selectAll(int startNo, int endNo);
	public int getTotal();
	public void increaseHits(int questionNo);
	public Object selectOne(int questionNo);
	void modifyOne(QuestionDTO dto);
	void deleteOne(QuestionDTO dto);
	
}

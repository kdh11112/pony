package kr.co.jhta.pony.security.service;

import java.security.Principal;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.QuestionDTO;

public interface PonyMemberService {

	public PonyMemberDTO getMemberEmail(String email);
	void generateMember(PonyMemberDTO dto);
	
	public int idChk(PonyMemberDTO dto) throws Exception;
	
	public Object selectAll(int startNo, int endNo);
	public int getTotal();
	public void increaseHits(int questionNo);
	public Object selectOne(int questionNo);
	void modifyOne(QuestionDTO dto);
	void deleteOne(QuestionDTO dto);
	public PonyMemberDTO selectMem(int memberNo);
	public void myinfomodifyOne(PonyMemberDTO dto);
	public PonyMemberDTO selectMemAll(int memberNo);
	
	public void addUser(PonyMemberDTO dto);
	public String getPrincipalEmail(Principal principal);
	public Object getMemberPoint(int memberNo);
	
	
}

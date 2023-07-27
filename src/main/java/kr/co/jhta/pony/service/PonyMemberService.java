package kr.co.jhta.pony.service;


import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.QuestionDTO;

public interface PonyMemberService {

	public PonyMemberDTO getMemberEmail(String email);
	void createMember(PonyMemberDTO dto);
	public Object selectAll(int startNo, int endNo);
	public int getTotal();
	public void increaseHits(int questionNo);
	public Object selectOne(int questionNo);
	void modifyOne(QuestionDTO dto);
	void deleteOne(QuestionDTO dto);
}




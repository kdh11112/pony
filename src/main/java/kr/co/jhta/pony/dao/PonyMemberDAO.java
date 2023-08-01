package kr.co.jhta.pony.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.StartEnd;

@Mapper
@Repository
public interface PonyMemberDAO {
	public PonyMemberDTO getMemberEmail(String email);
	
	public PonyMemberDTO ponyMemberOne(String email);

	public void createPonyMember(PonyMemberDTO dto);

	public Object getAll(StartEnd se);

	public int getTotal();

	public void increaseHits(int noticeNo);

	public Object selectOne(int noticeNo);

	public void modifyOne(NoticeDTO dto);

	public void deleteOne(NoticeDTO dto);
	
	public int idChk(PonyMemberDTO dto) throws Exception;

	
	
}

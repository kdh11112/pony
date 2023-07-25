package kr.co.jhta.pony.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.ModelDTO;
import kr.co.jhta.pony.dto.PonyMemberDTO;

@Mapper
@Repository
public interface PonyMemberDAO {
	public PonyMemberDTO getMemberEmail(String email);
	
	public PonyMemberDTO ponyMemberOne(String email);

	public void createPonyMember(PonyMemberDTO dto);
	
	
	
}

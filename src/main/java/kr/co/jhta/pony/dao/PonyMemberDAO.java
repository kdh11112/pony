package kr.co.jhta.pony.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.PonyMemberDTO;

@Mapper
@Repository
public interface PonyMemberDAO {
	PonyMemberDTO getMemberByEmail(String email);

	void insertOne(PonyMemberDTO dto);

	void addRole(String email);
	
	
	
}

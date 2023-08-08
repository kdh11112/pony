package kr.co.jhta.pony.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.PonySocialMemberDTO;

@Mapper
@Repository
public interface PonySocialMemberDAO {
	
	public PonySocialMemberDTO createPonySocialMember(PonySocialMemberDTO dto);
	
}

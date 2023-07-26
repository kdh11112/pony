package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.AnswerDTO;
import kr.co.jhta.pony.dto.StartEnd;

@Repository
@Mapper
public interface AnswerDAO {
	List<AnswerDTO> getAll(StartEnd se);
	void insertAnswer(AnswerDTO dto);
	AnswerDTO selectOne(int questionNo);
	

}

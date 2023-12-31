package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.AnswerDTO;
import kr.co.jhta.pony.dto.StartEnd;
import kr.co.jhta.pony.util.Criteria;

@Repository
@Mapper
public interface AnswerDAO {
	
	List<AnswerDTO> getAll(Criteria cri);
	
	void insertAnswer(AnswerDTO dto);
	
	AnswerDTO selectOne(int questionNo);
	
	void deleteOne(int questionNo);
	
	void modifyAnswer(AnswerDTO dto);
	

}

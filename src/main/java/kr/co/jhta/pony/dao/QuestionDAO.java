package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.dto.StartEnd;

@Repository
@Mapper
public interface QuestionDAO {
	List<QuestionDTO> getAll(StartEnd se);
	QuestionDTO selectOne(int questionNo);
	int getTotal();
	void deleteOne(QuestionDTO dto);
	void insertOne(QuestionDTO dto);
}


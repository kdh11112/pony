package kr.co.jhta.pony.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.dto.StartEnd;

@Repository
@Mapper
public interface QuestionDAO {
	List<QuestionDTO> getAll(HashMap<String, Object> map);
	QuestionDTO selectOne(int questionNo);
	int getTotal();
	void deleteOne(QuestionDTO dto);
	void insertOne(QuestionDTO dto);

	List<QuestionDTO> getAllByAdmin(StartEnd se);
	void qnaAddOne(QuestionDTO dto);
	void qnaDeleteOne(QuestionDTO dto);
	void qnaModifyOne(QuestionDTO dto);
	void updateAnswerStatus(QuestionDTO dto);
	void deleteCheck(String no); //체크박스 삭제

}


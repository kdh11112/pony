package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.StartEnd;
import kr.co.jhta.pony.util.Criteria;


@Repository
@Mapper
public interface NoticeDAO {
	
	List<NoticeDTO> getAll(Criteria cri);
	
	NoticeDTO selectOne(int noticeNo);
	
	void modifyOne(NoticeDTO dto);
	
	void addOne(NoticeDTO dto);
	
	void deleteOne(NoticeDTO dto);
	
	int getTotal();
	
	void increaseHits(int noticeNo);
}

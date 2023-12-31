package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.util.Criteria;
 

public interface NoticeService {
	public List<NoticeDTO> selectAll(Criteria cri);

	public void addOne(NoticeDTO dto);
	
	public NoticeDTO selectOne(int noticeNo);
	
	public int getTotal();

	void increaseHits(int noticeNo);

	public void modifyOne(NoticeDTO dto);

	public void deleteOne(NoticeDTO dto);
}

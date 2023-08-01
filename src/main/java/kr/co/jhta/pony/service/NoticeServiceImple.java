package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.NoticeDAO;
import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.StartEnd;
import kr.co.jhta.pony.util.Criteria;
 
@Service
public class NoticeServiceImple implements NoticeService{

	@Autowired
	private NoticeDAO dao;
	
	@Override
	public List<NoticeDTO> selectAll(Criteria cri) {
		return dao.getAll(cri);
	}

	@Override
	public void addOne(NoticeDTO dto) {
		dao.addOne(dto);
		
	}

	@Override
	public NoticeDTO selectOne(int noticeNo) {
		
		return dao.selectOne(noticeNo);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public void increaseHits(int noticeNo) {
		dao.increaseHits(noticeNo);
		
	}

	@Override
	public void modifyOne(NoticeDTO dto) {
		dao.modifyOne(dto);
		
	}

	@Override
	public void deleteOne(NoticeDTO dto) {
		dao.deleteOne(dto);
		
	}



}

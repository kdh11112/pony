package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.NoticeDAO;
import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.StartEnd;

@Service
public class NoticeSerciceImple implements NoticeService{

	@Autowired
	private NoticeDAO dao;
	
	@Override
	public List<NoticeDTO> selectAll(int startNo, int endNo) {
		StartEnd se =  new StartEnd(startNo, endNo);
		return dao.getAll(se);
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


}

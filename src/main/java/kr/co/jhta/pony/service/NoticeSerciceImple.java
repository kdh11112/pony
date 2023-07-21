package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.jhta.pony.dao.NoticeDAO;
import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.StartEnd;

public class NoticeSerciceImple implements NoticeService{

	@Autowired
	private NoticeDAO dao;
	
	@Override
	public List<NoticeDTO> selectAll(int startNo, int endNo) {
		StartEnd se =  new StartEnd(startNo, endNo);
		return dao.getAll(se);
	}

}

package kr.co.jhta.pony.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.TestDriveDAO;
import kr.co.jhta.pony.dto.TestDriveDTO;

@Service
public class TestDriveServiceImple implements TestDriveService{
	
	@Autowired
	TestDriveDAO dao;
	
	@Override
	public void insertTestDriveSchedule(TestDriveDTO dto) {
		dao.insertTestDriveSchedule(dto);
	}

}

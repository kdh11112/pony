package kr.co.jhta.pony.service;

import java.util.List;

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

	@Override
	public List<TestDriveDTO> getTestDriveScheduleByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return dao.getTestDriveScheduleByMemberNo(memberNo);
	}

}

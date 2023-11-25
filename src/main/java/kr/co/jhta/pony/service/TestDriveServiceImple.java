package kr.co.jhta.pony.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.TestDriveDAO;
import kr.co.jhta.pony.dto.TestDriveDTO;

@Service
public class TestDriveServiceImple implements TestDriveService{
	
	@Autowired
	TestDriveDAO dao;
	

	// 마감된 시승일정 달력에 표시
	@Override
	public List<TestDriveDTO> showTestDriveSchedule() {
		return dao.showTestDriveSchedule();
	}
	
	//시승신청 추가
	@Override
	@Transactional
	public void insertTestDriveSchedule(TestDriveDTO dto) {
		dao.insertTestDriveSchedule(dto);
	}
	
	// 동일한 데이터가 있는지 확인
	@Override
	@Transactional
	public boolean checkTestDriveSchedule(int shopNo, String testDriveSchedule, String testDriveTime) {
		int count = dao.checkTestDriveSchedule(shopNo, testDriveSchedule, testDriveTime);
		return count > 0;
	}

	@Override
	public void deleteTestDrive(int testDriveNo) {
		// TODO Auto-generated method stub
		dao.deleteTestDrive(testDriveNo);
	}


	@Override
	public Object testDriveCount(int memberNo) {
		// TODO Auto-generated method stub
		return dao.testDriveCount(memberNo);
	}


	@Override
	public void updatedTestDrive(TestDriveDTO dto) {
		dao.updatedTestDrive(dto);
		
	}

}

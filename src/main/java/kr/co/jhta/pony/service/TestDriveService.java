package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.TestDriveDTO;

public interface TestDriveService {

	
	public List<TestDriveDTO> showTestDriveSchedule(); // 마감된 시승일정 달력에 표시

	public void insertTestDriveSchedule(TestDriveDTO dto);
	public void updatedTestDrive(TestDriveDTO dto); //마이페이지의 시승신청내역 수정

	 
	public void deleteTestDrive(int TestDriveNo); //마이페이지의 시승신청내역 삭제

	public Object testDriveCount(int memberNo); //마이페이지의 사용자의 시승신청내역 갯수
	
}

package kr.co.jhta.pony.service;

import kr.co.jhta.pony.dto.TestDriveDTO;

public interface TestDriveService {
	public void insertTestDriveSchedule(TestDriveDTO dto);
	public void updatedTestDrive(int memberNo); //마이페이지의 시승신청내역 수정
	 
	public void deleteTestDrive(int TestDriveNo); //마이페이지의 시승신청내역 삭제

	public Object testDriveCount(int memberNo); //마이페이지의 사용자의 시승신청내역 갯수
}

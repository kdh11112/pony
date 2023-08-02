package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.TestDriveDTO;

public interface TestDriveService {
	public void insertTestDriveSchedule(TestDriveDTO dto);

	public List<TestDriveDTO> getTestDriveScheduleByMemberNo(int memberNo);
}

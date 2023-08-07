package kr.co.jhta.pony.service;



import kr.co.jhta.pony.dto.TestDriveDTO;

public interface TestDriveService {
	public void insertTestDriveSchedule(TestDriveDTO dto);

	public void updatedTestDrive(int memberNo);

	public void deleteTestDrive(int TestDriveNo);
}

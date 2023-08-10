package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.TestDriveApplicationReservationDetailsDTO;

public interface TestDriveApplicationReservationDetailsService {

	List<TestDriveApplicationReservationDetailsDTO> getTestDriveScheduleByMemberNo(int memberNo);

	void updatedTestDrive(TestDriveApplicationReservationDetailsDTO dto);

	

}

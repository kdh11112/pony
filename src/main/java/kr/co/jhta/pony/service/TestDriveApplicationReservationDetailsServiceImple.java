package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.TestDriveApplicationReservationDetailsDAO;
import kr.co.jhta.pony.dto.TestDriveApplicationReservationDetailsDTO;

@Service
public class TestDriveApplicationReservationDetailsServiceImple implements TestDriveApplicationReservationDetailsService{

	@Autowired
	TestDriveApplicationReservationDetailsDAO dao;
	
	@Override
	public List<TestDriveApplicationReservationDetailsDTO> getTestDriveScheduleByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return dao.getTestDriveScheduleByMemberNo(memberNo);
	}

	@Override
	public void updatedTestDrive(TestDriveApplicationReservationDetailsDTO dto) {
		dao.updatedTestDrive(dto);
		
	}

}

package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.TestDriveApplicationReservationDetailsDTO;

@Mapper
@Repository
public interface TestDriveApplicationReservationDetailsDAO {

	List<TestDriveApplicationReservationDetailsDTO> getTestDriveScheduleByMemberNo(int memberNo);
	
}

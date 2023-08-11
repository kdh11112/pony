package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.TestDriveDTO;

@Repository
@Mapper
public interface TestDriveDAO {
	public void insertTestDriveSchedule(TestDriveDTO dto);
	public List<TestDriveDTO> showTestDriveSchedule();
	public void updatedTestDrive(int memberNo);
	public void deleteTestDrive(int testDriveNo);
	public Object testDriveCount(int memberNo);
}

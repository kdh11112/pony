package kr.co.jhta.pony.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.TestDriveDTO;

@Repository
@Mapper
public interface TestDriveDAO {
	public List<TestDriveDTO> showTestDriveSchedule();

	@Transactional
	public void insertTestDriveSchedule(TestDriveDTO dto);

	@Transactional
	public int checkTestDriveSchedule(int shopNo, String testDriveSchedule, String testDriveTime);
	
	public void updatedTestDrive(TestDriveDTO dto);

	public void deleteTestDrive(int testDriveNo);
	public Object testDriveCount(int memberNo);
}

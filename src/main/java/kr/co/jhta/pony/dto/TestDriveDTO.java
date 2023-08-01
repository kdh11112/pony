package kr.co.jhta.pony.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestDriveDTO {
	private int testDriveNo;
	private String testDriveSchedule;
	private String testDriveRequest;
	private int shopNo;
	private int memberNo;
	private int modelNo;
	private String testDriveTime;
	
	
}

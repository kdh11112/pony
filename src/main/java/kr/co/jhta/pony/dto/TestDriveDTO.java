package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestDriveDTO {
	private int testDriveNo;
	private String testDriveSchedule;
	private int shopNo;
	private int memberNo;
	private int modelNo;
	private String testDriveTime;
	private String testDriveStatus;
	
}

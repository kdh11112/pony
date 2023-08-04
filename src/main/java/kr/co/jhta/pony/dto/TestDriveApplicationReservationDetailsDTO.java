package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TestDriveApplicationReservationDetailsDTO {
	private String modelName;
	private String shopAreaPoint;
	private String testDriveTime;
	private String testDriveSchedule;
	private String shopAddr;
	private int modelNo;
	private int shopNo;
	private int memberNo;
	private int testDriveNo;
}

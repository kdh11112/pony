package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HistroyDTO {
	
	private int historyRN;
	private int technologyNumber;
	private String technologyDetail;
	private int technologyPrice;
	private int technologyCount;
	private String mechanicName;
	private int partNumber;
	private String partName;
	private int partPrice;
	private int partCount;
	private int partNo;

}

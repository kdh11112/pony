package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TechnologyAndPartDTO {
	
	private int technologyNumber;
	private String technologyDetail;
	private int technologyPrice;
	private int technologyNo;
	
	private int partNumber;
	private String partName;
	private int partNo;
	private int partPrice;

}

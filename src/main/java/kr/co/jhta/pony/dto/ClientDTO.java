package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientDTO {
	private String clientVin;
	private String clientCarNumber;
	private int clientDistanceDriven;
	private String clientCarType;
	private String clientShipDate;
	private String clientProductionDate;
	private String clientColor;
	private int memberNo;
}

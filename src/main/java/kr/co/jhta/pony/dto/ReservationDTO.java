package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReservationDTO {

	private int reservationNo;
	private String reservationDate;
	private String clientCarNumber;
	private int memberNo;
	private String memberName;
	private int shopNo;	
	private String shopAreaPoint;
	private String reservationClientRequests;
	private String reservationDueDate;
	
}

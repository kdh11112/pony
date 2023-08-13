package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//reservationNo int AI PK 
//reservationDate varchar(255) 
//clientCarNumber varchar(255) 
//memberNo int 
//shopNo int 
//reservationClientRequests varchar(255) 
//reservationDueDate
//정비예약DTO mypage 정비예약내역  정비예약하기
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationDTO {
	private int reservationNo;
	private String reservationDate;
	private String clientCarNumber;
	private int memberNo;
	private int shopNo;
	private String reservationClientRequests;
	private String reservationDueDate;
	private String shopAreaPoint;
    private String shopAddr;
}

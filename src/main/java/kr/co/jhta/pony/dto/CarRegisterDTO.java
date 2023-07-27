package kr.co.jhta.pony.dto;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CarRegisterDTO {

	private String clientVin; //차대번호
	private String clientCarNumber; //차량번호
	private int clientDistanceDriven; //주행거리
	private String clientCarType; //차종
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate clientShipDate; //출고일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate clientProductionDate; //생산일
	private String clientColor; //색상
	private int memberNo; //유저번호
	private String memberEmail; //차주이메일
	private String memberName; //차주성함
	private String memberPhone; //차주전화번호
	private int registrationNumber; //접수번호
	private String registrationClientRequests; //고객요청사항
	private String registrationSignificant; //특이사항
	private String mechanicNo; //지정정비사
	private String registrationReservationDueDate; //입고예정일
	private String registrationDate; //접수일자
	private String shopno;
	private String shopArea;
	private String shopAreaPoint;
	
	
}

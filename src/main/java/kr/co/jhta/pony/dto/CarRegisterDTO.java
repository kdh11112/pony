package kr.co.jhta.pony.dto;

import java.io.Serializable;
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
public class CarRegisterDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String clientVin; //차대번호.
	private String clientCarNumber; //차량번호.
	private int clientDistanceDriven; //주행거리.
	private String clientCarType; //차종.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate clientShipDate; //출고일.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate clientProductionDate; //생산일.
	private String clientColor; //색상.
	private int memberNo; //유저번호
	private String memberEmail; //차주이메일
	private String memberName; //차주성함.
	private String memberPhone; //차주전화번호.
	private String memberPassword;
	private int registrationNumber; //접수번호.
	private int registrationRN; //위에 접수번호를 하려고헀지만 실질적인 접수번호가 됨
	private String registrationClientRequests; //고객요청사항
	private String registrationSignificant; //특이사항
	private int mechanicNo; //지정정비사.
	private String mechanicName; //정비사이름
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate registrationReservationDueDate; //입고예정일.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate registrationDate; //접수일자. 최종입고일.
	private int shopNo;
	private String shopArea;// 최종정비공장.
	private String shopAreaPoint;// 최종정비공장.
	
	
	
}

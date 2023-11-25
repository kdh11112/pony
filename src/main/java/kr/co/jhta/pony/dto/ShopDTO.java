package kr.co.jhta.pony.dto;


import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuppressWarnings("serial")
public class ShopDTO implements Serializable{
	private int shopNo;
	private String shopArea;
	private String shopAreaPoint;
	private String shopAddr;
	private String shopPhone;
}

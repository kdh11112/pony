package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderPageItemDTO {
	/* 뷰로부터 전달받을 값 */
    private int partNo;
    
    private int partCount;

	/* DB로부터 꺼내올 값 */
    private String partName;
    
    private int partPrice;
    
    private String modelName;
    
    /* 만들어 낼 값 */
    private int deliveryPrice;
    
    private int totalPrice;
    
    private int point;
    
    private int totalPoint;
    
    public void initSaleTotal() {
    	this.totalPrice = this.partPrice * this.partCount;
    	this.point= (int)(Math.floor(this.partPrice*0.05));
    	this.totalPoint = this.point * this.partCount;
    }
}

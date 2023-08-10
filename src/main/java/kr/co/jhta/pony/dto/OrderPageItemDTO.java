package kr.co.jhta.pony.dto;

public class OrderPageItemDTO {
	/* 뷰로부터 전달받을 값 */
    private int cartNo;
    
    private int cartCount;

	/* DB로부터 꺼내올 값 */
    private String partName;
    
    private int partPrice;
    
    private String modelName;
}

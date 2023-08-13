package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.OrderDetailDTO;
import kr.co.jhta.pony.dto.QuestionDTO;

public interface OrderDetailService {

	public List<OrderDetailDTO> getOrderDetailsByOrderNo(int orderNo);
	
	public void insertOne(int cartNo);
	
	public List<OrderDetailDTO> selectOne(int orderNo);
}

package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.OrderDetailDTO;

@Repository
@Mapper
public interface OrderDetailDAO {

	List<OrderDetailDTO> getOrderDetailsByOrderNo(int orderNo);
	
	//주문의 여러 부품 비용 합산
	int getOrderTotalPrice(int orderNo);
	
	void insertOne(int cartNo);
	
	List<OrderDetailDTO> selectOne(int orderNo);
	
	int countKind(int orderNo);
}

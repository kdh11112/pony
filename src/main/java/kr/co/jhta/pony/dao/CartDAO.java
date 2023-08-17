package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.CartDTO;

@Repository
@Mapper
public interface CartDAO {
	
	// 카트 목록
	List<CartDTO> cartAll(int memberNo);
	
	// 카트 추가
	int addCart(CartDTO dto);
	
	// 카트 삭제
	int deleteCart(int cartNo);
	
	// 카트 수량 변경
	int modifyCount(CartDTO dto);
	
	// 카트 확인
	CartDTO checkCart(CartDTO dto);
	
	
	CartDTO getCartItemByCartNo(int cartNo);
	
	// 카드 삭제(주문 후)
	int deleteOrderCart(CartDTO dto);
}

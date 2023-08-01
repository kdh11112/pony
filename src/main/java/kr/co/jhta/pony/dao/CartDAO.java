package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.CartDTO;

@Repository
@Mapper
public interface CartDAO {
	
	// 카트 목록
	List<CartDTO> cartAll(String memberNo);
	
	// 카트 추가
	void addCart(CartDTO dto);
	
	// 카트 삭제
	void deleteCart(int cartNo);
	
	// 카트 수량 변경
	void modifyCount(CartDTO dto);
	
	// 카트 확인
}

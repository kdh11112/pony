package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.CartDTO;

public interface CartService {
	
	// 카트 목록
	public List<CartDTO> cartAll(int memberNo);
	
	// 카트 추가
	public int addCart(CartDTO dto);
	
	// 카트 삭제
	public int deleteCart(int cartNo);
	
	// 카트 수량 변경
	public int modifyCount(CartDTO dto);
	
	// 카드 확인
	public CartDTO checkCart(CartDTO dto);
	
}

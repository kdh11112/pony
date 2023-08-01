package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.CartDTO;

public interface CartService {
	
	// 카트 목록
	public List<CartDTO> cartAll(String memberNo);
	
	// 카트 추가
	public void addCart(CartDTO dto);
	
	// 카트 삭제
	public void deleteCart(int cartNo);
	
	// 카트 수량 변경
	public void modifyCount(CartDTO dto);
	
}

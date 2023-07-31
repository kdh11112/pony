package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.CartDAO;
import kr.co.jhta.pony.dto.CartDTO;

@Service
public class CartServiceImple implements CartService{

	private final CartDAO dao;
	
	@Autowired
	public CartServiceImple(CartDAO cartdao) {
		this.dao = cartdao;
	}
	
	// 접속한 회원의 장바구니
	@Override
	public List<CartDTO> cartAll(String memberNo) {
		return dao.cartAll(memberNo);
	}

	@Override
	@Transactional
	public void addCart(CartDTO dto) {
		dao.addCart(dto);
		
	}

	@Override
	@Transactional
	public void deleteCart(int cartNo) {
		dao.deleteCart(cartNo);
		
	}

	@Override
	@Transactional
	public void modifyCount(CartDTO dto) {
		dao.modifyCount(dto);
		
	}

}

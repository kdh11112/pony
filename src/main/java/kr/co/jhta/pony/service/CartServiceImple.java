package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.CartDAO;
import kr.co.jhta.pony.dto.CartDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImple implements CartService{

	private final CartDAO dao;
	
	@Autowired
	public CartServiceImple(CartDAO cartdao) {
		this.dao = cartdao;
	}
	
	// 접속한 회원의 장바구니
	@Override
	public List<CartDTO> cartAll(int memberNo) {
		List<CartDTO> cart = dao.cartAll(memberNo);
		// 총 금액 구하기위해 메서드 호출
		for(CartDTO dto : cart) {
			dto.cartTotal();
		}
		return cart;
	}

	@Override
	@Transactional
	public int addCart(CartDTO dto) {
	//	log.info("추가? "+dto);
		CartDTO checkCart = dao.checkCart(dto);
		
		// 추가하려는 부품이 장바구니에 이미 존재한다면 2를 반환
		if(checkCart != null) {
			return 2;
		}
		// 장바구니에 존재하지 않는다면 추가
		return dao.addCart(dto);
	}

	@Override
	@Transactional
	public int deleteCart(int cartNo) {
		return dao.deleteCart(cartNo);
		
	}

	@Override
	@Transactional
	public int modifyCount(CartDTO dto) {
		return dao.modifyCount(dto);
		
	}

	@Override
	public CartDTO checkCart(CartDTO dto) {
		return dao.checkCart(dto);
	}

	@Override
	public CartDTO getCartItemByCartNo(int cartNo) {
		return dao.getCartItemByCartNo(cartNo);
	}

}

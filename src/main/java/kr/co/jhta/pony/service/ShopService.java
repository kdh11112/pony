package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.ShopDTO;

public interface ShopService {
	public List<ShopDTO> shopArea(String shopArea,String shopAreaPoint);
}

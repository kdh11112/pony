package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.ShopDAO;
import kr.co.jhta.pony.dto.ShopDTO;

@Service
public class ShopServiceImple implements ShopService{

	@Autowired
	ShopDAO dao;
	
	@Override
	public List<ShopDTO> ShopOne(String shopArea) {
		return dao.ShopOne(shopArea);
	}

}

package kr.co.jhta.pony.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.ShopDAO;
import kr.co.jhta.pony.dto.ShopDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ShopServiceImple implements ShopService{

	@Autowired
	ShopDAO dao;
	
	@Override
	@Transactional
	@Cacheable(value = "shopCache")
	public List<ShopDTO> shopArea(String shopArea, String shopAreaPoint) {
		log.info("Service >>>>" + "지점 : "+shopArea);
		return dao.shopArea(shopArea,shopAreaPoint);
	}


}

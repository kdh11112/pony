package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.ShopDTO;

@Repository
@Mapper
@CacheNamespace(flushInterval = 1000, size=2024)
public interface ShopDAO {
	public List<ShopDTO> shopArea(String shopArea,String shopAreaPoint);
}

package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.ShopDTO;

@Repository
@Mapper
public interface ShopDAO {
	public List<ShopDTO> shopArea(String shopArea,String shopAreaPoint);
}

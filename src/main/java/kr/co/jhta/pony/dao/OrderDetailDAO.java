package kr.co.jhta.pony.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.OrderDetailDTO;

@Repository
@Mapper
public interface OrderDetailDAO {
	List<OrderDetailDTO> selectOne(HashMap<String, Object> map);

}

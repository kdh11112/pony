package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.StartEnd;

@Repository
@Mapper
public interface OrderDAO {

	List<OrderDTO> getAllByAdmin(StartEnd se);

	OrderDTO selectOne(int orderNo);

	int getTotal();

	void deleteOne(OrderDTO dto);
}

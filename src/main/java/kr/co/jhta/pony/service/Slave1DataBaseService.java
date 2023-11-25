package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dto.DeptModel;
import kr.co.jhta.pony.slave1.Slave1DataBaseMapper;

@Service
public class Slave1DataBaseService {
	@Autowired
	Slave1DataBaseMapper slave1DataBaseMapper;
	
	public List<DeptModel> getDept()  {
		return slave1DataBaseMapper.getDept();
	}
	
}
package kr.co.jhta.pony.dto;

import lombok.Builder;
import lombok.Data;

@Builder @Data
public class DeptModel {

	private int deptno;
	private String dname;
	private String loc;
}
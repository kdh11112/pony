package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.util.Criteria;

public interface PartService {

	// 부품 전체 목록(페이징 적용)
	public List<PartDTO> getPartAll(Criteria cri);
	
	// 부품 검색  - 아직 코드 X
	public List<PartDTO> searchPartList();
	
	// 부품 총 갯수
	public int getTotal();
	
	// 관리자 부품 추가
	public void adminInsertOne(PartDTO dto); 
	
	// 관리자 부품 수정
	public void adminModifyOne(PartDTO dto);
	
	// 관리자 부품 삭제 - 체크박스
	public void adminDeleteCheck(String no);
	
	public List<PartDTO> searchPart(String partName);
}

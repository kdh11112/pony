package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.util.Criteria;

public interface PartService {

	// 부품 전체 목록(페이징 적용)
	public List<PartDTO> getPartAll(Criteria cri);
	
	// 모델명 가겨오기
	public List<PartDTO> getmodelName(PartDTO dto);
	
	// 부품 총 갯수
	public int getTotal();
	
	// 검색한 부품 목록(페이징 적용)
	public List<PartDTO> searchPartList(Criteria cri);
	
	// 검색한 부품 총 갯수(조건문에 사용할 keyword 데이터 전달받기 위해 파라미터로 Criteria)
	public int searchPartTotal(Criteria cri);
	
	// 모델 id 리스트 요청
	public String[] getModelNoList(String keyword);
	
	// 관리자 부품 추가
	public void adminInsertOne(PartDTO dto); 
	
	// 관리자 부품 수정
	public void adminModifyOne(PartDTO dto);
	
	// 관리자 부품 삭제 - 체크박스
	public void adminDeleteCheck(String no);
	
	public List<PartDTO> searchPart(String partName);
	
	public List<PartDTO> searchPart2(String partName);
	
	public PartDTO getPartsInfo(int PartNumber);
}

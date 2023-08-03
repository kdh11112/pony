package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.util.Criteria;

@Repository
@Mapper
public interface PartDAO {

	// 부품 전체 목록(페이징)
	List<PartDTO> getPartAll(Criteria cri);
	
	// 모델 이름 가져오기
	List<PartDTO> getmodelName(PartDTO dto);
	
	// 부품 총 갯수
	int getTotal();
	
	// 검색한 부품 전체 목록(페이징)
	List<PartDTO> searchPartList(Criteria cri);
	
	// 검색한 부품 총 갯수 (조건문에 사용할 keyword 데이터 전달받기 위해 파라미터로 Criteria)
	int searchPartTotal(Criteria cri);
	
	// 모델 id 리스트 요청
	String[] getModelNoList(String keyword);
	
	// 관리자 부품 추가
	void adminInsertOne(PartDTO dto); 
	
	// 관리자 부품 수정
	void adminModifyOne(PartDTO dto);
	
	// 관리자 부품 삭제 - 체크박스
	void adminDeleteCheck(String no);

	List<PartDTO> searchPart(String partName);
	
}

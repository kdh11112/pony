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
	
	// 부품 검색  - 아직 코드 X
	List<PartDTO> searchPartList();
	
	// 부품 총 갯수
	int getTotal();
	
	// 관리자 부품 추가
	void adminInsertOne(PartDTO dto); 
	
	// 관리자 부품 수정
	void adminModifyOne(PartDTO dto);
	
	// 관리자 부품 삭제 - 체크박스
	void adminDeleteCheck(String no);
}

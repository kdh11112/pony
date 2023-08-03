package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.PartDAO;
import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.util.Criteria;

@Service
public class PartServiceImple implements PartService{

	private final PartDAO partdao;
	
	@Autowired
	public PartServiceImple(PartDAO pdao) {
		this.partdao = pdao;
	}
	
	// 부품 전체 목록(페이징)
	@Override
	public List<PartDTO> getPartAll(Criteria cri) {
		return partdao.getPartAll(cri);
	}

	// 부품 검색  - 아직 코드 X
	@Override
	public List<PartDTO> searchPartList() {
		return null;
	}

	// 부품 총 갯수
	@Override
	public int getTotal() {
		return partdao.getTotal();
	}

	// 관리자 부품 추가
	@Override
	@Transactional
	public void adminInsertOne(PartDTO dto) {
		partdao.adminInsertOne(dto);
	}

	// 관리자 부품 수정
	@Override
	@Transactional
	public void adminModifyOne(PartDTO dto) {
		partdao.adminModifyOne(dto);
	}

	// 관리자 부품 삭제 - 체크박스
	@Override
	@Transactional
	public void adminDeleteCheck(String no) {
		partdao.adminDeleteCheck(no);
	}

	@Override
	public List<PartDTO> searchPart(String partName) {
		return partdao.searchPart(partName);
	}




}

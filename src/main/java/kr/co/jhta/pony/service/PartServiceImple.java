package kr.co.jhta.pony.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.PartDAO;
import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.util.Criteria;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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

	// 부품 총 갯수
	@Override
	public int getTotal() {
		return partdao.getTotal();
	}

	// 검색된 부품 목록(페이징) - 검색 조건: 차종명, 부품명   
	@Override
	public List<PartDTO> searchPartList(Criteria cri) {
		String type = cri.getType();
		 String[] typeArr;
		    if (type == null) {
		        type = "P";
		        typeArr = new String[] { type };
		    } else {
		        typeArr = type.split("");
		    }
		//String []typeArr = cri.getTypeArr();
		//typeArr = type.split("");
		String[] modelArr = partdao.getModelNoList(cri.getKeyword());
	    log.info("typeArr: "+Arrays.toString(typeArr));
	    log.info(type);
	    log.info(""+cri);
	    if(type.equals("M")) {
	    	if(modelArr.length == 0) {
	    		return new ArrayList();
	    	}
	    }
		for(String t : typeArr) {
			if (t.equals("M")) {
				
				cri.setModelArr(modelArr);
				log.info("cri : "+cri);
				log.info("modelArr : "+modelArr);
			} 
		}
		
		return partdao.searchPartList(cri);
	}
	
	// 검색된 부품 총 갯수 (조건문에 사용할 keyword 데이터 전달받기 위해 파라미터로 Criteria)
	@Override
	public int searchPartTotal(Criteria cri) {
		return partdao.searchPartTotal(cri);
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

	// 모델명 가져오기
	@Override
	public List<PartDTO> getmodelName(PartDTO dto) {
		return partdao.getmodelName(dto);
	}

	@Override
	public String[] getModelNoList(String keyword) {
		return partdao.getModelNoList(keyword);
	}





}

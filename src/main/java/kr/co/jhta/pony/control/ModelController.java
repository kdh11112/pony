package kr.co.jhta.pony.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.service.ModelService;
import kr.co.jhta.pony.service.PartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/model")
public class ModelController {

	@Autowired
	private ModelService service;
	@Autowired
	private PartService ps;
	
	// 모델비교 페이지
	@GetMapping("/modelComparison")
	public String modelSelect(Model model) {
		model.addAttribute("model",service.ModelAll());
		return "/model/modelComparison1";
	}
	
	// 모델비교 select 
	@GetMapping("/modelComparison2")
	public String modelInfo(@RequestParam("selectModel1")String modelName1,@RequestParam("selectModel2")String modelName2, Model model) {
		log.info("modelName1 : " + modelName1);
		log.info("modelName2 : " + modelName2);
		model.addAttribute("model1",service.ModelOne(modelName1));
		model.addAttribute("model2",service.ModelOne(modelName2));
		return "/model/modelComparison2";
	}
	
	// 모델검색 페이지
	@GetMapping("/modelFind")
	public String modelFind(Model model) {
		model.addAttribute("model", service.ModelAll());
		log.info("모델네임" +service.ModelAll());
		return "/model/modelFind";
	}
	
	// 모델 디테일 페이지
	@GetMapping("/modelDetail")
	public String modelDetail(@RequestParam("selectModel")String modelName, Model model, Model model2) {
		model.addAttribute("model", service.ModelOne(modelName));
		model2.addAttribute("model2", service.ModelAll());
		return "/model/modelDetail";
	}
	
	// 부품검색 페이지
	@GetMapping("/partsFind")
	public String partsFind() {
		return "/model/partsFind";
	}
	
	// 부품검색 select
	@GetMapping("/searchParts")
	@ResponseBody
	public List<PartDTO> searchParts(@RequestParam("partName")String partName, Model model) {
		model.addAttribute("part", ps.searchPart(partName));
		log.info("partName : "+partName);
		return ps.searchPart(partName);
	}
	
}

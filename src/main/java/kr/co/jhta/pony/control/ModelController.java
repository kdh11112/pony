package kr.co.jhta.pony.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.service.ModelService;
import kr.co.jhta.pony.service.PartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ModelController {

	@Autowired
	private ModelService service;
	@Autowired
	private PartService ps;
	
	
	@GetMapping("/modelComparison")
	public String modelSelect(Model model) {
		model.addAttribute("model",service.ModelInfo());
		return "modelComparison1";
	}
	
	@GetMapping("/modelComparison2")
	public String modelInfo(@RequestParam("selectModel1")String modelName1,@RequestParam("selectModel2")String modelName2, Model model) {
		log.info("modelName1 : " + modelName1);
		log.info("modelName2 : " + modelName2);
		model.addAttribute("model1",service.ModelOne(modelName1));
		model.addAttribute("model2",service.ModelOne(modelName2));
		return "modelComparison2";
	}
	
	@GetMapping("/modelFind")
	public String modelFind() {
		
		return "modelFind";
	}
	@GetMapping("/modelDetail")
	public String modelDetail(@RequestParam("selectModel")String modelName, Model model) {
		model.addAttribute("model", service.ModelOne(modelName));
		return "modelDetail";
	}
	
	@GetMapping("/partsFind")
	public String partsFind() {
		return "partsFind";
	}
	
	@GetMapping("/searchParts")
	@ResponseBody
	public List<PartDTO> searchParts(@RequestParam("partName")String partName, Model model) {
		model.addAttribute("part", ps.searchPart(partName));
		log.info("partName : "+partName);
		return ps.searchPart(partName);
	}
	
}

package kr.co.jhta.pony.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.pony.dao.ModelDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ModelController {

	@Autowired
	ModelDAO dao;
	
	@RequestMapping("/modelComparison")
	public String modelSelect(Model model) {
		model.addAttribute("model",dao.ModelInfo());
		return "modelComparison1";
	}
	
	@GetMapping("/modelComparison2")
	public String modelInfo(@RequestParam("selectModel1")String modelName1,@RequestParam("selectModel2")String modelName2, Model model) {
		log.info("modelName1 : " + modelName1);
		log.info("modelName2 : " + modelName2);
		model.addAttribute("model1",dao.ModelOne(modelName1));
		model.addAttribute("model2",dao.ModelOne(modelName2));
		return "modelComparison2";
	}
	
}

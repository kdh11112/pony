package kr.co.jhta.pony.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.pony.dto.DeptModel;
import kr.co.jhta.pony.service.Slave1DataBaseService;

@Controller
public class HomeController {
	
	@Autowired
	private Slave1DataBaseService slave1DataBaseService;
	
	@RequestMapping(value = "/reg/testDept", method = RequestMethod.GET)
	public ModelAndView goHome(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<DeptModel> deptList = slave1DataBaseService.getDept();
		mav.addObject("deptList",deptList);
		mav.setViewName("registration/testDept");
		return mav;
	}
	
}
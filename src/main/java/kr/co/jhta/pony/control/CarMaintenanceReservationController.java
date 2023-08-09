package kr.co.jhta.pony.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CarMaintenanceReservationController {
	
	@GetMapping("/carMaintenanceReservation") //정비예약페이지로 이동하는 컨트롤러
	public String carMaintenanceRegistration() {
		return "carMaintenanceReservation";
	}
}

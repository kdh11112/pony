package kr.co.jhta.pony.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CarMaintenanceReservationController {
	
	@GetMapping("/carMaintenanceReservation")
	public String carMaintenanceRegistration() {
		return "carMaintenanceReservation";
	}
}

package com.kh.toy.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {

	@GetMapping("reservation")
	public String reservation() {
		return "reservation/reservation";
	}
	
	
	
	
}

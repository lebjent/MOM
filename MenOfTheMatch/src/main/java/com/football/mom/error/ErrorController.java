package com.football.mom.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/error")
public class ErrorController {
	
	@GetMapping(value = "/404")
	public String Error404()throws Exception{
		
		return "error/404";
	}
	
	
	@GetMapping(value = "/405")
	public String Error405()throws Exception{
		
		return "error/405";
	}
	
	@GetMapping(value = "/403")
	public String Error403()throws Exception{
		
		return "error/403";
	}
	
	@GetMapping(value = "/general")
	public String ErrorGeneral()throws Exception{
		
		return "error/general";
	}
}

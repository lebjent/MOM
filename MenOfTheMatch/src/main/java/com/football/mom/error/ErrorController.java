package com.football.mom.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping(value = "/404")
	public String handlePostError404() throws Exception {
	    // POST 요청에 대한 처리 로직 추가
	    return "error/404";
	}

	@PostMapping(value = "/405")
	public String handlePostError405() throws Exception {
	    // POST 요청에 대한 처리 로직 추가
	    return "error/405";
	}

	@PostMapping(value = "/403")
	public String handlePostError403() throws Exception {
	    // POST 요청에 대한 처리 로직 추가
	    return "error/403";
	}

	@PostMapping(value = "/general")
	public String handlePostErrorGeneral() throws Exception {
	    // POST 요청에 대한 처리 로직 추가
	    return "error/general";
	}
	
}

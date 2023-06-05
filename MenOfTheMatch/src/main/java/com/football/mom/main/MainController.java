package com.football.mom.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	
	@RequestMapping(value = "/", method =RequestMethod.GET )
	public String index()throws Exception{
		
			log.info("인덱스 페이지로 이동합니다.");
		
			return "index";
		
	}
	
	@GetMapping(value = "/main")
	public String main()throws Exception{
			
		log.info("메인페이지로 이동");
		
		return "/main/mainPage";
			
	}
	
}

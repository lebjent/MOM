package com.football.mom;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class index {
	
	@RequestMapping(value = "/", method =RequestMethod.GET )
	public String index()throws Exception{
		
			log.info("인덱스 페이지로 이동합니다.");
		
			return "index";
		
	}
	
}

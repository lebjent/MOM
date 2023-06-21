package com.football.mom.main;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String main(Authentication authentication, Model model)throws Exception{
			
		log.info("메인페이지로 이동");
		if (authentication != null && authentication.isAuthenticated()) {
		    // 인증된 사용자인 경우에 실행할 코드
			log.info("로그인된 사용자가 있음");
		    String loggedInUser = authentication.getName();
		    model.addAttribute("loggedInUser", loggedInUser);
		} else {
		    log.info("로그인된 사용자가 없음");
		}
	    
		return "main/mainPage";
			
	}
	
}

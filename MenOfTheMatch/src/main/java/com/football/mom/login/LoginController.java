package com.football.mom.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@GetMapping(value = "/loginPage")
	public String loginPageView()throws Exception{
		
		return "login/loginPage";
		
	}
	
}

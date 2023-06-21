package com.football.mom.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@GetMapping("/loginPage")
	public String loginPageView(@RequestParam(value = "error", required = false) String error, Model model) {
	    if (error != null) {
	        model.addAttribute("loginErrorMsg", "아이디 또는 비밀번호를 확인해주세요.");
	    }
	    return "login/loginPage";
	}
	
	@PostMapping(value = "/login")
	public String login(@RequestParam("id")String id,@RequestParam("password")String password,RedirectAttributes redirectAttributes)throws Exception{
			
		Boolean auth = service.authenticate(id, password);
		if(auth) {
			log.info("*******로그인 성공*******");
	        Authentication loggedInUser = new UsernamePasswordAuthenticationToken(id, password);
	        SecurityContextHolder.getContext().setAuthentication(loggedInUser); // 인증 객체 설정
			return "redirect:/main";
		}else {
			log.info("*******로그인 실패*******");
			redirectAttributes.addAttribute("error", "true");
			return "redirect:/loginPage";
		}
	}
	
	
}

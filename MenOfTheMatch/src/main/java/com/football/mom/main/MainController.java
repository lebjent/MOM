package com.football.mom.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.football.mom.login.LoginInfo;
import com.football.mom.login.LoginService;
import com.football.mom.team.TeamDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	
	@Autowired
	private LoginService service;
	
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
			LoginInfo loginInfo = (LoginInfo) authentication.getPrincipal();
			String mno = loginInfo.getMno();//로그인한 회원의 고유번호가져오기
			String tnoChk = service.getTno(mno);//로그인한 회원의 팀번호 가져오기
			
			if(tnoChk != null) {
				model.addAttribute("tnoChk", true);
				model.addAttribute("teamInfo",service.getLoginTeamInfo(mno));
			}else {
				model.addAttribute("tnoChk", false);
			}
		    model.addAttribute("loginInfo", loginInfo);
		} else {
		    log.info("로그인된 사용자가 없음");
		}
	    
		return "main/mainPage";
			
	}
	
}

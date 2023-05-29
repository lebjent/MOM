package com.football.mom.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	
	@GetMapping(value = "/join")
	public String joinView()throws Exception{
		
			log.info("회원가입 페이지로 이동합니다.");
			
			
			return "/member/join";
	}
	
}

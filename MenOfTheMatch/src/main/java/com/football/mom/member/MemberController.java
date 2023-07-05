package com.football.mom.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	
	@Resource(name = "memberService")
	private MemberService service;
	
	@GetMapping(value = "/join")
	public String joinView()throws Exception{
		
			log.info("회원가입 페이지로 이동합니다.");
			
			
			return "/member/join";
	}
	
	@ResponseBody
	@PostMapping(value="/dupChk")
	public Map<String,Object> dupChk(@RequestBody Map<String,Object>param)throws Exception{
		String id = (String) param.get("id");
		Map<String,Object> resultMap = new HashMap<>();
		
		try {
			int result = service.dupChk(id);
			resultMap.put("status", "SUCCESS");
			resultMap.put("result", result);
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", "FAIL");
		}
		
		return resultMap;
	}
	
	@PostMapping(value = "/memberJoin")
	public String memberJoin(MemberDTO dto)throws Exception{
		try {
			service.memberJoin(dto);
			return "redirect:/member/memberJoinSuccess";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/member/memberJoinFail";
		}
	}
	
	@GetMapping(value="/memberJoinSuccess")
	public String memberJoinSuccess()throws Exception{
		return "/member/memberJoinSuccess";
	}
	
	@GetMapping(value="/memberJoinFail")
	public String memberJoinFail()throws Exception{
		return "/member/memberJoinFail";
	}
	
}

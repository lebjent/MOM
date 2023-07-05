package com.football.mom.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class TeamController {
	
	@Resource(name = "teamService")
	private TeamService service;
	
	@PostMapping(value = "/teamCreate")
	@ResponseBody
	public Map<String,Object> teamCreate(TeamDTO dto,@RequestParam("fileInput")MultipartFile fileInput)throws Exception{
		
		Map<String,Object> returnObject = new HashMap<>();
		try {
			service.teamCreate(dto, fileInput);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return returnObject;
	}
	
}

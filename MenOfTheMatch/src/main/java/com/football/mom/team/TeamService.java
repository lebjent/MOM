package com.football.mom.team;

import org.springframework.web.multipart.MultipartFile;

public interface TeamService {
	
	public void teamCreate(TeamDTO dto,MultipartFile fileInput)throws Exception;
	
}

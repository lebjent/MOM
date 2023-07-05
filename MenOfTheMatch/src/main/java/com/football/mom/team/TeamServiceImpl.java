package com.football.mom.team;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.football.mom.common.FileUpload;
import com.football.mom.common.MakeKey;

@Service("teamService")
public class TeamServiceImpl implements TeamService {
	
	@Autowired
	private TeamMapper mapper;

	@Autowired
	private FileUpload fileUpload;
	
	
	@Override
	public void teamCreate(TeamDTO dto,MultipartFile fileInput) throws Exception {
		
		//팀 고유키 생성작업
		String prevTno = mapper.getRecentTno();
		String tno = MakeKey.makeTeamNumber(prevTno);
		
		//팀 엠블럼 이미지 파일 작업
		String fileLocaiton = "D:\\Study\\nas\\MOM";
		String originalFileName = fileInput.getOriginalFilename();
		String fileName = "";
		String filePath = "";
		
		if(originalFileName != null) {
			Map<String,Object> fileInfoMap = fileUpload.uploadFile(fileLocaiton, originalFileName, fileInput.getBytes());
			fileName = (String) fileInfoMap.get("savedFileName");
			filePath = (String) fileInfoMap.get("fileUploadFullUrl");
		}
		
		dto.setTno(tno);
		dto.setTfileOriginalName(originalFileName);
		dto.setTfileSaveName(fileName);
		dto.setTfilePath(filePath);
		
		mapper.updateTno(dto);
		mapper.teamCreate(dto);
	}
	
	
	
}

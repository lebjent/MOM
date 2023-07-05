package com.football.mom.team;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeamMapper {
	
	//최근 팀번호 가져오기
	public String getRecentTno()throws Exception;
	
	//팀생성자 팀등록
	public void updateTno(TeamDTO dto)throws Exception;
	
	//팀 정보 저장
	public void teamCreate(TeamDTO dto)throws Exception;
}

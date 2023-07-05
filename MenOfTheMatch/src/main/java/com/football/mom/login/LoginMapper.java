package com.football.mom.login;

import org.apache.ibatis.annotations.Mapper;

import com.football.mom.member.MemberDTO;
import com.football.mom.team.TeamDTO;

@Mapper
public interface LoginMapper {
	
	public MemberDTO getLoginMemberInfo(String id) throws Exception;
	
	public TeamDTO getLoginTeamInfo(String mno)throws Exception;
	
	public String getTno(String mno) throws Exception;
}

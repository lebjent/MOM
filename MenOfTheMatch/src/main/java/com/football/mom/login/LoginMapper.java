package com.football.mom.login;

import org.apache.ibatis.annotations.Mapper;

import com.football.mom.member.MemberDTO;

@Mapper
public interface LoginMapper {
	
	public MemberDTO getLoginMemberInfo(String id) throws Exception;
	
}

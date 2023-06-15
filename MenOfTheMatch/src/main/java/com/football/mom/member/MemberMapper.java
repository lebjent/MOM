package com.football.mom.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	public int dupChk(String id)throws Exception;
	
	public void memberJoin(MemberDTO dto)throws Exception;
	
}

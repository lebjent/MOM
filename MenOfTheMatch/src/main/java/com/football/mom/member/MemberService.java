package com.football.mom.member;

import org.springframework.security.crypto.password.PasswordEncoder;

public interface MemberService {
	
	public int dupChk(String id)throws Exception;//아이디 중복체크
	
	public void memberJoin(MemberDTO dto)throws Exception;//회원가입
	
}

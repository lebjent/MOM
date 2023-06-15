package com.football.mom.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public int dupChk(String id) throws Exception {
		
		int result = mapper.dupChk(id);
		
		return result;
	}

	@Override
	public void memberJoin(MemberDTO dto) throws Exception {
		
		String password = encoder.encode(dto.getPassword());
		dto.setPassword(password);
		
		mapper.memberJoin(dto);
		
	}

}

package com.football.mom.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.football.mom.member.MemberDTO;


@Service
@Transactional
public class LoginService implements UserDetailsService{
	
	@Autowired
	private LoginMapper mapper;
	
    @Autowired
    private PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		MemberDTO memberInfo = new MemberDTO();
		
		try {
			memberInfo = mapper.getLoginMemberInfo(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//유저 값이 있는지 없는지 null체크
		if(memberInfo == null) {
			throw new UsernameNotFoundException(id);
		}
		
		UserDetails user = User.builder()
							.username(memberInfo.getId())
							.password(memberInfo.getPassword())
							.roles(memberInfo.getRole())
							.build();
		
		return user;
	}
	
    public boolean authenticate(String id, String password) {
        
    	MemberDTO memberInfo = new MemberDTO();
    	
    	try {
    		memberInfo = mapper.getLoginMemberInfo(id);
            if (memberInfo == null) {
            	return false;
            }
    	} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    	

        // 입력받은 비밀번호와 저장된 비밀번호를 비교
        return passwordEncoder.matches(password, memberInfo.getPassword());
    }
	
}

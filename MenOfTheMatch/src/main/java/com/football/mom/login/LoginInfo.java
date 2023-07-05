package com.football.mom.login;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.football.mom.member.MemberDTO;

import lombok.Data;


public class LoginInfo implements UserDetails {
	
	private MemberDTO memberDTO;
    
    public LoginInfo(MemberDTO memberDTO) {
        this.memberDTO = memberDTO;
    }
	
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority("ROLE_"+memberDTO.getRole()));	
        return auth;
    }

	/**
     * 비밀번호
     */
 	@Override
     public String getPassword() {
         return memberDTO.getPassword();
     }


 	/*ID값*/
     @Override
     public String getUsername() {
         return memberDTO.getId();
     }
     
     /*mno PK 값*/
     public String getMno() {
         return memberDTO.getMno();
     }
     /*tno PK 값*/
     public String getTno() {
         return memberDTO.getTno();
     }
     
     public String getPosition() {
         return memberDTO.getPosition();
     }
     
     public String getSubPosition() {
         return memberDTO.getSubposition();
     }
     
     /**
      * 계정 만료 여부
      * true : 만료 안됨
      * false : 만료
      * @return
      */
     @Override
     public boolean isAccountNonExpired() {
         return true;
     }

     /**
      * 계정 잠김 여부
      * true : 잠기지 않음
      * false : 잠김
      * @return
      */
     @Override
     public boolean isAccountNonLocked() {
         return true;
     }

     /**
      * 비밀번호 만료 여부
      * true : 만료 안됨
      * false : 만료
      * @return
      */
     @Override
     public boolean isCredentialsNonExpired() {
         return true;
     }


     /**
      * 사용자 활성화 여부
      * ture : 활성화
      * false : 비활성화
      * @return
      */
     @Override
     public boolean isEnabled() {
         //이메일이 인증되어 있고 계정이 잠겨있지 않으면 true
         return true;
     }
	
	
	
}

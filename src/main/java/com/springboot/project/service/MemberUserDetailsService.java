package com.springboot.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.springboot.project.dao.IMemberDAO;
import com.springboot.project.dto.MemberDTO;

@Service
public class MemberUserDetailsService implements UserDetailsService{
	
	@Autowired
	IMemberDAO dao;
		
	@Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberDTO dto = dao.findById(username);
        if (dto == null) {
            throw new UsernameNotFoundException("사용자 없음");
        }

        return User.builder()
                .username(dto.getMid())
                .password(dto.getMpwd())
                .roles(dto.getMauth())
                .build();
    }
	
}

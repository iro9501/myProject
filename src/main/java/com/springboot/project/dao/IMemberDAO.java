package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.MemberDTO;

@Mapper
public interface IMemberDAO {
	public List<MemberDTO> listDAO();
	public MemberDTO oneOfListDAO(String mcode);
	public int insertDAO(MemberDTO dto);
	public int deleteDAO(String mcode);
	public int updateDAO(MemberDTO dto);
	public MemberDTO findById(String mid);
	public int idchkDAO(String mid);
}

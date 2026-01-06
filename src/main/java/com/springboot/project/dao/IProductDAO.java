package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.ProductDTO;

@Mapper
public interface IProductDAO {
	public List<ProductDTO> pListDAO();
	public ProductDTO oneOfPListDAO(String pcode);
	public int pInsertDAO(ProductDTO dto);
	public int pDeleteDAO(String pcode);
	public int pUpdateDAO(ProductDTO dto);

}

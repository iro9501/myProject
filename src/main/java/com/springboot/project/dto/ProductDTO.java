package com.springboot.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDTO {
	
	private String pcode;
	private String pname;
	private int price;
	private String author;
	private String publisher;
	private String releasedate;
	private String description;
	private String category;
	private int stock;
	private String condition;
	private String pregdate;
	private String imgname;
	private String mcode;
	private MultipartFile multi; 		// 파일업로드용
	private String pfilename;           // 파일업로드용
}

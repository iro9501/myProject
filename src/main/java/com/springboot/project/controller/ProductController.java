package com.springboot.project.controller;

import java.io.File;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.project.dao.IMemberDAO;
import com.springboot.project.dao.IProductDAO;
import com.springboot.project.dto.MemberDTO;
import com.springboot.project.dto.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {

	@Autowired
	IProductDAO pDao;
	
	@Autowired
	IMemberDAO mDao;
	
	@RequestMapping("/product/productList")
	public String productList(Model model) {
		model.addAttribute("list", pDao.pListDAO());
		
		return "product/ProductListForm";
	}
	
	@RequestMapping("/admin/product/productInsertForm")
	public String memberInsertForm() {
		
		return "admin/product/ProductInsertForm";
	}
	
	@RequestMapping("/admin/product/productInsert")
	public String productInsert(Principal principal, ProductDTO dto, @RequestParam("file") MultipartFile multi) throws Exception {
		String mid = principal.getName();
		MemberDTO memberDto = mDao.findById(mid);
		dto.setMcode(memberDto.getMcode());
		
		if(!multi.isEmpty()) {
			String imgname = multi.getOriginalFilename();
			multi.transferTo(new File("C:\\Springboot\\Pilotproject\\src\\main\\resources\\static\\bookimages\\" + imgname));
			dto.setImgname(imgname);
		}
		pDao.pInsertDAO(dto);
		
		return "redirect:/product/productList";
	}
	
	@RequestMapping("/product/productDetail")
	public String productDetail(HttpServletRequest request, Model model) {
		String pcode = request.getParameter("pcode");
		
		model.addAttribute("detail", pDao.oneOfPListDAO(pcode));
		
		return "product/ProductDetailForm";
	}
	
	@RequestMapping("/admin/product/productDelete")
	public String productDelete(HttpServletRequest request) {
		String pcode = request.getParameter("pcode"); 
		
		pDao.pDeleteDAO(pcode);
		
		return "redirect:/product/productList";
	}
	
	@RequestMapping("/admin/product/productUpdateForm")
	public String productUpdateForm(HttpServletRequest request, Model model) {
		String pcode = request.getParameter("pcode"); 
		
		model.addAttribute("detail", pDao.oneOfPListDAO(pcode));
		
		return "admin/product/ProductUpdateForm";
	}
	
	@RequestMapping("/admin/product/productUpdate")
	public String productUpdate(HttpServletRequest request, ProductDTO dto, @RequestParam("file") MultipartFile multi) throws Exception{
		if(!multi.isEmpty()) {
			String imgname = multi.getOriginalFilename();
			multi.transferTo(new File("C:\\Springboot\\Pilotproject\\src\\main\\resources\\static\\bookimages\\" + imgname));
			dto.setImgname(imgname);
		} else {
			String originname = request.getParameter("originname");
			dto.setImgname(originname);
		}
		
		pDao.pUpdateDAO(dto);
		
		return "redirect:/product/productList";
	}
}

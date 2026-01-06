package com.springboot.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.project.dao.IMemberDAO;
import com.springboot.project.dto.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MemberController {
	
	@Autowired
	IMemberDAO mDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/")
	public String root() {
		return "redirect:/product/productList";
	}
	
	// 회원데이터 목록
	@RequestMapping("/admin/member/memberList")
	public String memberList(Model model) {
		model.addAttribute("list", mDao.listDAO());
		
		return "admin/member/MemberListForm";
	}
	
	// 회원데이터 입력
	@RequestMapping("/member/guest/memberInsertForm")
	public String memberInsertForm() {
		return "member/guest/MemberInsertForm";
	}
	
	@RequestMapping("/member/guest/memberInsert")
	public String memberInsert(HttpServletRequest request, MemberDTO dto) {
		String mbirth = request.getParameter("mbirth1")+"/"+request.getParameter("mbirth2")+"/"+request.getParameter("mbirth3");
		String memail = request.getParameter("memail1")+"@"+request.getParameter("memail2");
		dto.setMbirth(mbirth);
		dto.setMemail(memail);
		
		String encodedPassword = passwordEncoder.encode(dto.getMpwd());
		dto.setMpwd(encodedPassword);
		
		mDao.insertDAO(dto);
		
		return "redirect:/admin/member/memberList";
	}
	
	// 회원데이터 상세
	@RequestMapping("/member/memberDetail")
	public String memberDetail(HttpServletRequest request, Model model) {
		
		String mcode = request.getParameter("mcode");
		
		model.addAttribute("detail", mDao.oneOfListDAO(mcode));
		
		return "member/MemberDetailForm";
	}
	
	@RequestMapping("/member/myDetail")
	public String myDetail(HttpServletRequest request, Model model) {
		
		String mid = request.getParameter("mid");
		
		model.addAttribute("detail", mDao.findById(mid));
		
		return "member/MemberDetailForm";
	}
	
	// 회원데이터 수정/삭제
	@RequestMapping("/member/passwordCheckForm")
	public String passwordCheckForm(HttpServletRequest request, Model model) {
		String mcode = request.getParameter("mcode");
		String mode = request.getParameter("mode");
		
		model.addAttribute("dto", mDao.oneOfListDAO(mcode));
		model.addAttribute("mode", mode);
		
		return "member/passwordCheckForm";
	}
	
	@RequestMapping("/member/passwordCheck")
	public String passwordCheck(HttpServletRequest request, Model model) {
		String mcode = request.getParameter("mcode");
		String mode = request.getParameter("mode");
		String mpwd = request.getParameter("mpwd");
		MemberDTO dto = mDao.oneOfListDAO(mcode);
		boolean pwdchk = passwordEncoder.matches(mpwd, dto.getMpwd());
		
		String memail = request.getParameter("memail");
		String[] memailA = memail.split("@");
		
		String mbirth = request.getParameter("mbirth");
		String[] mbirthA = mbirth.split("-");
		
		if(pwdchk) {
			if(mode.equals("update")) {
				model.addAttribute("edit", mDao.oneOfListDAO(mcode));
				model.addAttribute("mbirthA", mbirthA);
				model.addAttribute("memailA", memailA);
				
				return "member/MemberUpdateForm";
			} else if(mode.equals("delete")) {
				mDao.deleteDAO(mcode);
				return "redirect:/admin/member/memberList";
			}
		}
		
		model.addAttribute("msg", "비밀번호가 틀렸습니다.");
		model.addAttribute("mcode", mDao.oneOfListDAO(mcode));
		model.addAttribute("mode", mode);
		
		return "member/passwordCheckForm";
	}
	
	@RequestMapping("/member/memberUpdate")
	public String memberUpdate(HttpServletRequest request, MemberDTO dto) {
		String mbirth = request.getParameter("mbirth1")+"/"+request.getParameter("mbirth2")+"/"+request.getParameter("mbirth3");
		String memail = request.getParameter("memail1")+"@"+request.getParameter("memail2");
		dto.setMbirth(mbirth);
		dto.setMemail(memail);
		
		String encodedPassword = passwordEncoder.encode(dto.getMpwd());
		dto.setMpwd(encodedPassword);
		
		mDao.updateDAO(dto);
		
		return "redirect:/admin/member/memberList";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping("/home")
	public String home() {
		return "/";
	}
	
	@RequestMapping("/member/guest/idCheck")
	public String idCheck(@RequestParam("mid") String mid, Model model) {
		int idChk = mDao.idchkDAO(mid);
		String countChk = "false";
		if(idChk != 1) {
			countChk = "true";
		}
		
		model.addAttribute("mid",mid);
		model.addAttribute("countChk",countChk);
		
		return "member/guest/idCheck";
	}
	
}

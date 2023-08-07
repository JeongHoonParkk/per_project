package com.lgy.aboutus.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lgy.aboutus.dto.BoardDto;
import com.lgy.aboutus.dto.MemberDto;
import com.lgy.aboutus.service.AboutUsService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AboutUsController {
	@Autowired
	private AboutUsService service;
	
	//로그인페이지 이동
	@RequestMapping("/login")
	public String login() {
		log.info("loginPage");
		return "login";
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		log.info("logout");
		session.invalidate();
		return "redirect:login";
	}
	
	//회원가입페이지 이동
	@RequestMapping("/register")
	public String register() {
		log.info("registerPage");
		return "register";
	}
	
	//회원가입
	@ResponseBody
	@RequestMapping("/registerOk")
	public void registerOK(@RequestParam HashMap<String, String> param) {
		log.info("registerOK");
		service.regitser(param);
	}
	
	//계정유무
	@ResponseBody
	@RequestMapping("/idCheck")
	public String idCheck(@RequestParam HashMap<String, String> param) {
		log.info("idCheck");
		log.info("@# " + param);
		log.info("@# " + service.idCheck(param));
		if (service.idCheck(param) == 0) {
			return "yes";
		}
		return "no";
	}

	//세션 세팅
	@RequestMapping("/main")
	public String main(@RequestParam HashMap<String, String> param, HttpSession session) {
		log.info("main");
		log.info("mian nickname " + param.get("nickname"));
		session.setAttribute("nickname", param.get("nickname"));
		return "redirect:mainPage";
	}
	
	//메인페이지 이동
	@RequestMapping("/mainPage")
	public String mainPage(@RequestParam HashMap<String, String> param, HttpSession session, Model model) {
		log.info("mainPage");
		param.put("nickname", (String) session.getAttribute("nickname"));
		ArrayList<BoardDto> list = service.contentList(param);
		model.addAttribute("list", list);
		model.addAttribute("nickname", session.getAttribute("nickname"));
		return "main";
	}
	
	//로그인체크
	@ResponseBody
	@RequestMapping("/loginCheck")
	public String loginCheck(@RequestParam HashMap<String, String> param) {
		log.info("loginCheck");
		MemberDto dto = service.login(param);
		String check = "no";
		if (dto != null) {
			return "yes";
		}
		return check;
	}
	
	//글작성
	@ResponseBody
	@RequestMapping("/write")
	public void write(@RequestParam HashMap<String, String> param) {
		log.info("write");
		service.write(param);
		log.info("write end");
	}
	
	//글수정
	@ResponseBody
	@RequestMapping("/update")
	public void update(@RequestParam HashMap<String, String> param) {
		log.info("update");
		service.update(param);
	}
	
	//글삭제
	@ResponseBody
	@RequestMapping("/delete")
	public void delete(@RequestParam HashMap<String, String> param) {
		log.info("#delete");
		log.info("@# " + param);
		service.delete(param);
	}
}

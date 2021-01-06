package com.devmg.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devmg.dto.Chat;
import com.devmg.service.ChatService;


/**
 * Handles requests for the application home page.
 */
@Controller

public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@Autowired
	private ChatService chatservice;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/loginProcess.do/{id}", method = RequestMethod.POST)
	public String loginProcess(@RequestParam @PathVariable  String id, HttpServletRequest request,Model model) {
		
		logger.info("Welcome "+id);
		
    	HttpSession session = request.getSession();
    	session.setAttribute("id", id);
    	
    	//이거 Chat 말고 member로 받아야함 변경작업예정
    	//Service 메소드 호출
		List<Chat> list =chatservice.SelectUSerService();
		
		//View에 모델값 전달
				model.addAttribute("list",list);
				
				
//		return "chat";
		return "chat2";
	}
	
}

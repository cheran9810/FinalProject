package com.devmg.app;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devmg.dto.Chat;
import com.devmg.dto.Member;
import com.devmg.service.ChatService;

@Controller
public class ChattingListController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChattingListController.class);
	@Autowired
	private ChatService chatservice;
	
	@RequestMapping(value = "/chattingList", method = RequestMethod.GET)
	public String ChattingList( Model model,HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		String myid = session.getAttribute("id").toString();
		
		System.out.println("myid : !!!"+myid);
		Chat chat=new Chat();
		chat.setSender(myid);
		List<Chat> list= chatservice.ChattingList(chat);
		
		model.addAttribute("list",list);
		return "chatList";
	}
	
	
	
	@RequestMapping(value="/test03_ok")
	public String  ajaxTest03_ok(Model model,HttpServletRequest request,
			@RequestParam Map<String, Object> param

			) {
		logger.info("AJAX TEST 03 요청 성공");
		
		String sen=param.get("allData[senderid]").toString();
		String rec=param.get("allData[recieverid]").toString();
		
		System.out.println("rec,send : "+sen+rec);
		
		HttpSession session = request.getSession();
		String myid = session.getAttribute("id").toString();
		
		System.out.println("myid : !!!"+myid);
		Chat chat=new Chat();
		chat.setSender(myid);
		
		chat.setReciever(rec);
		chatservice.UpdateChattingService(chat);
		List<Chat> list= chatservice.ChattingList(chat);
		
		model.addAttribute("list",list);
		
		
		return "ChatAjax";
	}
	
	
	@RequestMapping(value="/test04_ok")
	public void  ajaxTest04_ok(Model model,HttpServletRequest request,
			@RequestParam Map<String, Object> param

			) {
		logger.info("AJAX TEST 04 요청 성공");
		
		String sen=param.get("allData[senderid]").toString();
		String rec=param.get("allData[recieverid]").toString();
		
		System.out.println("rec,send : "+sen+rec);
		
		HttpSession session = request.getSession();
		String myid = session.getAttribute("id").toString();
		
		System.out.println("myid : !!!"+myid);
		Chat chat=new Chat();
		chat.setSender(myid);
		
		chat.setReciever(rec);
		chatservice.DeleteChatList(chat);
		
		
		
		
	}

}

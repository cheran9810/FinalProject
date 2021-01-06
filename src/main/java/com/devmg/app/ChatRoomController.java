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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devmg.dto.Chat;
import com.devmg.dto.Member;
import com.devmg.service.ChatService;


@Controller
public class ChatRoomController {

	/*
	 * private static final Logger logger =
	 * LoggerFactory.getLogger(HomeController.class);
	 */
	
	
	@Autowired
	private ChatService chatservice;
	
	
	@RequestMapping(value = "/chatroom", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request
			) {
		/* logger.info("Welcome home! The client locale is {}.", locale); */
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		HttpSession session = request.getSession();
		
		//여기서sender=내아이디 reciever=상대아이디
		String sender = session.getAttribute("id").toString();
		String reciever=request.getParameter("email").toString();
		
		
		System.out.println("sender =" +sender);
		System.out.println("reciever =" +reciever);
		Chat chat = new Chat();
		
		chat.setReciever(reciever);
		chat.setSender(sender);
		
		//Service 메소드 호출
		//처음 페이지 호출할 때 전체 메세지 조회해서 가져옴
		Member member=new Member();
		member.setId(sender);
		System.out.println("유저이메일 : "+member.getId());
		List<Member> member2=chatservice.SelectNickByEmail(member);
		List<Chat> list =chatservice.SelectMessageService(chat);
		
		chatservice.UpdateChattingService(chat);
		//처음채팅들어갈시 전체메시지 읽음
				//View에 모델값 전달
		model.addAttribute("list",list);
		model.addAttribute("nick",member2.get(0).getNick());
		model.addAttribute("reciever",reciever);
		model.addAttribute("sender",sender);
		
		return "chatRoom";
	}
	
	

	

	
	
	
	
	
	
	
}

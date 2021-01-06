package com.devmg.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmg.dao.UserDao;
import com.devmg.dao.UserDaoImpl;
import com.devmg.dto.Chat;
import com.devmg.dto.Member;


@Service
public class ChatServiceImpl implements ChatService{
	
	private static final Logger logger 
	= LoggerFactory.getLogger(ChatServiceImpl.class);
	
	@Autowired
	private UserDao userDao;
	
	
	@Override
	public List<Chat> SelectUSerService(){
		
		logger.info("시작");
		
		List<Chat> list=userDao.selectAllUser();
		
		logger.info("끝");
		
		return list;
	}
	
	@Override
	public List<Chat> SelectMessageService(Chat chat){
		
	
		SimpleDateFormat beforeformat = new SimpleDateFormat ( "yyyy-MM-dd hh:mm:ss.SSS");
		SimpleDateFormat afterformat = new SimpleDateFormat ( "yyyy-MM-dd HH시mm분");
		
		List<Chat> list=userDao.selectAllMessage(chat);

		for(int i =0; i<list.size(); i++) {
			String final_date="null";
		
		String send_time=list.get(i).getSend_time();
		Date tempDate = null;
		try {
			tempDate=beforeformat.parse(send_time);
			final_date=afterformat.format(tempDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		list.get(i).setSend_time(final_date);
		

		}
		
		return list;
	}

	@Override
	public int InsertMessageService(Chat chat) {
		UserDao userDaoo = new UserDaoImpl();
	
		int a=userDaoo.insertMessage(chat);

	
		return a;
		
	}

	@Override
	public List<Member> SelectNickByEmail(Member member) {
		
		
		List<Member> list=userDao.selectNickByEmail(member);
		return list;
	}

	@Override
	public List<Chat> ChattingList(Chat chat) {
		
		SimpleDateFormat beforeformat = new SimpleDateFormat ( "yyyy-MM-dd hh:mm:ss.SSS");
		SimpleDateFormat afterformat = new SimpleDateFormat ( "yyyy-MM-dd HH시mm분");
		
		List<Chat> list=userDao.selectChattingList(chat);
		
		for(int i =0; i<list.size(); i++) {
			String final_date="null";
		
		String send_time=list.get(i).getSend_time();
		Date tempDate = null;
		try {
			tempDate=beforeformat.parse(send_time);
			final_date=afterformat.format(tempDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		list.get(i).setSend_time(final_date);
		

		}
		return list;
	}

	@Override
	public void UpdateChattingService(Chat chat) {
		userDao.updateChecked(chat);
		
	}

	@Override
	public void DeleteChatList(Chat chat) {
		userDao.DeleteChatlist(chat);
		userDao.DeleteChatlistIndex(chat);
		
	}
	
	
	
	
	
	
}

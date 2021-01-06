package com.devmg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.devmg.dto.Chat;
import com.devmg.dto.Member;

public class UserDaoImpl implements UserDao{
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public List<Chat> selectAllUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Chat> selectAllMessage(Chat chat) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Member> selectNickByEmail(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMessage(Chat chat) {
		Connection conn=JDBCTemplate.getConnection();


		String sql = "";
		sql += " insert into chat_tb (sender,reciever,message,send_time) ";
		sql += "values (?,?,?,?)";
		int result = 0;
		
	
		try {
			//SQL 수행 객체 처리
			ps = conn.prepareStatement(sql);
			ps.setString(1, chat.getSender());
			ps.setString(2, chat.getReciever());
			ps.setString(3, chat.getMessage());
			System.out.println("성공");
			try {
			  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
			 Date parsedDate = dateFormat.parse(chat.getSend_time());
		    Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
			ps.setTimestamp(4, timestamp);
			System.out.println("성공");
			} catch(Exception e) { 
				System.out.println("실패");
			}
		
	
//			System.out.println("getSender:"+chat.getSender());
//			System.out.println("getReciever:"+chat.getReciever());
//			System.out.println("getMessage:"+chat.getMessage());
//			System.out.println("getSend_time:"+chat.getSend_time());
	
			
			
			//SQL 수행
			result =ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원 해제
			JDBCTemplate.close(ps);
		}
		return result;
		
	}

	@Override
	public List<Chat> selectChattingList(Chat chat) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateChecked(Chat chat) {
		// TODO Auto-generated method stub
	}

	@Override
	public void DeleteChatlist(Chat chat) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void DeleteChatlistIndex(Chat chat) {
		// TODO Auto-generated method stub
		
	}



}

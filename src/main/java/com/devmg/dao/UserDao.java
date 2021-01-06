package com.devmg.dao;

import java.util.List;



import com.devmg.dto.Chat;
import com.devmg.dto.Member;


public interface UserDao {
	
	
	
	/**
	 * 기존 유저리스트 가져오기 삭제할듯.. 
	 * @return
	 */
	public List<Chat> selectAllUser();
	/**
	 * 
	 * @param chat
	 * @return
	 */
	public List<Chat> selectAllMessage(Chat chat);
	/**
	 * 
	 * @param chat
	 * @return
	 */
	public int insertMessage(Chat chat);
	/**
	 * 수정예정 삭제또는 ..
	 * @param member
	 * @return
	 */
	public List<Member> selectNickByEmail(Member member);

	/**
	 * 채팅리스트 가져오기
	 * @param chat 세션에서받아온내아이디
	 * @return 리스트
	 */
	public List<Chat> selectChattingList(Chat chat);
	/**
	 * 읽음 확인 체크
	 * @param chat
	 */
	public void updateChecked(Chat chat);
	
	/*
	 * 채팅목록삭제
	 * 
	 */
	public void DeleteChatlist(Chat chat);
	public void DeleteChatlistIndex(Chat chat);

}

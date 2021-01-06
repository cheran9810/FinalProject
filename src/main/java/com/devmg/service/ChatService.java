package com.devmg.service;

import java.util.List;

import com.devmg.dto.Chat;
import com.devmg.dto.Member;

public interface ChatService {

	/**
	 * 유저목록 셀렉트해오는 서비스.. 임시로해놓은거라 굳이필요하진않음
	 * @return
	 */
	public List<Chat> SelectUSerService();

	/**
	 * 그사람의 모든 메세지 조회해서 출력
	 * @param chat
	 * @return
	 */
	public List<Chat> SelectMessageService(Chat chat);
	
	/**
	 * 메세지 백업을 위해 디비에 인서트
	 * @param chat
	 */
	public int InsertMessageService(Chat chat);
	
	
	public List<Member> SelectNickByEmail(Member member);

	/**
	 * 채팅 목록 페이지에서 나의채팅목록 가져오는 서비스
	 * @return
	 */
	public List<Chat> ChattingList(Chat chat);

	public void UpdateChattingService(Chat chat);

	public void DeleteChatList(Chat chat);

}

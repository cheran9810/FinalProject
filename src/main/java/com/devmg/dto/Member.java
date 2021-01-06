package com.devmg.dto;

public class Member {

	private String id;

	private String user_name;
	private String user_pw;
	private String user_phone;
	private String user_loc;
	private String nick;
	@Override
	public String toString() {
		return "Member [id=" + id + ", user_name=" + user_name + ", user_pw=" + user_pw + ", user_phone=" + user_phone
				+ ", user_loc=" + user_loc + ", nick=" + nick + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_loc() {
		return user_loc;
	}
	public void setUser_loc(String user_loc) {
		this.user_loc = user_loc;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
}

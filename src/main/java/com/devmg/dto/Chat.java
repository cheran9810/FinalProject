package com.devmg.dto;

import java.util.Date;

public class Chat {

	private String user_name;
	private String user_id;
	private String id;
	private String nick;
	private String sender_nick;
	private String receiver_nick;
	private String sender;
	private String reciever;
	private String message;
	private String send_time;
	private int unchecked;
	private String delete_id;
	private int delete_index;
	@Override
	public String toString() {
		return "Chat [user_name=" + user_name + ", user_id=" + user_id + ", id=" + id + ", nick=" + nick
				+ ", sender_nick=" + sender_nick + ", receiver_nick=" + receiver_nick + ", sender=" + sender
				+ ", reciever=" + reciever + ", message=" + message + ", send_time=" + send_time + ", unchecked="
				+ unchecked + ", delete_id=" + delete_id + ", delete_index=" + delete_index + "]";
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getId() {
		return id;
	}
	public int getChecked() {
		return unchecked;
	}
	public void setChecked(int checked) {
		this.unchecked = checked;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getSender_nick() {
		return sender_nick;
	}
	public void setSender_nick(String sender_nick) {
		this.sender_nick = sender_nick;
	}
	public String getReceiver_nick() {
		return receiver_nick;
	}
	public void setReceiver_nick(String receiver_nick) {
		this.receiver_nick = receiver_nick;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	public int getUnchecked() {
		return unchecked;
	}
	public void setUnchecked(int unchecked) {
		this.unchecked = unchecked;
	}
	public String getDelete_id() {
		return delete_id;
	}
	public void setDelete_id(String delete_id) {
		this.delete_id = delete_id;
	}
	public int getDelete_index() {
		return delete_index;
	}
	public void setDelete_index(int delete_index) {
		this.delete_index = delete_index;
	}
	
	
	
	
}

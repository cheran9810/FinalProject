package web.dto;

import java.util.Date;

public class Comment {
	private int rnum;
	private int commentNo;
	private int regNo;
	private String userid;
	private String content;
	private Date writeDate;
	private int report;
	private String secretReply;

	@Override
	public String toString() {
		return "Comment [rnum=" + rnum + ", commentNo=" + commentNo + ", regNo=" + regNo + ", userid=" + userid
				+ ", content=" + content + ", writeDate=" + writeDate + ", report=" + report + ", secretReply="
				+ secretReply + "]";
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getRegNo() {
		return regNo;
	}

	public void setRegNo(int regNo) {
		this.regNo = regNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public String getSecretReply() {
		return secretReply;
	}

	public void setSecretReply(String secretReply) {
		this.secretReply = secretReply;
	}

}
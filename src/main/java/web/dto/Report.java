package web.dto;

public class Report {

	private String userid;
	private int commentNo;

	@Override
	public String toString() {
		return "Report [userid=" + userid + ", commentNo=" + commentNo + "]";
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

}

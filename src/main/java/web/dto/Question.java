package web.dto;

import java.util.Date;

public class Question {
	
	private int qPk;
	private String qTitle;
	private String qContent;
	private String qCategory;
	private String userEmail;
	private Date qDate;
	
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	@Override
	public String toString() {
		return "Question [qPk=" + qPk + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qCategory=" + qCategory
				+ ", userEmail=" + userEmail + "]";
	}
	public int getqPk() {
		return qPk;
	}
	public void setqPk(int qPk) {
		this.qPk = qPk;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqCategory() {
		return qCategory;
	}
	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
}

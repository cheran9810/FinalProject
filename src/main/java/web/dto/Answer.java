package web.dto;

public class Answer {
	
	private int aPk;
	private String aTitle;
	private String aContent;
	private int qPk;
	
	@Override
	public String toString() {
		return "Answer [aPk=" + aPk + ", aTitle=" + aTitle + ", aContent=" + aContent + ", qPk=" + qPk + "]";
	}
	public int getaPk() {
		return aPk;
	}
	public void setaPk(int aPk) {
		this.aPk = aPk;
	}
	public String getaTitle() {
		return aTitle;
	}
	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public int getqPk() {
		return qPk;
	}
	public void setqPk(int qPk) {
		this.qPk = qPk;
	}
	
}

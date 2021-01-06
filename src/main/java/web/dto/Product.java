package web.dto;

import java.util.Date;

// 파이널
public class Product {

	private int regNo; // 게시글 번호
	private String tradeClass; // 판매, 구매
	private String category; // 카테고리
	private int price; // 가격
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private int quantity; // 제품 수량
	private String userEmail; // 작서자
	private String location; // 지역
	private Date regDate; // 작성날짜
	private String gu; // 구
	private String si; // 시
	private int hit; // 조회수
	private int recommend; // 추천
	private int commentNo; // 댓글번호
	
	private String file_path;
	private String stored_name;
	private String file_kind;

	@Override
	public String toString() {
		return "Product [regNo=" + regNo + ", tradeClass=" + tradeClass + ", category=" + category + ", price=" + price
				+ ", title=" + title + ", content=" + content + ", quantity=" + quantity + ", userEmail=" + userEmail
				+ ", location=" + location + ", regDate=" + regDate + ", gu=" + gu + ", si=" + si + ", hit=" + hit
				+ ", recommend=" + recommend + ", commentNo=" + commentNo + ", filePath=" + file_path + ", fileName="
				+ stored_name + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	public int getRegNo() {
		return regNo;
	}

	public void setRegNo(int regNo) {
		this.regNo = regNo;
	}

	public String getTradeClass() {
		return tradeClass;
	}

	public void setTradeClass(String tradeClass) {
		this.tradeClass = tradeClass;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getSi() {
		return si;
	}

	public void setSi(String si) {
		this.si = si;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getFilePath() {
		return file_path;
	}

	public void setFilePath(String filePath) {
		this.file_path = filePath;
	}

	public String getFileName() {
		return stored_name;
	}

	public void setFileName(String fileName) {
		this.stored_name = fileName;
	}

}

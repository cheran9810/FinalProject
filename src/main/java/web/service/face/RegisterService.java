package web.service.face;

import java.util.List;

import file.dto.Filetest;
import web.dto.Comment;
import web.dto.Member;
import web.dto.Product;
import web.dto.Recommend;
import web.dto.Report;
import web.dto.ReportBoard;
import web.util.Paging;

public interface RegisterService {

	public Paging getPaging(Paging curPage);
	
	// 조건 검색 시 사용할 함수
	public List<Product> list(List<String> location, List<String> category, String search, String price, Paging paging, String dong);
	/*
	 * public List<Product> list(List<String> location, List<String> category,
	 * String search, String price, Paging paging);
	 */
	/**
	 * 사고 파는 게시글 등록!
	 * @param product 제목,내용,수량,가격 등 들어간 객체
	 */
	void registContents(Product product);

	public Product boardView(Product viewBoard);

	public void delete(Product product);

	public boolean recommend(Recommend recommend);

	public int getTotalCntRecommend(Recommend recommend);

	public boolean isRecommend(Recommend recommend);

	public List getCommentList(Product product);

	public boolean deleteComment(Comment comment);

	public boolean report(Report report);

	public int getTotalCntReport(Report report);

	public void updateComment(Comment comment);
	
	 public boolean isReport(Report report);

	public boolean reportBoard(ReportBoard reportBoard);

	public int getTotalCntReportBoard(ReportBoard reportBoard);

	public boolean isReportBoard(ReportBoard reportBoard);

	public void insertComment(Comment comment);

	public List<Filetest> getFileList(Product viewBoard);

	public void update(Product product);

	public Member searchDong(Member member);

	
}

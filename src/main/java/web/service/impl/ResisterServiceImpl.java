package web.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import file.dto.Filetest;
import web.dao.face.CommentDao;
import web.dao.face.RecommendDao;
import web.dao.face.RegisterProductDao;
import web.dto.Comment;
import web.dto.Member;
import web.dto.Product;
import web.dto.Recommend;
import web.dto.Report;
import web.dto.ReportBoard;
import web.service.face.RegisterService;
import web.util.Paging;

@Service
public class ResisterServiceImpl implements RegisterService {

	@Autowired
	RegisterProductDao register;
	@Autowired
	private RecommendDao recommendDao;
	@Autowired
	private CommentDao commentDao;

	@Override
	public Paging getPaging(Paging curPage) {

		// 전체 게시글 수 조회
		System.out.println("curPage : " + curPage);
		int totalCount = register.selectCntAll(curPage);

		// 페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage.getCurPage());
		System.out.println("paging : " + paging);

		return paging;
	}

	@Override
	public List<Product> list(List<String> location, List<String> category, String search, String price, Paging paging, String dong) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("location", location);
	      map.put("category", category);
	      map.put("search", search);
	      map.put("price", price);
	      map.put("paging", paging);
	      map.put("startNo",paging.getStartNo());
	      map.put("endNo",paging.getEndNo());
	      map.put("dong", dong);
		
		/* List<Product> checklist = boardDao.checklistMap(map); */
		
		return register.checklistMap(map);
	}
	/*
	 * @Override public List<Product> list(List<String> location, List<String>
	 * category, String search, String price, Paging paging) {
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * map.put("location", location); map.put("category", category);
	 * map.put("search", search); map.put("price", price); map.put("paging",
	 * paging); map.put("startNo",paging.getStartNo());
	 * map.put("endNo",paging.getEndNo());
	 * 
	 * List<Product> checklist = boardDao.checklistMap(map);
	 * 
	 * return register.checklistMap(map); }
	 */

	@Override
	public void registContents(Product product) {
		// 컨텐츠 인서트
		register.insertProduct(product);

	}

	@Override
	public Product boardView(Product viewBoard) {

		register.updateHit(viewBoard);
		return register.selectBoardByBoardNo(viewBoard);
	}

	@Override
	public void delete(Product product) {
		register.delete(product);
	}

	@Override
	public boolean isRecommend(Recommend recommend) {
		int cnt = recommendDao.selectCntRecommend(recommend);

		if (cnt > 0) { // 추천했음
			return true;

		} else { // 추천하지 않았음
			return false;

		}
	}

	@Override
	public boolean recommend(Recommend recommend) {
		System.out.println("추천 확인");
		if (isRecommend(recommend)) { // 추천한 상태 요거 실행이 아무것도 안되네요
			recommendDao.deleteRecommend(recommend);
			System.out.println("추천");
			return false;
//이게 두개다 실행이 안됨 일단 이거 좀 나중에 시간좀 두고 봐야될거같은데 네네 게시글 삭제 우선 되나 해보죠 좀 걸리더라도네!!
		} else { // 추천하지 않은 상태
			recommendDao.insertRecommend(recommend);
			System.out.println("안함");
			return true;

		}

	}

	@Override
	public int getTotalCntRecommend(Recommend recommend) {
		return recommendDao.selectTotalCntRecommend(recommend);
	}

	@Override
	public List getCommentList(Product product) {

		return commentDao.selectComment(product);
	}

	@Override
	public boolean deleteComment(Comment comment) {
		commentDao.deleteComment(comment);

		if (commentDao.countComment(comment) > 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void updateComment(Comment comment) {
		commentDao.updateComment(comment);

	}

	@Override
	public boolean isReport(Report report) {
		int cnt = commentDao.selectCntReport(report);

		if (cnt > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean report(Report report) {

		if (isReport(report)) {
			return false;
		} else {
			commentDao.insertReport(report);
			return true;
		}

	}

	@Override
	public int getTotalCntReport(Report report) {
		return commentDao.selectTotalCntReport(report);
	}

	@Override
	public int getTotalCntReportBoard(ReportBoard reportBoard) {

		return recommendDao.selectTotalCntReportBoard(reportBoard);
	}

	@Override
	public boolean reportBoard(ReportBoard reportBoard) {
		if (isReportBoard(reportBoard)) {
			return false;
		} else {

			recommendDao.insertReportBoard(reportBoard);
			return true;
		}

	}

	@Override
	public boolean isReportBoard(ReportBoard reportBoard) {
		int cnt = recommendDao.selectCntReportBoard(reportBoard);
		if (cnt > 0) { // 신고 했음
			return true;
		} else { // 신고하지 않았음
			return false;
		}
	}

	@Override
	public void insertComment(Comment comment) {
		commentDao.insertComment(comment);
	}

	@Override
	public List<Filetest> getFileList(Product viewBoard) {
		return register.selectFile(viewBoard);
	}

	@Override
	public void update(Product product) {
		register.update(product);

	}

	@Override
	public Member searchDong(Member member) {
		// TODO Auto-generated method stub
		return register.searchDong(member);
	}
}

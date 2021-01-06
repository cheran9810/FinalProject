package web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.dto.Answer;
import web.dto.Comment;
import web.dto.Member;
import web.dto.Product;
import web.service.face.AdminService;
import web.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public Paging getQAPaging(Paging curPage) {
		
		int totalCount = adminDao.selectQACnt();

		Paging paging = new Paging(totalCount, curPage.getCurPage());

		return paging;
	}
	
	@Override
	public List<Map<String, Object>> getQAList(Paging paging) {
		
		return adminDao.selectQAList(paging);
	}
	
	@Override
	public void amdinQAWrite(Answer answer) {
		adminDao.insertAnswer(answer);
	}
	
	@Override
	public boolean checkWrite(Answer answer) {
		
		int check = adminDao.selectWriteCheck(answer);
		if(check > 0) {
			return false;
		}else {
			return true;
		}
	}
	
	@Override
	public void adminQAUpdate(Answer answer) {
		adminDao.updateAnswer(answer);
	}
	
	@Override
	public void adminQADelete(Answer answer) {
		adminDao.deleteAnswer(answer);
	}
	
	@Override
	public Paging boardReportPaging(Paging curPage) {
		int totalCount = adminDao.selectBoardReportCnt();

		Paging paging = new Paging(totalCount, curPage.getCurPage());

		return paging;
	}
	
	@Override
	public List<Map<String, Object>> getBoardReportList(Paging paging) {
		return adminDao.selectBoardReportList(paging);
	}
	
	@Override
	public Paging commentReportPaging(Paging curPage) {
		
		int totalCount = adminDao.selectCommentReportCnt();

		Paging paging = new Paging(totalCount, curPage.getCurPage());

		return paging;
	}
	
	@Override
	public List<Map<String, Object>> getcommentReportList(Paging paging) {
		
		return adminDao.selectCommentReportList(paging);
	}
	
	@Override
	public void reportBoardDelete(Product product) {
		adminDao.BoardDeleteByRegNo(product);
	}
	
	@Override
	public void reportCommentDelete(Comment comment) {
		adminDao.CommentDeleteByCommentNo(comment);
		
	}
	
	@Override
	public void memberDelete(Member member) {
		adminDao.memberDeleteById(member);
		
	}
}

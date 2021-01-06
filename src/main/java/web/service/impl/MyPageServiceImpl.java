package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MyPageDao;
import web.dto.Member;
import web.service.face.MyPageService;
import web.util.Paging;

@Service
public class MyPageServiceImpl implements MyPageService{

	private static final Logger logger = LoggerFactory.getLogger(MyPageServiceImpl.class);

	@Autowired private MyPageDao myPageDao;

	@Override
	public Map<String, Object> getData(String id) {
		return myPageDao.selectById(id);
	}
	


	@Override
	public List<Map<String, Object>> myRegList(Paging paging) {
		return myPageDao.selectMyRegById(paging);
	}

	@Override
	public List<Map<String, Object>> myCommentList(Paging paging) {
		return myPageDao.selectMyCommentById(paging);
	}

	@Override
	public Paging getPaging(Paging curPage) {
		
		//전체 게시글 수 조회
		int totalCount = myPageDao.selectCntAll(curPage);
		
		//페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage.getCurPage());
						
		return paging;
	}

	@Override
	public Paging getPagingCmt(Paging curPage) {
		
		//전체 게시글 수 조회
		int totalCount = myPageDao.selectCntCmt(curPage);
				
		//페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage.getCurPage());
								
		return paging;
	}

	@Override
	public void editdata(HttpSession session, Member member) {
		Member memberedit = new Member();
		
		memberedit.setId((String) session.getAttribute("id"));
		memberedit.setPw(member.getPw());
		memberedit.setNick(member.getNick());
		memberedit.setLoc(member.getLoc());
		memberedit.setSido(member.getSido());
		memberedit.setDong(member.getDong());
		
		myPageDao.updateMember(memberedit);
	}
	

	@Override
	public void deleteMyPost(HashMap<String, Object> map) {

		myPageDao.deletePost(map);
		
	}

	@Override
	public void deleteMyCmt(HashMap<String, Object> map) {
		
		myPageDao.deleteCmt(map);
	}

	@Override
	public List<Map<String, Object>> getScrap(String id) {
		return myPageDao.selectScrap(id);
	}
	
	@Override
	public void deleteMyScrap(HashMap<String, Object> map) {

		myPageDao.deleteScrap(map);
		
	}
}

package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Answer;
import web.dto.Member;
import web.dto.Question;
import web.service.face.MemberService;
import web.util.Paging;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired private MemberDao memberDao;
	
	@Override
	public boolean join(Member writer) {
		if(memberDao.selectByUserid(writer)>0)
			return false;
		
		memberDao.join(writer);
		
		if(memberDao.selectByUserid(writer)>0)
			return true;
		else return false;
	}

	@Override
	public boolean login(Member writer) {
		int loginChk = memberDao.login(writer);
		
		if(loginChk > 0)	return true;
		else return false;
	}

	@Override
	public String getUsernick(Member writer) {
		return memberDao.getUsernick(writer);
	}
	@Override
	public Member selectOneMember(String email) {
		return memberDao.selectOneMember(email);
	}
	@Override
	public Paging getPagingByID(Paging curPage, String userEmail) {
		
		int totalCount = memberDao.selectCntByID(userEmail);
		
		Paging paging = new Paging(totalCount, curPage.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> myQAList(Paging paging, String userEmail) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		map.put("userEmail", userEmail);
		
		System.out.println(map);
		
		return memberDao.myQaList(map);
	}
	
	@Override
	public void QAwrite(Question question) {
		
		memberDao.qaWrite(question);
	}
	
	@Override
	public Question memberQADetail(Question question) {
		
		return memberDao.memberQAByQpk(question);
	}

	@Override
	public Answer memberQADetail(Answer answer) {
		return memberDao.memberQAByApk(answer);
	}
	
	@Override
	public void memberQAUpdate(Question question) {
	
		memberDao.qaUpdate(question);
	}
	
	@Override
	public void memberQADelete(Question question) {
		System.out.println("삭제 동작"+ question);
		memberDao.qaDelete(question);
	}
}

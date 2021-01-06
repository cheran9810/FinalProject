package web.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import web.dto.Member;
import web.util.Paging;

public interface MyPageService {

	public Map<String, Object> getData(String id);

	/**
	 * 내가 작성한 게시글 전체 조회
	 * @param paging
	 * @return
	 */
	public List<Map<String, Object>> myRegList(Paging paging);

	/**
	 * 내가 작성한 댓글 전체 조회
	 * @param paging
	 * @return
	 */
	public List<Map<String, Object>> myCommentList(Paging paging);
	
	/**
	 * 내가 작성한 게시글 전체 페이징
	 * @param curPage
	 * @return
	 */
	public Paging getPaging(Paging curPage);

	/**
	 * 내가 작성한 전체 댓글 페이징
	 * @param curPage
	 * @return
	 */
	public Paging getPagingCmt(Paging curPage);


	/**
	 * 내 정보 수정
	 * @param member
	 */
	public void editdata(HttpSession session, Member member);

	/**
	 * 내 게시글 삭제
	 * @param map
	 */
	public void deleteMyPost(HashMap<String, Object> map);

	/**
	 * 내 댓글 삭제
	 * @param map
	 */
	public void deleteMyCmt(HashMap<String, Object> map);

	
	public List<Map<String, Object>> getScrap(String id);

	public void deleteMyScrap(HashMap<String, Object> map);

}

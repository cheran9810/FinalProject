package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dto.Member;
import web.util.Paging;

public interface MyPageDao {

	public Map<String, Object> selectById(String id);

	public List<Map<String, Object>> selectMyRegById(Paging paging);

	public List<Map<String, Object>> selectMyCommentById(Paging paging);

	public int selectCntAll(Paging curPage);

	public int selectCntCmt(Paging curPage);

	public void updateMember(Member memberedit);

	public void deletePost(HashMap<String, Object> map);

	public void deleteCmt(HashMap<String, Object> map);

	public List<Map<String, Object>> selectScrap(String id);

	public void deleteScrap(HashMap<String, Object> map);

}

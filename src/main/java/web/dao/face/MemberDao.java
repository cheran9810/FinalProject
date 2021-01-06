package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Answer;
import web.dto.Member;
import web.dto.Question;

public interface MemberDao {

	public void join(Member writer);
	
	public int selectByUserid(Member writer);
	
	public int login(Member writer);
	
	public String getUsernick(Member writer);

	public Member selectOneMember(String email);

	/**
	 * 작성한 전체 개수 계산
	 * @param userEmail 아이디
	 * @return 아이디에 맞는 리스트 개수 반환
	 */
	int selectCntByID(String userEmail);
	
	/**
	 * 유저 QA
	 * @param map paging, userEmail
	 * @return user QA 리스트 반환
	 */
	List<Map<String, Object>> myQaList(Map<String, Object> map);

	/**
	 * QA 작성 유저
	 * @param question 작성 정보
	 */
	void qaWrite(Question question);
	
	/**
	 * QA 상세보기
	 * @param question
	 * @return
	 */
	Question memberQAByQpk(Question question);

	/**
	 * QA 수정
	 * @param question 수정값
	 */
	void qaUpdate(Question question);

	/**
	 * 삭제
	 * @param question
	 */
	void qaDelete(Question question);

	Answer memberQAByApk(Answer answer);
}













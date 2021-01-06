package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Answer;
import web.dto.Member;
import web.dto.Question;
import web.util.Paging;

public interface MemberService {
	
	public boolean join(Member writer);

	public boolean login(Member writer);

	public String getUsernick(Member writer);

	public Member selectOneMember(String email);

	
	/**
	 * 아이디로 작성한 QA 총 개수 구하기
	 * @param curPage 현제 페이지
	 * @param userEmail 유저 아이디
	 * @return 유저가 작성한 QA페이징 반환
	 */
	Paging getPagingByID(Paging curPage, String userEmail);
	
	/**
	 * QA 페이징 처리 아이디로 검색
	 * @param paging 전체 페이지 현제 페이지
	 * @param userEmail 유저 아이디
	 * @return 유저가 작성한 QA List 반환
	 */
	List<Map<String, Object>> myQAList(Paging paging, String userEmail);

	/**
	 * QA 작성
	 * @param question 작성 데이터
	 */
	void QAwrite(Question question);
	
	/**
	 * QA 상세보기
	 * @param question pk 전송
	 * @return 상세 값
	 */
	Question memberQADetail(Question question);
	Answer memberQADetail(Answer answer);

	/**
	 * QA 수정
	 * @param question 수정된 값
	 */
	void memberQAUpdate(Question question);

	/**
	 * 삭제
	 * @param question
	 */
	void memberQADelete(Question question);
}

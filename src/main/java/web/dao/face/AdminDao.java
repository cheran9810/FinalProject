package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Answer;
import web.dto.Comment;
import web.dto.Member;
import web.dto.Product;
import web.util.Paging;

public interface AdminDao {

	/**
	 * QA 전체 개수
	 * @return
	 */
	int selectQACnt();

	/**
	 * QA 리스트
	 * @param paging
	 * @return
	 */
	List<Map<String, Object>> selectQAList(Paging paging);

	/**
	 * 답글 작성
	 * @param answer
	 */
	void insertAnswer(Answer answer);
	
	/**
	 * 답글 작성 확인
	 * @param answer
	 * @return
	 */
	int selectWriteCheck(Answer answer);

	/**
	 * 답글 수정
	 * @param answer
	 */
	void updateAnswer(Answer answer);

	/**
	 * 답글 삭제
	 * @param answer
	 */
	void deleteAnswer(Answer answer);

	/**
	 * 신고 게시글 개수
	 * @return
	 */
	int selectBoardReportCnt();

	/**
	 * 신고 게시글 리스트
	 * @param paging
	 * @return
	 */
	List<Map<String, Object>> selectBoardReportList(Paging paging);

	/**
	 * 신고 댓글 개수
	 * @return
	 */
	int selectCommentReportCnt();

	/**
	 * 신고 댓글 리스트
	 * @param paging
	 * @return
	 */
	List<Map<String, Object>> selectCommentReportList(Paging paging);

	/**
	 * 게시글 삭제
	 * @param product
	 */
	void BoardDeleteByRegNo(Product product);

	/**
	 * 댓글 삭제
	 * @param comment
	 */
	void CommentDeleteByCommentNo(Comment comment);

	void memberDeleteById(Member member);

	int countMember(Member member);

}

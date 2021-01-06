package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Answer;
import web.dto.Comment;
import web.dto.Member;
import web.dto.Product;
import web.util.Paging;

public interface AdminService {

	/**
	 * QA 페이징
	 * @param curPage
	 * @return
	 */
	Paging getQAPaging(Paging curPage);

	/**
	 * QA 리스트
	 * @param paging
	 * @return
	 */
	List<Map<String, Object>> getQAList(Paging paging);

	/**
	 * 답글
	 * @param answer
	 */
	void amdinQAWrite(Answer answer);
	
	/**
	 * 답글 유무 확인
	 * @param answer
	 * @return
	 */
	boolean checkWrite(Answer answer);

	/**
	 * 답변 수정
	 * @param answer
	 */
	void adminQAUpdate(Answer answer);

	/**
	 * 답변 삭제
	 * @param answer
	 */
	void adminQADelete(Answer answer);

	/**
	 * 게시글 신고 페이징
	 * @param curPage
	 * @return
	 */
	Paging boardReportPaging(Paging curPage);

	/**
	 * 게시글 신고 리스트
	 * @param paging
	 * @return
	 */
	List<Map<String, Object>> getBoardReportList(Paging paging);

	/**
	 * 댓글 신고 페이징
	 * @param curPage
	 * @return
	 */
	Paging commentReportPaging(Paging curPage);

	/**
	 * 댓글 신고 리스트
	 * @param paging
	 * @return
	 */
	List<Map<String, Object>> getcommentReportList(Paging paging);

	/**
	 * 댓글 삭제
	 * @param comment commentNo
	 */
	void reportCommentDelete(Comment comment);

	/**
	 * 게시글 삭제
	 * @param product regNo
	 */
	void reportBoardDelete(Product product);

	void memberDelete(Member member);


}

package web.dao.face;

import java.util.List;

import web.dto.Comment;
import web.dto.Product;
import web.dto.Report;

public interface CommentDao {

	public List selectComment(Product product);
	
	public void insertComment(Comment comment);
	
	public void updateComment(Comment comment);

	public void deleteComment(Comment comment);

	public int countComment(Comment comment);

	public int selectCntReport(Report report);

	public void insertReport(Report report);

	public int selectTotalCntReport(Report report);

	public int countReport(Report report);

}

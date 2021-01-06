package web.dao.face;

import web.dto.Recommend;
import web.dto.ReportBoard;

public interface RecommendDao {

	public int selectCntRecommend(Recommend recommend);

	public void insertRecommend(Recommend recommend);
	
	public void deleteRecommend(Recommend recommend);
	
	public int selectTotalCntRecommend(Recommend recommend);

	public int selectCntReportBoard(ReportBoard reportBoard);

	public void insertReportBoard(ReportBoard reportBoard);

	public int selectTotalCntReportBoard(ReportBoard reportBoard);
	
}

















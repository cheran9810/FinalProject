package web.dao.face;

import web.dto.ReportBoard;

public interface ReportBoardDao {

	public int selectCntReportBoard(ReportBoard reportBoard);

	public int selectTotalCntReportBoard(ReportBoard reportBoard);

	public void insertReportBoard(ReportBoard reportBoard);

}

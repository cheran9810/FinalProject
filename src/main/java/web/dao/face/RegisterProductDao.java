package web.dao.face;

import java.util.HashMap;
import java.util.List;

import file.dto.Filetest;
import web.dto.Member;
import web.dto.Product;
import web.dto.Recommend;
import web.util.Paging;

public interface RegisterProductDao {
	
	public int selectCntAll(Paging paging);

	// 조건 검색 시 사용
	public List<Product> checklistMap(HashMap<String, Object> map);

	/**
	 * product 테이블에 인서트하는 쿼리
	 * @param product
	 */
	public void insertProduct(Product product);

	/**
	 * 조회수 증가하는 쿼리
	 * @param viewBoard
	 */
	public void updateHit(Product viewBoard);

	/**
	 * boardNo에 해당하는 게시글 내용 확인
	 * @param viewBoard
	 * @return
	 */
	public Product selectBoardByBoardNo(Product viewBoard);
	/**
	 * 게시글 삭제
	 * @param product 테이블 delete 쿼리
	 */

	public void delete(Product product);

	public List<Filetest> selectFile(Product viewBoard);

	public void update(Product product);
	public Member searchDong(Member member);


}

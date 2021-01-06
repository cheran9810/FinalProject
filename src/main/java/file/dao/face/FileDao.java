package file.dao.face;



import file.dto.Filetest;

public interface FileDao {
	
	/**
	 * 전달된 파일 정보를 삽입
	 * 
	 * @param filetest 업로드된 파일의 정보
	 */

	
	public void insertFile(Filetest filetest);
	


}

package file.service.face;



import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public interface FileService {
	/**
	 * 업로드된 파일을 처리한다
	 * 
	 * @param fileupload 업로드 파일 정보 객체
	 */
	public void filesave(MultipartFile fileupload);


}

package file.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import file.dao.face.FileDao;
import file.dto.Filetest;
import file.service.face.FileService;

@Service
public class FileServiceImpl implements FileService{

	
	private static final Logger logger	= LoggerFactory.getLogger(FileServiceImpl.class);

	@Autowired ServletContext context;
	
	@Autowired FileDao fileDao;
	
	@Override
	public void filesave(MultipartFile fileupload) {

		logger.info("filesave()");
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload");
		logger.info("realPath:" + storedPath);
		
		System.out.println("파일경로 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + storedPath);
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if(!stored.exists()) {
			stored.mkdir();
			
		}
		//~~~~~~
		
		
		//저장될 파일의 이름
		String filename=fileupload.getOriginalFilename();
		String Fname=fileupload.getOriginalFilename();
		//UUID값 생성
		
		String uid=UUID.randomUUID().toString().split("-")[4]; logger.info(uid);
		//파일이름에 UUID 추가하기 filename+=uid;
		
		
		
		int pos = Fname.lastIndexOf( "." );
		String ext = Fname.substring( pos + 1 );

		//저장될 파일 정보 객체
		File dest=new File(stored+"\\"+uid+"."+ext);
		System.out.println("dest>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+dest);
		try {
			//업로드된 파일 저장하기
			fileupload.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//확장자 구하기
		
		//DB에 기록하기
		Filetest filetest = new Filetest();
		
		filetest.setOriginName(fileupload.getOriginalFilename());
		filetest.setStoredName(uid+"."+ext);
		filetest.setFilePath(storedPath);
		filetest.setFileKind(ext);
		fileDao.insertFile(filetest);
		
		
		
	}

	

}

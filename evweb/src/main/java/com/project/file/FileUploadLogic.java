package com.project.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class FileUploadLogic {
	// 파일을 업로드한 후 이 정보를 BoardFileDTO로 변환해서 리턴
	public List<BoardFileDTO> uploadFiles(List<MultipartFile> multipartFiles, String path) throws IllegalStateException, IOException{
		List<BoardFileDTO> filedtolist = new ArrayList<BoardFileDTO>();
		for(MultipartFile multipartFile : multipartFiles) {
			if(!multipartFile.isEmpty()) {
				// 클라이언트가 업로드한 파일명
				// getOriginalFilename() => 업로드한 파일의 이름을 구해주는 메소드
				String originalFilename = multipartFile.getOriginalFilename();
				// 1. 서버에서 식별할 수 있도록 파일명 변경하기
				String storeFilename = createStoreFilename(originalFilename); 
				//System.out.println("오리지널 파일 이름 : "+originalFilename);
				
				// 2. File객체를 실제 경로에 저장하는 작업.
				// void transferTo(File dest)=> 업로드한 파일 데이터를 지정한 파일에 저장해주는 메소드
				// path : 디렉토리 경로
				// File.separator : \
				// storeFilename : 서버에 저장될 파일이름
				multipartFile.transferTo(new File(path+File.separator+storeFilename));
				
				// 3. BoardFileDTO로 변환
				filedtolist.add(new BoardFileDTO(originalFilename, storeFilename));
			}
		}
		return filedtolist;
	}
	
	
	// 클라이언트가 입력한 파일명을 중복없는 이름으로 변경
	private String createStoreFilename(String originalFilename) {
		int pos = originalFilename.lastIndexOf(".");      // .jpg
		String ext = originalFilename.substring(pos+1);   // jpg
		String uuid = UUID.randomUUID().toString();
		return uuid+"."+ext;
		
		// UUID.randomUUID()로 UUID 값을 생성할 수 있는데 생성 시에는 UUID 형태로 가져오기 때문에
		// toString(); 으로 String으로 바꿔준 후 사용해주면 된다.
	}
}







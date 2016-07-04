package com.pknu.upload.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pknu.upload.util.MediaUtils;
import com.pknu.upload.util.UploadFileUtils;

@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
//	@Autowired
//	UploadFileUtils uploadUtils;
	
	@Resource(name="saveDir")
	String saveDir;
	
	@RequestMapping("/upload.upload")
	public String main(){
		return "uploadAjax";
	}
	
	
	// 응답이 JSON형태로 안오기 때문에 406 에러가 남
	@ResponseBody
	@RequestMapping(value ="/uploadAjax.upload", method=RequestMethod.POST, 
	               produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<String>> uploadAjax(MultipartHttpServletRequest mRequest) throws Exception{
		// responseEntity는 개발자가 직접 결과 데이터와 HTTP의 상태 코드를 제어 할 수 있게 해주는 클래스다
		System.out.println("여기 왔음");
		List<String> fileList = new ArrayList<>();
		List<MultipartFile> mFile = mRequest.getFiles("multiFile");
		
		for(MultipartFile file:mFile){
			fileList.add(UploadFileUtils.uploadFile(saveDir, file.getOriginalFilename(), file.getBytes()));
		}
		
		return  new ResponseEntity<>(fileList, HttpStatus.CREATED);
		// HttpStatus.CREATED - 원하는 리소스가 정상적으로 생성되었는지 확인하는 코드. HttpStatus.OK도 가능
	}
	
//	ResponseEntity를 사용하지 않을때
//	@ResponseBody
//	@RequestMapping(value ="/uploadAjax", method=RequestMethod.POST)
//	public List<String> uploadAjax(MultipartHttpServletRequest mRequest) throws Exception{
//		List<String> fileList= new ArrayList<>();
//		List<MultipartFile> mfile=mRequest.getFiles("multiFile");
//		for(MultipartFile file : mfile){			
//			fileList.add(UploadFileUtils.uploadFile(saveDir,file.getOriginalFilename(),file.getBytes()));
//		}
//		return fileList;
//	}
	
	@ResponseBody
	@RequestMapping(value="/displayFile.upload")
	public ResponseEntity<byte[]>  displayFile(String fileName) throws Exception{
		InputStream in = null; 
		ResponseEntity<byte[]> entity = null;

		try{      
			String formatName = 
					fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);      
			HttpHeaders headers = new HttpHeaders();      
			in = new FileInputStream(saveDir+fileName); 

			
//			이미지 외의 업로드된 파일 클릭 시에는 바로 다운로드가 됨.
//			이미지를 구분하는 소스를 지우면 이미지도 클릭 시 다운로드가 된다
			if(mType != null){
				headers.setContentType(mType);
			}else{        
				fileName = 
						fileName.substring(fileName.indexOf("_")+1);     
				// indexOf는 첫 번째 _를 찾음. 그래서 originalFileName에 _가 있어도 별류 상관 0  
				headers.setContentType(
						MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", 
						"attachment; filename=\""+ 
						new String(fileName.getBytes("UTF-8"), 
								"ISO-8859-1").replace("%20", "")+"\"");
			}
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), 
					headers, HttpStatus.CREATED);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(
					HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;    
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile.upload")
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("delete file: "+fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			if(mType != null){
			new File(saveDir+(front+end).replace('/', File.separatorChar)).delete();
		}
		new File(saveDir + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	   
	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles.upload", method = RequestMethod.POST)
	public ResponseEntity<String> deleteAllFile(@RequestParam("files[]") String[] files) {
		System.out.println("이까지옴");
		logger.info("delete all files: " + files);

		if (files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

		for (String fileName : files) {

			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);

			if (mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(saveDir + (front + end).replace('/', File.separatorChar)).delete();
			}

			new File(saveDir + fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}

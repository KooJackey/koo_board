package com.pknu.upload.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	private static final Logger logger = 
		      LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String saveDir,
			String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();    	// 랜덤 uuid를 뽑아서 저장될 파일 이름 헤더에 쓸거임
	    String savedName = uid.toString() +"_"+originalName;    
	    String savedPath = calcPath(saveDir);    
	    File target = new File(saveDir +savedPath,savedName);     // File 객체가 2개 온다   
	    FileCopyUtils.copy(fileData, target);    
	    String formatName = 
	    	 originalName.substring(originalName.lastIndexOf(".")+1);    // 확장자 짜름
	    String uploadedFileName = null;
	    
	    if(MediaUtils.getMediaType(formatName) != null){		// null이 아니라면 이미지 파일임
	    	// 썸네일 만들거임	  
	      uploadedFileName = makeThumbnail(saveDir, savedPath, savedName);
	    }else{			// 이미지 파일이 아니니깐 그냥 저장만 할거야
	      uploadedFileName = 
	    		  makeIcon(saveDir, savedPath, savedName);
	    }	 
	    System.out.println(uploadedFileName);
	    return uploadedFileName;	
	}
	
	// 파라미터 경로 밑에 폴더를 더 추가시켜서 그 경로를 리턴할 거임! 
	private static String calcPath(String uploadPath){    
	   Calendar cal = Calendar.getInstance();    
	// ** separator는 윈도우로 치면 경로의 \ 이런건데, File 클래스의 separator는 OS의 separator를 알아옴. 알아서 getProperty 이런거 써가지고.
	   String yearPath = File.separator+cal.get(Calendar.YEAR);
		// ex) yearPath = \2016
	   String monthPath = yearPath + File.separator + 
	       new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
	   // ex) monthPath = \2016\05
	   String datePath = monthPath + File.separator + 
	       new DecimalFormat("00").format(cal.get(Calendar.DATE));
	   // ex) datePath = \2016\05\24
	    
	   makeDir(uploadPath, yearPath,monthPath,datePath);    
	   logger.info(datePath);
	    
	   return datePath;
	}
	 
	private static  String makeThumbnail(String saveDir, 
             String savedPath,String savedName)throws Exception{           
		BufferedImage sourceImg = 
				ImageIO.read(new File(saveDir + savedPath, savedName));
   
		BufferedImage destImg = Scalr.resize(sourceImg, 
					           Scalr.Method.AUTOMATIC, 
					           Scalr.Mode.FIT_TO_HEIGHT,100);   
		String thumbnailName = 
				saveDir + savedPath + File.separator +"s_"+ savedName;   
		File newFile = new File(thumbnailName);
		String formatName = 
				savedName.substring(savedName.lastIndexOf(".")+1);  
	   ImageIO.write(destImg, formatName.toUpperCase(), newFile);	   
	   return thumbnailName.substring(
			   saveDir.length()).replace(File.separatorChar, '/');
	} 
	
	private static  String makeIcon(String saveDir, 
    String savedPath,String savedName) throws Exception{	
	    String iconName = saveDir + savedPath + 
	    				File.separator+ savedName;    
	    return iconName.substring(
	    		saveDir.length()).replace(File.separatorChar, '/');
    }  
	 
	private static void makeDir(String uploadPath, String... paths){  	// 자바책 219 페이지에 ... 있음  
	   if(new File(paths[paths.length-1]).exists()){
	     return;
	   }						// 디렉토리 없으면 디렉토리 생성
	    
	   for (String path : paths) {      
	     File dirPath = new File(uploadPath + path);      
	     if(! dirPath.exists() ){
	       dirPath.mkdir();
	     } 
	   }
	}
            

}

package com.pknu.bbs.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

@Named
public class FileSaveHelper {	
	@Autowired	// root-context.xml에 bean으로 해논거 와이어링
	String saveDir;
	@Autowired
	String profileDir;
	
	
	public String save(MultipartFile fname){	// fname getPart가 넘어온거. 업로드된 파일을 스트림으로 쭉 읽고 저장함
		String storedFname=UUID.randomUUID().toString()+"_"+fname.getOriginalFilename();	// 안겹치는 랜덤 숫자가 붙음
		try{
			fname.transferTo(new File(saveDir+storedFname));	// transferTo 1라인으로 끝날 수 있음.
		}catch(Exception e){
			e.printStackTrace();
		}
		
//		File file = new File(saveDir+storedFname);		// 파일이름 똑같은거 하면 덮어써버리는 문제가 있듬
//		System.out.println(file.getAbsolutePath());
//		FileOutputStream os = null;
//		InputStream is=fname.getInputStream();
//		fname.tra
//		os = new FileOutputStream(file);			// 요놈이 씀
//		int temp = -1;
//		while ((temp = is.read()) != -1) {
//			os.write(temp);
//		}
//	    is.close();
//	    os.close();
	    
	    return storedFname;	// DB에 저장할거니까 리턴한다.
	}
}

package com.pknu.upload.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {	
	private static Map<String, MediaType> mediaMap;
	
	//업로드가 될 때 마다 반복해서 같은 해쉬맵이 만들어지니깐  static
	static{		
		mediaMap = new HashMap<String, MediaType>();		
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type){		
		return mediaMap.get(type.toUpperCase());
	}
}




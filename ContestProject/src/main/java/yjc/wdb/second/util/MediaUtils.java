package yjc.wdb.second.util;

import java.util.*;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("jpg", MediaType.IMAGE_JPEG);
		mediaMap.put("gif", MediaType.IMAGE_GIF);
		mediaMap.put("png", MediaType.IMAGE_GIF);
	}
	
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type);
	}
}

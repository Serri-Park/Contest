package yjc.wdb.second.util;

import java.io.File;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtil {
	public static String uploadFile(String originalName, String uploadPath, byte[] fileData) throws Exception{
		long time = System.currentTimeMillis(); 

		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");

		String str = dayTime.format(new Date(time));
		
		str = str.replace(':', '_');
			
		int extIdx = originalName.lastIndexOf(".");
		String nameWithoutExtension = originalName.substring(0,extIdx);
		String savedName = "/"+nameWithoutExtension+str;
		savedName += originalName.substring(extIdx);
		
		
		
		File target = new File(uploadPath, savedName);
		System.out.println(target.getAbsolutePath());
		
		FileCopyUtils.copy(fileData, target);
	

		return savedName;
	}
	
	
}

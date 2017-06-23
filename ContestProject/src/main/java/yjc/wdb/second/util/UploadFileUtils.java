package yjc.wdb.second.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	public static String uploadFile(String originalFilename, String uploadPath,byte[] bytes)throws Exception {
		
		
		System.out.println(uploadPath);
		UUID uid= UUID.randomUUID(); //?œ ?‹ˆ?¬ ?•œ ?•„?´?”” ê³ ìœ ?•œ ?•„?´?”” ?„¤? •?• ?•Œ ?‚¬?š© ë¬´ì‘?œ„ë¡? ê³„ì† ?˜? ¸ì¤?
		int extIdx=originalFilename.lastIndexOf(".");
		String nameWithoutExtension= originalFilename.substring(0, extIdx);
		String saveName = uid.toString() + "_" + nameWithoutExtension;
		saveName += originalFilename.substring(extIdx);
		
		String savedPath=calculatePath(uploadPath);    //calculatepath ë©”ì†Œ?“œ ?‹¤?–‰?•˜ë©? /2017/05/12 string return ?•´ì¤??‹¤.
		
		File target= new File(uploadPath+savedPath,saveName);//?•œ?´?”?— ?‚¬ì§„ì´ ?‹¤ ëª°ë¦¬ì§? ?•Šê²? ?‚ ì§? ?´?” ë³„ë¡œ ?‚¬ì§„ì´ ?Œ“?´ê²? ?•œ?‹¤.
		System.out.println(target.getAbsolutePath());
		
		FileCopyUtils.copy(bytes, target);
		
		//?´ë¯¸ì? ?ŒŒ?¼ ?´ë©? thunail ???¥
		//?•„?‹ˆë©? ?•„?´ì½? ???¥
		
		String thumbNailName="";
		
		String fileExtension=originalFilename.substring(extIdx+1);//?ŒŒ?¼ ?™•?¥?
		if(MediaUtils.getMediaType(fileExtension.toLowerCase())!=null)//?´ë¯¸ì? ?ŒŒ?¼?´ë©? null ?´ ?•„?‹ˆ?‹¤  ?˜¹?‹œ ??ë¬¸ì?¼?ˆ˜?ˆ?œ¼?‹ˆ ?†Œë¬¸ìë¡? ë°”ê¿”?„œì¤??‹¤.
		{
			thumbNailName=makeThumbNail(uploadPath,savedPath,saveName);
		}else{
			thumbNailName=makeIcon(uploadPath,savedPath,saveName);
		}
	
		/*
		 * 
		 * 
		 *  original name: rose.jpg ?¼ë©?
		 *  
		 *  rose_?œ ?‹ˆ?¬?•œ ?•„?´?””.jpg?´? ‡ê²? ë§Œë“ ?‹¤
		 */
		
		
		return thumbNailName;
	}

	
	
	private static String makeIcon(String uploadPath, String Path, String fileName)throws Exception {
		// TODO Auto-generated method stub
		
		String iconName=uploadPath + Path + File.separator+fileName;
		// resources/upload/2017/05/16/rose_asdkf;as.jpg
		
		
		return iconName.substring(uploadPath.length()).replace(File.separator, "/");// resources/upload ë¹¼ê³ 
	}






	private static String makeThumbNail(String uploadPath, String Path, String fileName)throws Exception {
		// TODO Auto-generated method stub
		
		BufferedImage sourceImg=ImageIO.read(new File(uploadPath+Path,fileName));
		
		BufferedImage destImg=Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbNailName=uploadPath+Path+File.separator+"thumbNail_"+fileName;
		
		File newFile= new File(thumbNailName);
		String fileExtension=fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, fileExtension.toLowerCase(), newFile);//?¸?„¤?¼ ?´ë¯¸ì? ?ƒ?„±
		
		return thumbNailName.substring(uploadPath.length()).replace(File.separatorChar,'/'); 
		
		
	}






	private static String calculatePath(String uploadPath) {
		// TODO Auto-generated method stub
		
		Calendar cal= Calendar.getInstance();
		
		
		// /2017
		String yearPath= File.separator+cal.get(Calendar.YEAR);
		//file separator ?Š” ?š´?˜ì²´ì œ?— ?”°?¼?„œ ?ŒŒ?¼ êµ¬ë¶„?„ ?‹¤ë¥´ê²Œ ?•´ì¤??‹¤. window?Š” \   unix ?Š” / ?´?‹¤
		
		DecimalFormat df= new DecimalFormat("00");//05 06?´?Ÿ°?”©?œ¼ë¡? ë§Œë“¤?–´ì¤?
		
		String monthPath= df.format(cal.get(Calendar.MONTH)+1);
		/* /2017/05 */
		
		monthPath= yearPath+File.separator+monthPath;
		
		// /2017/05/12
		String datePath=File.separator+df.format(cal.get(Calendar.DATE));
		
		datePath= monthPath+datePath;
		
		
		File folder= new File(uploadPath+datePath);
		if(folder.exists()==false)    //resources/upload/rose.jsp target?? rose?´ê³? ê·¸ê²ƒ?˜ ë¶?ëª? ?ŒŒ?¼?? upload ?´?‹¤										
		{							//mkdirs ?Š” upload ?ŒŒ?¼ ë¿ë§Œ?•„?‹ˆ?¼ resources ?´?”?„ ë§Œë“¤?–´?¼?Š” ?œ»
			folder.mkdirs();
		}
		
		return datePath;
	}
	
}

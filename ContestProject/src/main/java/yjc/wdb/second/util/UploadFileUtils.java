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
		UUID uid= UUID.randomUUID(); //?��?��?�� ?�� ?��?��?�� 고유?�� ?��?��?�� ?��?��?��?�� ?��?�� 무작?���? 계속 ?��?���?
		int extIdx=originalFilename.lastIndexOf(".");
		String nameWithoutExtension= originalFilename.substring(0, extIdx);
		String saveName = uid.toString() + "_" + nameWithoutExtension;
		saveName += originalFilename.substring(extIdx);
		
		String savedPath=calculatePath(uploadPath);    //calculatepath 메소?�� ?��?��?���? /2017/05/12 string return ?���??��.
		
		File target= new File(uploadPath+savedPath,saveName);//?��?��?��?�� ?��진이 ?�� 몰리�? ?���? ?���? ?��?�� 별로 ?��진이 ?��?���? ?��?��.
		System.out.println(target.getAbsolutePath());
		
		FileCopyUtils.copy(bytes, target);
		
		//?��미�? ?��?�� ?���? thunail ???��
		//?��?���? ?��?���? ???��
		
		String thumbNailName="";
		
		String fileExtension=originalFilename.substring(extIdx+1);//?��?�� ?��?��?��
		if(MediaUtils.getMediaType(fileExtension.toLowerCase())!=null)//?��미�? ?��?��?���? null ?�� ?��?��?��  ?��?�� ??문자?��?��?��?��?�� ?��문자�? 바꿔?���??��.
		{
			thumbNailName=makeThumbNail(uploadPath,savedPath,saveName);
		}else{
			thumbNailName=makeIcon(uploadPath,savedPath,saveName);
		}
	
		/*
		 * 
		 * 
		 *  original name: rose.jpg ?���?
		 *  
		 *  rose_?��?��?��?�� ?��?��?��.jpg?��?���? 만든?��
		 */
		
		
		return thumbNailName;
	}

	
	
	private static String makeIcon(String uploadPath, String Path, String fileName)throws Exception {
		// TODO Auto-generated method stub
		
		String iconName=uploadPath + Path + File.separator+fileName;
		// resources/upload/2017/05/16/rose_asdkf;as.jpg
		
		
		return iconName.substring(uploadPath.length()).replace(File.separator, "/");// resources/upload 빼고
	}






	private static String makeThumbNail(String uploadPath, String Path, String fileName)throws Exception {
		// TODO Auto-generated method stub
		
		BufferedImage sourceImg=ImageIO.read(new File(uploadPath+Path,fileName));
		
		BufferedImage destImg=Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbNailName=uploadPath+Path+File.separator+"thumbNail_"+fileName;
		
		File newFile= new File(thumbNailName);
		String fileExtension=fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, fileExtension.toLowerCase(), newFile);//?��?��?�� ?��미�? ?��?��
		
		return thumbNailName.substring(uploadPath.length()).replace(File.separatorChar,'/'); 
		
		
	}






	private static String calculatePath(String uploadPath) {
		// TODO Auto-generated method stub
		
		Calendar cal= Calendar.getInstance();
		
		
		// /2017
		String yearPath= File.separator+cal.get(Calendar.YEAR);
		//file separator ?�� ?��?��체제?�� ?��?��?�� ?��?�� 구분?�� ?��르게 ?���??��. window?�� \   unix ?�� / ?��?��
		
		DecimalFormat df= new DecimalFormat("00");//05 06?��?��?��?���? 만들?���?
		
		String monthPath= df.format(cal.get(Calendar.MONTH)+1);
		/* /2017/05 */
		
		monthPath= yearPath+File.separator+monthPath;
		
		// /2017/05/12
		String datePath=File.separator+df.format(cal.get(Calendar.DATE));
		
		datePath= monthPath+datePath;
		
		
		File folder= new File(uploadPath+datePath);
		if(folder.exists()==false)    //resources/upload/rose.jsp target?? rose?���? 그것?�� �?�? ?��?��?? upload ?��?��										
		{							//mkdirs ?�� upload ?��?�� 뿐만?��?��?�� resources ?��?��?�� 만들?��?��?�� ?��
			folder.mkdirs();
		}
		
		return datePath;
	}
	
}

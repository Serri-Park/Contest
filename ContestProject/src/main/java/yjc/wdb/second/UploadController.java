package yjc.wdb.second;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import yjc.wdb.second.util.MediaUtils;
import yjc.wdb.second.util.UploadFileUtils;

@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	//@Autowired
	//@Inject
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="uploadForm", method=RequestMethod.GET)
	public void uploadForm() {
		logger.debug("uploadForm Requested");
		logger.info("uploadForm Requested");
		logger.warn("uploadForm Requested");
		logger.error("uploadForm Requested");
	}
	
	@RequestMapping(value="upload", method=RequestMethod.POST)
	public String upload(MultipartFile file, Model model) throws Exception {
		logger.debug("uploadForm Requested");
		logger.info("originalName:"+file.getOriginalFilename());
		logger.info("size:"+file.getSize());
		logger.info("Bytes:"+file.getBytes());
		logger.info("contentType:"+file.getContentType());
		logger.info("server FileName:"+file.getName());
		
		String savedName = UploadFileUtils.uploadFile(file.getOriginalFilename(), uploadPath, file.getBytes());
		model.addAttribute("savedName", savedName);
		return "uploadResult";
	}
	
	@RequestMapping(value="uploadAjax", method=RequestMethod.GET)
	public void uploadAjax(){
		
	}
	
	@RequestMapping(value="uploadAjax", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		String savedName = UploadFileUtils.uploadFile(file.getOriginalFilename(), uploadPath, file.getBytes());		
		
		return new ResponseEntity<>(savedName, HttpStatus.CREATED);
		
	}
	
	@ResponseBody  //ÔøΩÔøΩ»ØÔøΩœ±ÔøΩÔøΩÔøΩÔøΩÿºÔøΩ (ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ)
	@RequestMapping("displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		//logger.info("File name : " + fileName);
		
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		String fileFormat = fileName.substring(fileName.lastIndexOf("."));
		//logger.info("ext:"+ext);
		
		MediaType mediaType = MediaUtils.getMediaType(ext.toLowerCase());
		
		
		
		HttpHeaders headers = new HttpHeaders();
		//uploadPath : resources/upload
		//fileName : /2017/05/18/ThumNail_rose_XXXXXXXX.jpg
		
		try{
			in = new FileInputStream(uploadPath+fileName);
			if(mediaType != null){
				headers.setContentType(mediaType);
			}else{
				fileName = fileName.substring(fileName.indexOf("_")+1);
				System.out.println(fileName);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				String fN = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
				headers.add("Content-Disposition", "attachment; filename=\""+fN+"\"");
			}
			
			byte[] data = IOUtils.toByteArray(in);
			entity = new ResponseEntity<byte[]>(data, headers, HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		
		return entity;
	}
	
	@ResponseBody  //ÔøΩÔøΩ»ØÔøΩœ±ÔøΩÔøΩÔøΩÔøΩÿºÔøΩ (ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ)
	@RequestMapping("downloadFile")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("File name : " + fileName);
		
		String fileFormat = fileName.substring(fileName.lastIndexOf("."));
		//logger.info("ext:"+ext);
		
		
		HttpHeaders headers = new HttpHeaders();
		//uploadPath : resources/upload
		//fileName : /2017/05/18/ThumNail_rose_XXXXXXXX.jpg
		
		try{
			in = new FileInputStream(uploadPath+fileName);
			
			fileName = fileName.substring(fileName.indexOf("_")+1);
			System.out.println(fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			String fN = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			headers.add("Content-Disposition", "attachment; filename=\""+fN+"\"");
			
			
			byte[] data = IOUtils.toByteArray(in);
			entity = new ResponseEntity<byte[]>(data, headers, HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteFile",method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteFile(@RequestBody MyFile myFile)throws Exception{
		
		String filename = myFile.getFilename();
		filename=URLDecoder.decode(filename,"UTF-8");
		
		System.out.println("fileName : " + filename);
		
		String ext = filename.substring(filename.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(ext.toLowerCase());
		//ÎØ∏Îîî?ñ¥ ???ûÖ?ù¥ ?ù¥ÎØ∏Ï??ù¥Î©? ?Ñ¨?Ñ§?ùº?ù¥?ûë ?ëêÍ∞úÎ?? ?Ç≠?†ú ?ï¥?ïº?ï®
		
		if(mType != null){//?ù¥ÎØ∏Ï? ?åå?ùº?ù¥?ã§
			//?õêÎ≥? ?ù¥ÎØ∏Ï? ?Ç≠?†ú
			
			String folderPath = filename.substring(0, 12);
			String orgName = filename.substring(12+"thumbNail_".length());
			
			new File(uploadPath+ (folderPath+orgName).replace('/', File.separatorChar)).delete();
			
		}
		
		new File(uploadPath+filename.replace("/", "\\")).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
		
	}
	

	@ResponseBody
	@RequestMapping(value="deleteAllFiles",method=RequestMethod.POST)
	public ResponseEntity<String> deleteAllFiles(@RequestParam("files[]") String[] files) throws Exception{
		
		logger.info("delete all files: "+files);
		
		if(files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null){
				String folderPath = fileName.substring(0, 12);
				String orgName = fileName.substring(12+"thumbNail_".length());
				
				new File(uploadPath + (folderPath+orgName).replace('/', File.separatorChar)).delete();	
			}
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();	
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}

class MyFile{
	private String filename;
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
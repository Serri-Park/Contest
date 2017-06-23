/**
 * 
 */

	function checkImageType(fileName) {
		var pattern = /jpg|gif|jpeg|png/i;
		return fileName.match(pattern);
	}//있으면 true, 없으면 false 리턴시킴
	
	function getFileInfo(fullName) { 
		var fileName, imgsrc, getLink, downloadLink;  //getLink - 원본파일, fullName - 썸네일(이미지)
		var fileLink;

		if(checkImageType(fullName)) {
			imgsrc = "displayFile?fileName="+fullName;
			fileLink = fullName.substr(12+"thumbNail_".length);

			var front = fullName.substr(0,12);
			var end = fullName.substr(12+"thumbNail_".length);

			getLink = "displayFile?fileName=" + front + end;
			downloadLink = "downloadFile?fileName=" + front + end;
			
		}else {
			imgsrc ="resources/dist/img/document.png";
			fileLink = fullName.substr(12);
			getLink = "displayFile?fileName=" + fullName;
			downloadLink = "downloadFile?fileName=" + fullName;
		}
		fileName = fileLink.substring(fileLink.indexOf("_")+1)
		
		return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName, downloadLink:downloadLink};
	}
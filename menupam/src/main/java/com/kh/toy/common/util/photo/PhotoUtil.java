package com.kh.toy.common.util.photo;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.common.util.file.FileVo;

public class PhotoUtil {

	public FileVo photoUpload(MultipartFile file, String uploadPath, String type) throws IllegalStateException, IOException {
		
		String savePath = getSavePath(); 
		FileVo fileVo = new FileVo();
		if(!file.getOriginalFilename().equals("")) {
			fileVo.setOriginFileName(file.getOriginalFilename());
			fileVo.setRenameFileName(UUID.randomUUID().toString());
			fileVo.setSavePath("/resources/reviewPhoto/"+savePath);
			
			fileVo.setOriginFileName(file.getOriginalFilename());
			fileVo.setRenameFileName(UUID.randomUUID().toString());
			fileVo.setSavePath("/resources/imgUpload/"+savePath);
			String path = uploadPath+savePath;
			savePhoto(fileVo, file, path, type);
		}
		return fileVo;
	}
	
	private void savePhoto(FileVo fileVo, MultipartFile multipartFile, String path, String type) throws IllegalStateException, IOException {
		File dest = new File(path + fileVo.getRenameFileName() + "."+type);
		if(!dest.exists()) {
			new File(path).mkdirs();
		}
		multipartFile.transferTo(dest);
	}
	
	private String getSavePath() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR) + "/"
				+ (cal.get(Calendar.MONTH) + 1) + "/"
				+ cal.get(Calendar.DAY_OF_MONTH) + "/";
	}
}

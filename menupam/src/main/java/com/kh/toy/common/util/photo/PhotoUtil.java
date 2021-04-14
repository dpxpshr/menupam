package com.kh.toy.common.util.photo;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.common.util.file.FileVo;
import com.kh.toy.common.util.file.MenupamFile;

public class PhotoUtil {

	public MenupamFile photoUpload(MultipartFile file, String uploadPath, String type, String route) throws IllegalStateException, IOException {
		
		String savePath = getSavePath(); 
		MenupamFile menupamFile = new MenupamFile();
		
		if(!file.getOriginalFilename().equals("")) {			
			menupamFile.setFileOriginName(file.getOriginalFilename());
			menupamFile.setFileRename(UUID.randomUUID().toString());
			menupamFile.setFileSavePath(route + savePath); //저장 경로가 달라서 따로 지정함.
			String path = uploadPath+savePath;
			savePhoto(menupamFile, file, path, type);
		}
		return menupamFile;
	}
	
	private void savePhoto(MenupamFile menupamFile, MultipartFile multipartFile, String path, String type) throws IllegalStateException, IOException {
		File dest = new File(path + menupamFile.getFileRename() + "."+type);
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

package com.kh.toy.common.util.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	
	public List<FileVo> fileUpload(List<MultipartFile> files) throws IllegalStateException, IOException{
		
		//파일정보를 가지고 반환될 list
		List<FileVo> fileList = new ArrayList<FileVo>();
		String savePath = getSavePath(); //파일 저장경로
		
		if(files.size() >= 1 && !files.get(0).getOriginalFilename().equals("")) {
			for (MultipartFile multipartFile : files) {
				//저장될 파일명
				FileVo fileVo = new FileVo();
				fileVo.setOriginFileName(multipartFile.getOriginalFilename());
				fileVo.setRenameFileName(UUID.randomUUID().toString());
				fileVo.setSavePath(savePath);
				fileList.add(fileVo);
				saveFile(fileVo,multipartFile);
			}
		}
		return fileList;
	}
	
	public FileVo fileUpload(MultipartFile file) throws IllegalStateException, IOException{
		
		String savePath = getSavePath(); //파일 저장경로
		FileVo fileVo = new FileVo();
		
		if(!file.getOriginalFilename().equals("")) {	
			fileVo.setOriginFileName(file.getOriginalFilename());
			fileVo.setRenameFileName(UUID.randomUUID().toString());
			fileVo.setSavePath(savePath);
			saveFile(fileVo,file);
		}
		
		return fileVo;
	}

	
	private String getSavePath() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR) + "/"
				+ (cal.get(Calendar.MONTH) + 1) + "/"
				+ cal.get(Calendar.DAY_OF_MONTH) + "/";
	}
	
	private void saveFile(FileVo fileVo, MultipartFile multipartFile) throws IllegalStateException, IOException {
		File dest = new File(fileVo.getFullPath() + fileVo.getRenameFileName());
		
		if(!dest.exists()) {
			new File(fileVo.getFullPath()).mkdirs();
		}
		
		multipartFile.transferTo(dest);
	}
	
	private void savePhoto(FileVo fileVo, MultipartFile multipartFile, String uploadPath, String savePath, String type) throws IllegalStateException, IOException {
		File dest = new File(uploadPath+savePath + fileVo.getRenameFileName() + "."+type);
		if(!dest.exists()) {
			new File(uploadPath+savePath).mkdirs();
		}
		multipartFile.transferTo(dest);
	}
	
	
	public FileVo photoUpload(MultipartFile file, String uploadPath, String type) throws IllegalStateException, IOException {
		
		String savePath = getSavePath(); 
		FileVo fileVo = new FileVo();
		if(!file.getOriginalFilename().equals("")) {
			fileVo.setOriginFileName(file.getOriginalFilename());
			fileVo.setRenameFileName(UUID.randomUUID().toString());
			fileVo.setSavePath("/resources/imgUpload/"+savePath);
			
			System.out.println(uploadPath);
			savePhoto(fileVo, file, uploadPath, savePath, type);
		}
		return fileVo;
	}
}

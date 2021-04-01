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
				fileVo.setFileOriginName(multipartFile.getOriginalFilename());
				fileVo.setFileRename(UUID.randomUUID().toString());
				fileVo.setFileSavePath(savePath);
				fileList.add(fileVo);
				saveFile(fileVo,multipartFile);
			}
		}
		return fileList;
	}
	
	public FileVo fileUpload(MultipartFile file) throws IllegalStateException, IOException{
		
		//파일정보를 가지고 반환될 list
		List<FileVo> fileList = new ArrayList<FileVo>();
		String savePath = getSavePath(); //파일 저장경로
		FileVo fileVo = new FileVo();
		
		if(!file.getOriginalFilename().equals("")) {	
			fileVo.setFileOriginName(file.getOriginalFilename());
			fileVo.setFileRename(UUID.randomUUID().toString());
			fileVo.setFileSavePath(savePath);
			fileList.add(fileVo);
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
		File dest = new File(fileVo.getFullPath() + fileVo.getFileRename());
		
		if(!dest.exists()) {
			new File(fileVo.getFullPath()).mkdirs();
		}
		
		multipartFile.transferTo(dest);
	}
	
	
	
	
	
}

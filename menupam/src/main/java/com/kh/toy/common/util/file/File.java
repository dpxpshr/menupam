package com.kh.toy.common.util.file;

import java.sql.Date;

import com.kh.toy.common.code.Code;

public class File {

	//메뉴팜 DB에 맞는 파일VO 입니다.
	private String fileIdx;
	private String fileOriginName;
	private String fileRename;
	private String fileType;
	private Date fileRegDate;
	private String fileSavePath;
	private int fileIsDel;
	
	
	public String getFullPath() {
		return Code.UPLOAD + fileSavePath;
	}


	public String getFileIdx() {
		return fileIdx;
	}


	public void setFileIdx(String fileIdx) {
		this.fileIdx = fileIdx;
	}


	public String getFileOriginName() {
		return fileOriginName;
	}


	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}


	public String getFileRename() {
		return fileRename;
	}


	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}


	public String getFileType() {
		return fileType;
	}


	public void setFileType(String fileType) {
		this.fileType = fileType;
	}


	public Date getFileRegDate() {
		return fileRegDate;
	}


	public void setFileRegDate(Date fileRegDate) {
		this.fileRegDate = fileRegDate;
	}


	public String getFileSavePath() {
		return fileSavePath;
	}


	public void setFileSavePath(String fileSavePath) {
		this.fileSavePath = fileSavePath;
	}


	public int getFileIsDel() {
		return fileIsDel;
	}


	public void setFileIsDel(int fileIsDel) {
		this.fileIsDel = fileIsDel;
	}


	@Override
	public String toString() {
		return "File [fileIdx=" + fileIdx + ", fileOriginName=" + fileOriginName + ", fileRename=" + fileRename
				+ ", fileType=" + fileType + ", fileRegDate=" + fileRegDate + ", fileSavePath=" + fileSavePath
				+ ", fileIsDel=" + fileIsDel + "]";
	}


	
}

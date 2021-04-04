package com.kh.toy.review.model.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.kh.toy.common.code.Code;
import com.kh.toy.common.util.file.FileUtil;
import com.kh.toy.common.util.file.FileVo;
import com.kh.toy.common.util.file.MenupamFile;
import com.kh.toy.common.util.photo.PhotoUtil;
import com.kh.toy.review.model.repository.ReviewRepository;
import com.kh.toy.review.model.vo.Review;
import com.kh.toy.shop.model.vo.Shop;

@Service
public class ReviewServiceImpl implements ReviewService{

	
	private final ReviewRepository reviewRepository;
	
	public ReviewServiceImpl(ReviewRepository reviewRepository) {
		this.reviewRepository = reviewRepository;
	}
	
	@Override
	public void writeReview(MultipartFile file, Review review, String uploadPath) {
		
		PhotoUtil photoUtil = new PhotoUtil();
		String type = FilenameUtils.getExtension(file.getOriginalFilename());
		try {
			MenupamFile fileInfo = photoUtil.photoUpload(file, uploadPath, type);
			System.out.println(fileInfo);
			if(fileInfo.getFileOriginName() == null) {
				review.setFileIdx("");
				reviewRepository.insertReview(review);
			}else {
				fileInfo.setFileType(type);
				reviewRepository.insertFile(fileInfo);
				String fileIdx = reviewRepository.selectFileIdx(fileInfo.getFileRename());
				review.setFileIdx(fileIdx);
				reviewRepository.insertReview(review);
			}
	
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public Map<Integer, Review> getReview(String shopIdx, int page) {		
		int queryStart = 1+(page-1)*5;
		int queryEnd = page*5+1;
		Map<Integer, Review> reviewMap = new HashMap<Integer, Review>();
		List<Review> reviewList = reviewRepository.selectReview(shopIdx, queryStart, queryEnd);
		for (int i=1; i<=reviewList.size(); i++) {
			reviewMap.put(i, reviewList.get(i-1));
		}
		return reviewMap;
	}

	
	@Override
	public String getSavePath(String fileIdx) throws IOException {
		
		MenupamFile menupamFile = reviewRepository.selectFileVo(fileIdx);
		String root = "";
		if(menupamFile != null) {
			root = menupamFile.getFileSavePath() + menupamFile.getFileRename() +"."+ menupamFile.getFileType();
		}
						
		return root;
	}

	@Override
	public Shop getShopInform(String shopIdx) {
		return reviewRepository.selectShop(shopIdx);
	}

	
}

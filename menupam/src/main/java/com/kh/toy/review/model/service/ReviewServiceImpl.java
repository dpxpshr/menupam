package com.kh.toy.review.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.common.util.file.FileUtil;
import com.kh.toy.common.util.file.FileVo;
import com.kh.toy.review.model.repository.ReviewRepository;
import com.kh.toy.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	
	private final ReviewRepository reviewRepository;
	
	public ReviewServiceImpl(ReviewRepository reviewRepository) {
		this.reviewRepository = reviewRepository;
	}
	
	@Override
	public void writeReview(MultipartFile file, Review review) {
		
		FileUtil fileUtil = new FileUtil();
		
		try {
			FileVo fileInfo = fileUtil.fileUpload(file);
			String type = fileInfo.getFileOriginName().substring(fileInfo.getFileOriginName().length()-4, fileInfo.getFileOriginName().length());
			fileInfo.setFileType(type);

			//이제 DB에 넣으믄댐
			reviewRepository.insertFile(fileInfo);
			
			//넣었으니까 이제 인덱스 가져오자 
			String fileIdx = reviewRepository.selectFileIdx(fileInfo.getFileRename());
			review.setFileIdx(fileIdx);
			
			//review 완성 이제 DB에 넣어주자
			reviewRepository.insertReview(review);
	
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}

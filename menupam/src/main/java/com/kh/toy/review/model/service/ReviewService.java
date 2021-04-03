package com.kh.toy.review.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.common.util.file.FileVo;
import com.kh.toy.review.model.vo.Review;
import com.kh.toy.shop.model.vo.Shop;

public interface ReviewService {

	void writeReview(MultipartFile file, Review review, String uploadPath);
	
	Map<Integer, Review> getReview(String shopIdx, int page);
	
	String getSavePath(String fileIdx) throws IOException;
	
	Shop getShopInform(String shopIdx);
}

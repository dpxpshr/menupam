package com.kh.toy.review.model.service;

import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.review.model.vo.Review;

public interface ReviewService {

	void writeReview(MultipartFile file, Review review);
}

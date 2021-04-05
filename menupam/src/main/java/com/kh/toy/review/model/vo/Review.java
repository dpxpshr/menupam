package com.kh.toy.review.model.vo;

import java.sql.Date;

public class Review {

	private String reviewIdx;
	private int reviewScore;
	private String reviewContent;
	private Date reviewDate;
	private String memberId;
	private String shopIdx;
	private String fileIdx;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(String reviewIdx, int reviewScore, String reviewContent, String reviewPhoto, Date reviewDate,
			String memberId, String shopIdx, String fileIdx) {
		this.reviewIdx = reviewIdx;
		this.reviewScore = reviewScore;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.memberId = memberId;
		this.shopIdx = shopIdx;
		this.fileIdx = fileIdx;
	}

	public String getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(String reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getShopIdx() {
		return shopIdx;
	}

	public void setShopIdx(String shopIdx) {
		this.shopIdx = shopIdx;
	}

	public String getFileIdx() {
		return fileIdx;
	}

	public void setFileIdx(String fileIdx) {
		this.fileIdx = fileIdx;
	}

	@Override
	public String toString() {
		return "Review [reviewIdx=" + reviewIdx + ", reviewScore=" + reviewScore + ", reviewContent=" + reviewContent
				+ ", reviewDate=" + reviewDate + ", memberId=" + memberId + ", shopIdx=" + shopIdx + ", fileIdx="
				+ fileIdx + "]";
	}
	
	
}

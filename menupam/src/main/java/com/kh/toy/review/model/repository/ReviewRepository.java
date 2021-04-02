package com.kh.toy.review.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.toy.common.util.file.File;
import com.kh.toy.common.util.file.FileVo;
import com.kh.toy.review.model.vo.Review;

@Mapper
public interface ReviewRepository {
	
	@Insert("INSERT INTO TB_REVIEW(REVIEW_IDX, REVIEW_SCORE, REVIEW_CONTENT, MEMBER_ID, SHOP_IDX, FILE_IDX)"
			+ "VALUES ('R'||SC_REVIEW_IDX.NEXTVAL, #{reviewScore}, #{reviewContent}, #{memberId}, #{shopIdx}, #{fileIdx})")
	int insertReview(Review review);
	
	
	@Insert("INSERT INTO TB_FILE (FILE_IDX, FILE_ORIGIN_NAME, FILE_RENAME, FILE_TYPE, FILE_SAVE_PATH)"
			+ "VALUES ('F'||SC_FILE_IDX.NEXTVAL, #{fileOriginName}, #{fileRename}, #{fileType}, #{fileSavePath})")
	int insertFile(FileVo file);
	
	
	@Select("SELECT FILE_IDX FROM TB_FILE WHERE FILE_RENAME = #{renameFileName}")
	String selectFileIdx(String renameFileName);
	
	
	//List<Review> selectReview
}

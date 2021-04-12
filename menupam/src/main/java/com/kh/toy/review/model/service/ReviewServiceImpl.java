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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.kh.toy.common.code.Code;
import com.kh.toy.common.mail.MailSender;
import com.kh.toy.common.util.QR.QRUtil;
import com.kh.toy.common.util.file.FileUtil;
import com.kh.toy.common.util.file.FileVo;
import com.kh.toy.common.util.file.MenupamFile;
import com.kh.toy.common.util.photo.PhotoUtil;
import com.kh.toy.member.model.vo.Member;
import com.kh.toy.review.model.repository.ReviewRepository;
import com.kh.toy.review.model.vo.Review;
import com.kh.toy.shop.model.vo.Shop;

@Service
public class ReviewServiceImpl implements ReviewService{

	
	private final ReviewRepository reviewRepository;
	QRUtil qrUtil = new QRUtil();
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired
	private RestTemplate http;
	
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

	
	//=========================================================옯겨야함 나중에=========================================================
	@Override
	public void sendTableQR(String shopIdx, String path) {
		
		Shop shop = reviewRepository.selectShop(shopIdx);
		Member member = reviewRepository.selectMember(shop.getMemberId());
		Map<String, String> filePathMap = new HashMap<String, String>();
		
		//1.QR코드 저장 (테이블 수만큼 반복)
		for(int i=1; i<=shop.getShopTableCount(); i++) {
			Map<String, String> QRMap = getQRMaterialMap(shopIdx, i, path, shop.getShopName());
			qrUtil.makeQR(QRMap.get("URI"), QRMap.get("fileName"), QRMap.get("filePath"), QRMap.get("text"), 20, 35);
			String filePath = QRMap.get("filePath")+QRMap.get("fileName")+".png";
			filePathMap.put(shop.getShopName()+" "+i+"번 QR", filePath);
		}
		//2.QR코드 img파일 메일 전송 
		String to = member.getMemberEmail();
		String subject = "[메뉴팜] 테이블 QR코드 입니다";
		String htmlTxt = getHtmlTxt(member.getMemberId());
		
		mailSender.sendEmailWithFile(to, subject, filePathMap, htmlTxt);
		
	}

	@Override
	public void sendTableQR(String shopIdx, String path, String tableNo) {
		
		Shop shop = reviewRepository.selectShop(shopIdx);
		Member member = reviewRepository.selectMember(shop.getMemberId());
		
		//1.QR코드 저장
		Map<String, String> QRMap = getQRMaterialMap(shopIdx, Integer.parseInt(tableNo), path, shop.getShopName());
		qrUtil.makeQR(QRMap.get("URI"), QRMap.get("fileName"), QRMap.get("filePath"), QRMap.get("text"), 20, 35);
		
		
		//2.QR코드 img파일 메일 전송
		String to = member.getMemberEmail();
		String subject = "[메뉴팜] "+tableNo+"번 테이블 QR코드 입니다";
		String filePath = QRMap.get("filePath")+QRMap.get("fileName")+".png";
		Map<String, String> filePathMap = new HashMap<String, String>();
		filePathMap.put(shop.getShopName()+" "+tableNo+"번 QR", filePath);
		String htmlTxt = getHtmlTxt(member.getMemberId());
		
		mailSender.sendEmailWithFile(to, subject, filePathMap, htmlTxt);	
	}
	
	@Override
	public void sendWaitQR(String shopIdx, String path) {
		
		Shop shop = reviewRepository.selectShop(shopIdx);
		Member member = reviewRepository.selectMember(shop.getMemberId());
		
		//1.QR코드 저장
		String URI = Code.SUNGUKIPDOMAIN+"/wait?shopIdx="+shopIdx;
		String fileName = shopIdx+"WaitQR";
		String filePath = path+"/QR/"+shopIdx+"/";
		String text = "QR 인식 후 대기 신청을 해주세요";
		
		qrUtil.makeQR(URI, fileName, filePath, text, 20 ,25);
		
		//2.QR코드 img파일 메일 전송
		String to = member.getMemberEmail();
		String subject = "[메뉴팜] 대기 시스템 QR코드 입니다";
		filePath += fileName+".png";
		Map<String, String> filePathMap = new HashMap<String, String>();
		filePathMap.put(shop.getShopName()+"대기 QR", filePath);
		String htmlTxt = getHtmlTxt(member.getMemberId());
		mailSender.sendEmailWithFile(to, subject, filePathMap, htmlTxt);
		
	}
	
	private Map<String, String> getQRMaterialMap(String shopIdx, int tableNo, String path, String shopName){
		
		Map<String, String> QRMap = new HashMap<String, String>();
		//1-1. URI : QR코드로 만들 URI (! 각자 도메인코드 만들어 사용 )
		//1-2. fileName : 저장할 파일이름 shopIdx + t + tableNo
		//1-3. filePath : 서버 내부의 resources/QR/table/
		//1-4. text : QR코드 식별하기 위해 하단의 적을 text
		QRMap.put("URI", Code.SUNGUKIPDOMAIN+"/order/menuView?shopIdx="+shopIdx+"&tableNo="+tableNo); 
		QRMap.put("fileName", shopIdx + "T" + tableNo);
		QRMap.put("filePath", path+"/QR/"+shopIdx+"/");
		QRMap.put("text", shopName+"    "+tableNo+"번 테이블");
		
		return QRMap;
	}
	
	private String getHtmlTxt (String memberId) {
		
		MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
		body.add("memberId", memberId);
		
		RequestEntity<Map> request = 
				RequestEntity
				.post(Code.DOMAIN+"/mail/QR")
				.contentType(MediaType.APPLICATION_FORM_URLENCODED)
				.body(body);
		
		ResponseEntity<String> response =
				http.exchange(request, String.class);
		
		return response.getBody();
	}


	
}

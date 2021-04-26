package com.kh.toy.common.sms;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.toy.common.code.ErrorCode;
import com.kh.toy.common.exception.ToAlertException;
import com.kh.toy.common.util.http.HttpUtil;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class SMS {

	public SMS() {
		
	}
	
	//naverCloud API signature(?) 만드는 함수
	private String makeSignature() throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {
		long lTime = System.currentTimeMillis ( );
		String time = Long.toString(lTime);
		String space = " ";					// one space
		String newLine = "\n";					// new line
		String method = "POST";					// method
		String url = "/sms/v2/services/ncp:sms:kr:263561292248:lets_share/messages";	// url (include query string)
		String timestamp = time;			// current timestamp (epoch)
		String accessKey = "W2t9YLUPPjTsM9pquRd6";			// 네이버클라우드 플랫폼 계정관리 -> 인증키 관리
		String secretKey = "k25Le7M7PFUlV3SBSZHyQ3ZxvspCSqlDnHAdLhJC"; 

		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();

		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
		mac.init(signingKey);

		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		String encodeBase64String = Base64.encodeBase64String(rawHmac);
		
		return encodeBase64String;
	}
	
	// SMS API 전용 헤더 가져오는 함수
	public Map<String, String> getSMSHeaders() throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException{
		
		String time = Long.toString(System.currentTimeMillis ( ));
		String accessKey = "W2t9YLUPPjTsM9pquRd6";
		String secretKey = makeSignature();
		
		Map<String, String> headers= new HashMap<String, String>();
		headers.put("Content-Type", "application/json; charset=utf-8");
		headers.put("x-ncp-apigw-timestamp", time);
		headers.put("x-ncp-iam-access-key", accessKey);
		headers.put("x-ncp-apigw-signature-v2", secretKey);
		
		return headers;
	}
	
	// SMS API 전용 바디 설정
	public String getSMSBody(String to, String content) {
		JSONObject jsonObject = new JSONObject();
		JSONArray messageArray = new JSONArray();
		JSONObject messageInfo = new JSONObject();
		
		jsonObject.put("type", "SMS");
		jsonObject.put("contentType", "COMM");
		jsonObject.put("countryCode", "82");
		jsonObject.put("from", "01074861207");
		jsonObject.put("content", "안녕하세요");
		
		messageInfo.put("to", to);
		messageInfo.put("content", content);
		messageArray.add(messageInfo);
		
		jsonObject.put("messages", messageArray);
		
		String body = jsonObject.toJSONString();
		
		return body;
		
	}
	
	public void sendSMS(String to, String content) {
		HttpUtil httpUtil = new HttpUtil();
		String url = "https://sens.apigw.ntruss.com/sms/v2/services/ncp:sms:kr:263561292248:lets_share/messages";
		String body = getSMSBody(to, content);
		Map<String, String> headers;
		try {
			headers = getSMSHeaders();
			String res = httpUtil.post(url, headers, body);
			System.out.println(res);
		} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}

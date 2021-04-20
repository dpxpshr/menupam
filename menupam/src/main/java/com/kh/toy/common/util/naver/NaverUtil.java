package com.kh.toy.common.util.naver;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.toy.common.util.http.HttpUtil;

public class NaverUtil {

	HttpUtil httpUtil = new HttpUtil();
	ObjectMapper objectMapper = new ObjectMapper();
	
	final String PROFILEURL = "https://openapi.naver.com/v1/nid/me";
	
	//CSRF 공격을 방지하기 위해 애플리케이션과 사용자 간의 상태를 보유하는 고유한 세션 토큰
	public String generateState()
	{
	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}
	
	public Map<String, String> getTokenMap(String code, String state) {
		Map<String, String> tokenMap = null;
		try {
			String uri = "https://nid.naver.com/oauth2.0/token?client_id=zUZKAN8pubA1MePInXEY&client_secret=3ZiqoKlpI3&grant_type=authorization_code&state="+state+"&code="+code;
			String tokenStr = httpUtil.get(uri);
			tokenMap = objectMapper.readValue(tokenStr, Map.class);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tokenMap;
	}
	
	public Map<String, String> getProfileMap(String tokenType, String accessToken){
		
		Map<String, String> profile = null;
		Map<String, String> profileHeaders = new HashMap<String, String>();
		profileHeaders.put("Authorization", tokenType+" "+accessToken);
		String profileString = httpUtil.get(PROFILEURL, profileHeaders);
		
		try {
			Map<String, Object> profileMap = objectMapper.readValue(profileString, Map.class);
			profile = (Map<String, String>) profileMap.get("response");
			profile.put("id", "naver"+profile.get("id"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return profile;
	}
	
}

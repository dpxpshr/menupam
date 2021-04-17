package com.kh.toy.common.util.kakao;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.toy.common.util.http.HttpUtil;

public class KakaoUtil {

	final String KAKAOTOKENURL = "https://kauth.kakao.com/oauth/token";
	final String KAKAOUSERURL = "https://kapi.kakao.com/v2/user/me";
	HttpUtil httpUtil = new HttpUtil();
	ObjectMapper mapper = new ObjectMapper();

	public Map<String, String> getKakaoTokenMap(String code) {
		Map<String, String> tokenMap = null;
		try {
			Map<String, String> tokenHeader = new HashMap<String, String>();
			String tokenBody = "grant_type=authorization_code&client_id=e6a2ed92a0d0a64336f42c9222ec8a26&redirect_uri=http://localhost:9090/social/kakaoOauth&code="
					+ code;
			String tokenResult = httpUtil.post(KAKAOTOKENURL, tokenHeader, tokenBody);
			tokenMap = mapper.readValue(tokenResult, Map.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tokenMap;
	}

	public Map<String, Object> getKakaoUser(String accessToken) {

		Map<String, Object> userMap = null;
		Map<String, Object> kakaoUser = new HashMap<String, Object>();
		try {
			Map<String, String> userHeaders = new HashMap();
			userHeaders.put("Authorization", "Bearer " + accessToken);
			String userResult = httpUtil.get(KAKAOUSERURL, userHeaders);
			userMap = mapper.readValue(userResult, Map.class);

			int kakaoId = (int) userMap.get("id");
			Map<String, Object> kakaoAccount = (Map<String, Object>) userMap.get("kakao_account");
			String email = (String) kakaoAccount.get("email");
			Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");
			String nickName = (String) profile.get("nickname");

			kakaoUser.put("id", "kakao" + kakaoId);
			kakaoUser.put("email", email);
			kakaoUser.put("nickName", nickName);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kakaoUser;
	}
}

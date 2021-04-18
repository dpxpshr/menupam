package com.kh.toy.common.util.naver;

import java.math.BigInteger;
import java.security.SecureRandom;

public class NaverUtil {

	//CSRF 공격을 방지하기 위해 애플리케이션과 사용자 간의 상태를 보유하는 고유한 세션 토큰
	public String generateState()
	{
	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}
}

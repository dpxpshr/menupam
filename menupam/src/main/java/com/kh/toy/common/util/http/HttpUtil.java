package com.kh.toy.common.util.http;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import com.kh.toy.common.code.ErrorCode;
import com.kh.toy.common.exception.ToAlertException;



public class HttpUtil {

	HttpURLConnection conn = null;
	// 1. HttpURLConnection 객체 생성
	// 2. GET/POST 방식에 따른 통신 메서드
	// 3. Header 작성 메서드
	// 4. body 작성 메서드
	// 5. 응답을 받는 메서드
	public String get(String url, Map<String, String> headers) {
		String res = "";
		try {
			conn = getConnection(url, "GET"); //시작줄 작성
			setHeaders(headers); //헤더 작성
			res = getResponse(); //응답 반환
		} catch (IOException e) {
			throw new ToAlertException(ErrorCode.HTTP01);
		} finally {
			conn.disconnect();
		}
		return res;
	}
	
	public String get(String url) {
		String res = "";
		try {
			conn = getConnection(url, "GET"); //시작줄 작성
			res = getResponse(); //응답 반환
		} catch (IOException e) {
			throw new ToAlertException(ErrorCode.HTTP01);
		} finally {
			conn.disconnect();
		}
		return res;
	}
	
	public String post(String url, Map<String, String> headers, String body) {
		String res = "";
		try {
			conn = getConnection(url, "POST");
			setHeaders(headers);
			setBody(body);
			res = getResponse();
		} catch (IOException e) {
			throw new ToAlertException(ErrorCode.HTTP01);
		} finally {
			conn.disconnect();
		}
		return res;	
	}
	
	public String urlEncodedForm(Map<String, String> params) {
		String res = "";
		try {
			for(String key : params.keySet()) {
				//아스키코드로 표현 가능하게씀 인코딩 
				res += "&" + URLEncoder.encode(key, "UTF-8") + "=" + URLEncoder.encode(params.get(key), "UTF-8");
			}
			if(res.length() > 0) {
				res = res.substring(1);
			}
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	private HttpURLConnection getConnection(String url, String method) throws IOException {
		//통신할 url 작성
		URL u = new URL(url);
		HttpURLConnection conn = (HttpURLConnection) u.openConnection();
		conn.setRequestMethod(method);
		
		//POST방식일 경우 출력스트림 사용 여부를 True로 지정
		if(method.equals("POST")) {
			conn.setDoOutput(true);
		}
		
		//통신이 지연될 경우 통신을 종료할 시간을 10초로 지정
		conn.setConnectTimeout(10000);
		conn.setReadTimeout(10000);
		
		return conn;
	}
	
	private void setHeaders(Map<String, String> headers) {
		for(String key : headers.keySet()) {
			conn.addRequestProperty(key, headers.get(key));
		}
	}
	
	private void setBody(String body) throws IOException {
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		try {
			bw.write(body);
			bw.flush();
		}finally {
			bw.close();
		}
		
	}
	
	private String getResponse() throws IOException {
		//응답코드가 200번대 인지 확인
		String res = "";
		int status = conn.getResponseCode();
		BufferedReader br = null;
		//System.out.println(status);
		if(status >= 200 && status <= 300) {
			try {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = null;
				StringBuffer sb = new StringBuffer(); //String Buffer 사용하는 이유 : String은 Inmutable
				while((line = br.readLine()) != null) {
					sb.append(line);		
				}
				res = sb.toString();
			}finally {
				br.close();
			}
			
		}else {
			//예외는 발생하지 않지만, Status코드를 콘솔창에 남기기 위해
			//새로운 예외클래스를 생성
			throw new ToAlertException(ErrorCode.HTTP01, new Exception(conn.getResponseMessage()));
		}
		return res;
	}
}

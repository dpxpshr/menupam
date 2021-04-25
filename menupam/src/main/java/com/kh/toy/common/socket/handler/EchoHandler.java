package com.kh.toy.common.socket.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.toy.member.model.vo.Member;

public class EchoHandler extends TextWebSocketHandler{

	//접속한 세션들을 List에 넣어줄 리스트
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//세션 아이디와 회원 아이디를 저장할 리스트
	Map<String , WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 연결 시작할때 동작하는 메서드
		sessions.add(session);
		userSessionMap.put(getUserId(session), session);
		System.out.println("연결 성공 : "+userSessionMap.toString());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결 해제될때 동작할 메서드
		sessions.remove(session);
		userSessionMap.remove(session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String msg = message.getPayload();
		String[] strs = msg.split(",");
		//String notificationType = strs[0];
		String receiveId = strs[0];
		String content = strs[1];
		String link = strs[2];
		
		WebSocketSession receiveSession = userSessionMap.get(receiveId);
		if(receiveSession!=null) {
			TextMessage textMessage = new TextMessage(receiveId+" : "+content+" : "+link);
			receiveSession.sendMessage(textMessage);
		}else {
			
		}

	}
	
	
	
	private String getUserId(WebSocketSession session) {
		//session에서 로그인한 회원은 아이디를 리턴하고 로그인 안한 세션은 세션 아이디 반환
		Map<String, Object> httpSession = session.getAttributes();
		return httpSession.get("userInfo") == null ? session.getId() : ((Member)httpSession.get("userInfo")).getMemberId();
	}
}

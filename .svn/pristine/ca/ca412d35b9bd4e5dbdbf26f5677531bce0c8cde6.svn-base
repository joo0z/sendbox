package kr.or.ddit.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.chat.vo.ChatRoomVO;
import kr.or.ddit.emp.vo.EmpVO;


@Component
public class ChatHandler extends TextWebSocketHandler {

	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	
	
	// 접속한 사원의 소켓정보와 아이디를 담을 map객체
	private List<Map<String, Object>> empMapList = SocketChatServer.empMapList;
	private Map<String, Object> empMap;
	
	
	
	// 클라이언트가 서버로 연결 처리
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.debug("testtesttest");
		
		
		empMap = new HashMap<String, Object>();
		
		logger.debug("=============================================");
		logger.debug("");
		logger.debug("");
		logger.debug("connecting success");
		logger.debug("");
		logger.debug("");
		logger.debug("=============================================");
		
		
		
		// session 정보
		Map<String, Object> userSessionMap = session.getAttributes();
		
		// 사원정보
		EmpVO empVO = (EmpVO) userSessionMap.get("EMP");
		
		// 채팅방 정보
		String chatRoomId = (String) userSessionMap.get("chatrmId");

		
		
		empMap.put("empId", empVO.getEmpId());
		empMap.put("empNm", empVO.getEmpNm());
		empMap.put("userSocketID", session.getId());
		empMap.put("userSocketSession", session);
		empMap.put("chatRoomId", chatRoomId);
		
		empMapList.add(empMap);
		
		
		// logger
		logger.debug("session 정보 : {}", userSessionMap);
		logger.debug("empId : {}", empVO.getEmpId());
		logger.debug("empNm : {}", empVO.getPassword());
		logger.debug("userSocketID : {}", session.getId());
		logger.debug("userSocketSession : {}", session);
		logger.debug("chatRoomId : {}", chatRoomId);
		
	}

	// 클라이언트가 서버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String empId = "";
		String empNm = "";
		String chatRoomId = "";
		
		String msgText = message.getPayload().replace("\n", "<br>");
		
		// 현재 접속한 세션의 정보와 list에 추가한 세션정보가 같은 유저(본 브라우저 접속자)의 아이디를 추출
		for(int i = 0; i < empMapList.size(); i++) {
			WebSocketSession s = (WebSocketSession) (empMapList.get(i).get("userSocketSession"));
			if((session.getId()).equals(empMapList.get(i).get("userSocketID"))) {
				empId = (String) empMapList.get(i).get("empId");
				empNm = (String) empMapList.get(i).get("empNm");
				chatRoomId = (String) empMapList.get(i).get("chatRoomId");
				break;
			}
		}
		
		
		
		
		
		// 채팅방에 초대했을 경우
		String[] textMM = msgText.split(":~:");
		if(textMM[0].equals("invite")) {	
			// 추출된 아이디를 사용하여 접속한 전체 인원에게 메시지 전달
			for(int i = 0; i < empMapList.size(); i++) {
				if(chatRoomId.equals(empMapList.get(i).get("chatRoomId"))) {
					WebSocketSession s = (WebSocketSession) (empMapList.get(i).get("userSocketSession"));
					s.sendMessage(new TextMessage("invite:+:" + textMM[2] + ":+:" + textMM[3] + ":+:" + textMM[1]));
				}
			}
		}else {
			// 추출된 아이디를 사용하여 접속한 전체 인원에게 메시지 전달
			for(int i = 0; i < empMapList.size(); i++) {
				if(chatRoomId.equals(empMapList.get(i).get("chatRoomId"))) {
					WebSocketSession s = (WebSocketSession) (empMapList.get(i).get("userSocketSession"));
					s.sendMessage(new TextMessage(empId + ":+:" + empNm + ":+:" + msgText));
				}
			}
		}
		
		
		
		
	}

	
	
	
	
	
	
	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		String empId = "";
		
		// 현재 접속한 세션의 정보와 list에 추가한 세션정보가 같은 유저(본 브라우저 접속자)의 아이디를 추출
		for(int i = 0; i < empMapList.size(); i++) {
			WebSocketSession s = (WebSocketSession) (empMapList.get(i).get("userSocketSession"));
			if((session.getId()).equals(empMapList.get(i).get("userSocketID"))) {
				empId = (String) empMapList.get(i).get("empId");
				
				// 채팅방에서 나가기
				empMapList.remove(i);
				break;
			}
		}
		
	}
}

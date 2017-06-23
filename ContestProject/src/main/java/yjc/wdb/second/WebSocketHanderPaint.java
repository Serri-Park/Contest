package yjc.wdb.second;

import java.io.IOException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

public class WebSocketHanderPaint implements WebSocketHandler {
	 private static final Logger logger = LoggerFactory.getLogger(WebSocketHanderPaint.class);

	    private static final ArrayList<WebSocketSession> users = new ArrayList<>();


	@Override
	public void afterConnectionClosed(WebSocketSession webSocketSessionPaint, CloseStatus closeStatus) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("링크닫기" + closeStatus.toString());
        users.remove(webSocketSessionPaint);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession sessionPaint) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("연결된 링크......");
        users.add(sessionPaint);
        String userName = (String) sessionPaint.getHandshakeAttributes().get("WEBSOCKET_USERNAME");
	}

	@Override
	public void handleMessage(WebSocketSession sessionPaint, WebSocketMessage<?> webSocketMessagePaint) throws Exception {
		// TODO Auto-generated method stub
    		
    	String msg = webSocketMessagePaint.getPayload().toString();
    	String color = "";
    	String dot = "";
    	String posX = "";
    	String posY = "";
    	String coorsX = "";
    	String coorsY = "";
    	String msgs[] = msg.split("\\|");
  
    		color = msgs[0];
    		dot = msgs[1];
    		posX = msgs[2];
    		posY = msgs[3];
    		coorsX = msgs[4];
    		coorsY = msgs[5];
    		sendMessageToUsers(new TextMessage(color+" "+dot+" "+posX+" "+posY+" "+coorsX+" "+coorsY));
    
	}

	@Override
	public void handleTransportError(WebSocketSession webSocketSessionPaint, Throwable throwable) throws Exception {
		// TODO Auto-generated method stub
		 if(webSocketSessionPaint.isOpen()){
			 webSocketSessionPaint.close();
	        }
	        logger.debug("연결중 오류가 발생했습니다");
	        users.remove(webSocketSessionPaint);
	}

	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return false;
	}
	public void sendMessageToUsers(TextMessage message) {
        for (WebSocketSession user : users) {
            try {
                if (user.isOpen()) {
                    user.sendMessage(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     *
     * @param userName
     * @param message
     */
    public void sendMessageToUser(String userName, TextMessage message) {
        for (WebSocketSession user : users) {
            if (user.getHandshakeAttributes().get("WEBSOCKET_USERNAME").equals(userName)) {
                try {
                    if (user.isOpen()) {
                        user.sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }

}

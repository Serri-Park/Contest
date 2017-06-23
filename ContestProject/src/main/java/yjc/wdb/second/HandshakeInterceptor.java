package yjc.wdb.second;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;

public class HandshakeInterceptor implements org.springframework.web.socket.server.HandshakeInterceptor {


    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Map<String, Object> map) throws Exception {
        if (request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
            
            String clientName = (String)servletRequest.getServletRequest().getParameter("name");
            String t_id = (String)servletRequest.getServletRequest().getParameter("t_id");
            System.out.println(clientName+"´Ô"+t_id+"¹ø ÆÀ");
            
            HttpSession session = servletRequest.getServletRequest().getSession(true);
//            String userName = "lee";
            if (session != null) {
//               String clientName = (String) session.getAttribute("WEBSOCKET_USERNAME");
                map.put("WEBSOCKET_USERNAME", clientName);
                map.put("WEBSOCKET_t_id", t_id);
            }
        }
        return true;
    }

    @Override
    public void afterHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Exception e) {

    }
    
}
package yjc.wdb.second;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(new WebSocketHander(),"/echo").addInterceptors(new HandshakeInterceptor()); //
        registry.addHandler(new WebSocketHanderPaint(),"/paint-echo").addInterceptors(new HandshakeInterceptorPaint());
        registry.addHandler(new WebSocketHander(),"/sockjs/echo").addInterceptors(new HandshakeInterceptor()).withSockJS();
        registry.addHandler(new WebSocketHander(),"/paint-sockjs/echo").addInterceptors(new HandshakeInterceptorPaint()).withSockJS();//
    }
}
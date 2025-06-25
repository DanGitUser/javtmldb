package controller.endpoint;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.slf4j.Slf4j;

@ServerEndpoint("/echo")
@Slf4j
public class EchoEndpoint {
    
    private static final Set<Session> SESSIONS = new CopyOnWriteArraySet<Session>();
    
    // At least 3 Methods
    // connect
    @OnOpen
    public void onOpen(Session session) {
        SESSIONS.add(session);
        log.info("Current connection count : {}", SESSIONS.size());
    }
    // send
    @OnMessage
    public void onMessage(String msg, Session session) throws IOException {
        log.info("logged message : {}", msg);
        for (Session s : SESSIONS) {
            s.getBasicRemote().sendText(msg);
        }
    }
    // terminate
    @OnClose
    public void onClose(Session session) {
        SESSIONS.remove(session);
        log.info("Current connection count : {}", SESSIONS.size());
    }
}

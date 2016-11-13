package kr.kina.listener;



import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Tomcat 세션상태 체크 : Session이 생성되고, 파괴되 때 확인하기 위한 클래스 
 */
public class HttpSessionListenerCheck implements HttpSessionListener{

	private static final Logger log = LoggerFactory.getLogger(HttpSessionListenerCheck.class);
	private static int sessionCount = 0;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		sessionCount++;
		log.info("Session ID : ".concat(se.getSession().getId()) + " --- Count : " + sessionCount);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		sessionCount--;
		log.info("Session ID : ".concat(se.getSession().getId()) + " --- Count : " + sessionCount);
	}
}

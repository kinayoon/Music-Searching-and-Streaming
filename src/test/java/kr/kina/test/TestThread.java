package kr.kina.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

@SuppressWarnings("serial")
@Component
public class TestThread extends ThreadPoolTaskExecutor{

	private final Logger log = LoggerFactory.getLogger(TestThread.class);
	private final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	
	@Test
	@Scheduled(fixedDelay=1000)
	public void reportCurrentTime(){
		log.info("The time is now : " + dateFormat.format(new Date()));
	}

}

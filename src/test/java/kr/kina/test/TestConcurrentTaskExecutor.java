package kr.kina.test;

import org.junit.Test;
import org.springframework.scheduling.concurrent.ConcurrentTaskExecutor;

public class TestConcurrentTaskExecutor {

	@Test
	public void testConcurrent(){
		
		ConcurrentTaskExecutor executor = new ConcurrentTaskExecutor();
		executor.execute(new runnableTest());
	}
	
}

class runnableTest implements Runnable{
	int num = 0;
	
	@Override
	public void run() {
		try{
			System.out.println("Runnable running..");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}

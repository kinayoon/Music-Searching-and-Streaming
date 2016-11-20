package kr.kina.test;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import kr.kina.domain.ArtistVO;
import sun.audio.AudioPlayer;
import sun.audio.AudioStream;


public class TestController {
	

	@Inject
	SqlSession session;
	
	
	@Test
	public void testMethod(){
		
       //재생시간 표시할 때
        String duration = "227985.046875";

        DateFormat format = new SimpleDateFormat("mm:ss");
  //      String a= format.format(duration);
 //      System.out.println(a);

		
		System.out.println("Test ----");
	}
	

	@Test
	public void testPlayer() throws Exception {
		
		AudioInputStream audioInputStream = null;
	    InputStream buffer = null;
	    InputStream audio = null;
		
	    File file = new File("D:\\genie data\\Music\\[FM] 한국인이 좋아하는 Rock TOP100\\001.Nervama-SmellsLikeTeenSpirit.mp3");
        String path = "D:\\genie data\\Music\\[FM] 한국인이 좋아하는 Rock TOP100\\001.Nervama-SmellsLikeTeenSpirit.mp3";
        System.out.println("있냐"+ file.exists());
        AudioPlayer player = AudioPlayer.player;


             audio = new FileInputStream(file);
             System.out.println(audio);
             buffer = new BufferedInputStream(audio);
             System.out.println(buffer);

            audioInputStream = AudioSystem.getAudioInputStream(buffer);

            player.start(audioInputStream);
		
		
	}

}

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.kina.domain.ArtistVO;
import kr.kina.domain.Criteria;
import kr.kina.persistence.SearchDAO;
import sun.audio.AudioPlayer;
import sun.audio.AudioStream;


public class TestController {
	
	private static final Logger log = LoggerFactory.getLogger(TestController.class);
	
	@Inject
	SearchDAO dao;
	
	@Test
	public void testMethod(){
		Criteria cri = new Criteria();
		cri.setKeyword("a");
		cri.setPage(10);
		cri.setPageNum(12);
		
		try{
			List<ArtistVO> list = dao.listPageArtist(cri);
			log.info(list.toString());
		
			for(ArtistVO vo : list){
				log.info(vo.getRownum() + " : " + vo.getArtist());
			}
			
		}catch(Exception e){
			log.info(e.getMessage());
		}
		
	}

}

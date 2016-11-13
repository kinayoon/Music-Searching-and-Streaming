package kr.kina.test;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import kr.kina.domain.ArtistVO;


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
	public void testSelect() throws Exception {
		String searchText="a";
		String namespace ="kr.kina.mappers.SearchMapper";
		try{
		System.out.println(session.selectList(namespace+".searchArtist", searchText));	
	
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally{
			
		}
		
	}
}

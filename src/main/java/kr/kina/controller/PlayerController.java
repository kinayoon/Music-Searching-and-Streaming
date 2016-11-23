package kr.kina.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.kina.domain.AudioUrlVO;
import kr.kina.domain.StreamingVO;
import kr.kina.service.CounterService;

@Controller
@RequestMapping("/player")
public class PlayerController {

	static final Logger log = LoggerFactory.getLogger(PlayerController.class);
	
	@Inject
	CounterService service;	
	
	
	/** POST  
	 *  여러 곡일 경우, List<String>으로 받아서,
	 *  여기서 inputstream으로 D:에서 파일을 읽어와서 
	 *  @return audiosrc
	 * */
	@RequestMapping(value="/webplayer", method=RequestMethod.POST)
	public void playerPOST(@RequestParam("filePath") String path,
						   @RequestParam("title") String title,
						   @RequestParam("artist") String artist,
						   @RequestParam("album") String album, Model model) throws Exception{
		log.info("webplayer-2");
		
		String audiosrc = path.substring(13).replace('\\', '/'); // "file:///d:/genie data/" 삭제 및 슬래쉬로 변경 , "/songs/" 추가
		audiosrc = "/songs"+audiosrc;
		
		model.addAttribute("audiosrc", audiosrc);
		System.out.println(audiosrc);
		
/*		StreamingVO vo = new StreamingVO();
		vo.setTitle(title);
		vo.setArtist(artist);
		vo.setAlbum(album);
		vo.setFilePath(audiosrc);
		
		service.streaming(vo);  //Streaming 순위
*/	}
	
	/**
	 * 	getJSON (for popup window)
	 * */
	@RequestMapping(value="/webplayer", method=RequestMethod.GET, consumes="application/json; charset=UTF-8")
	@ResponseBody
	public String playerGET(@RequestParam("no") String no) throws Exception {
		log.info("webplayer-1");
		
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString("SUCCESS");
	}
	
	/**
	 * 	postJSON (for play all)
	 * */
	@RequestMapping(value="/playAll", method=RequestMethod.POST, consumes="application/json; charset=UTF-8")
	@ResponseBody
	public String playallPOST(@RequestBody List<Map<String,String>> songs, Model model) throws Exception {  //title,filePath
		log.info("전곡재생...");
		
		List<String> allAudioSrc = new ArrayList<>();
		
		for(Map<String,String> song : songs){
			String temp = song.get("filePath").substring(13).replace('\\', '/');
			temp = "/songs"+temp;
			allAudioSrc.add(temp);	
		}
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(allAudioSrc);
	}
	
	
	/** addSong : 한 곡 담기
	 *  @return audisrc
	 * */
	@RequestMapping(value="/add", method=RequestMethod.POST, consumes="application/json; charset=UTF-8")
	@ResponseBody
	public String addSongPOST(@RequestBody Map<String,String> path) throws Exception {
		log.info("Add song");
		
		String addsongURL = path.get("filePath");
		addsongURL = addsongURL.substring(13).replace('\\', '/');
		addsongURL = "/songs" + addsongURL;
	
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(addsongURL);
	}
	
}

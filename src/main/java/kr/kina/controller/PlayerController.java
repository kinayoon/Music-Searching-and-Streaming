package kr.kina.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.kina.service.CounterService;
import kr.kina.service.URLMaker;

@Controller
@RequestMapping("/player")
public class PlayerController {

	static final Logger log = LoggerFactory.getLogger(PlayerController.class);
	
	@Inject
	CounterService service;	
	
	@Inject
	URLMaker url;
	
	/** audioURL만들어주는 컨트롤러
	 * 	@return audioURL포함한 뿌려줄 전체데이터 
	 * */
	@RequestMapping(value="/webplayer", method=RequestMethod.POST, consumes="application/json; charset=UTF-8")
	public @ResponseBody List<Map<String,String>> getSongDataPOST(@RequestBody List<Map<String,String>> songData) throws Exception {
		log.info("Return audioURL for play song ...");
		
		List<Map<String,String>> returnData = songData;
		
		if( returnData.size() == 1){  //한 곡 재생x
			returnData.get(0).put("audioSrc", url.urlMaker(returnData.get(0).get("filePath")));
			returnData.get(0).remove("filePath");
		}
		if( returnData.size() > 1 ){  //전곡 재생
			for(Map<String,String> song : returnData){
				String src = url.urlMaker(song.get("filePath"));
				song.put("audioSrc", src);
				song.remove("filePath");
			}
		}
		return returnData;
	}
	
	/**
	 * popup player
	 * */
	@RequestMapping(value="/webplayer", method=RequestMethod.GET)
	public void popupWinGET()throws Exception {
		log.debug("webplayer Popup ..");
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

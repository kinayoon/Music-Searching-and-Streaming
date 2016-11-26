package kr.kina.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	/** make audioURL 
	 * 	@return List<> all data include audioURL 
	 * */
	@RequestMapping(value="/playList", method=RequestMethod.POST, consumes="application/json; charset=UTF-8")
	public @ResponseBody List<Map<String,String>> playListPOST(@RequestBody List<Map<String,String>> songData) throws Exception {
		log.debug("playList : One or All");
		
		for(Map<String,String> song : songData){		
			song.put("audioSrc", url.urlMaker(song.get("filePath")));
			song.remove("filePath");
		}
		return songData;
	}
	
	/** make audioURL 
	 *  @resutn List<> added data & newer add data
	 * */
	@RequestMapping(value="/addList", method=RequestMethod.POST, consumes="application/json; charset=UTF-8")
	public void addListPOST(@RequestBody List<Map<String,String>> beforeData,
							@RequestBody List<Map<String,String>> addData, Model model) throws Exception {
		log.debug("addList ..");
	
		List<Map<String,String>> result = new ArrayList<>();
		
		if(beforeData.size() > 0){
			for(Map<String,String> data : beforeData){
				result.add(data);
			}
		}
		if(addData.size() > 0){
			for(Map<String,String> data : addData){
				result.add(data);
			}
		}
		model.addAttribute("addData", result);	
	}
	
	
	/**
	 * popup player
	 * */
	@RequestMapping(value="/webplayer", method=RequestMethod.GET)
	public void popupWinGET()throws Exception {
		log.info("webplayer Popup ..");
	}	
}


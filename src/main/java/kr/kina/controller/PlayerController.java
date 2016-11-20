package kr.kina.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

import kr.kina.domain.StreamingVO;
import kr.kina.service.CounterService;

@Controller
@RequestMapping("/player")
public class PlayerController {

	static final Logger log = LoggerFactory.getLogger(PlayerController.class);
	
	@Inject
	CounterService service;	
	
	@RequestMapping(value="/webplayer", method=RequestMethod.GET)
	public void player() throws Exception{
		log.info("webplayer popup window..	2 ");
	}
	
	@RequestMapping(value="/webplayer", method=RequestMethod.POST, consumes="application/json; charset=UTF-8")
	@ResponseBody
	public String playerPOST(@RequestBody StreamingVO obj) throws Exception {
		log.info("webplayer data coming. 	1");
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(obj);
		
		return jsonData;	
	}
	
	
	
}

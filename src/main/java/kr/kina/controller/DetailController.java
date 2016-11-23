package kr.kina.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/detail")
public class DetailController {

	private static final Logger log = LoggerFactory.getLogger(DetailController.class);
	
	@RequestMapping("/album")
	public void resultAlbum(@RequestParam("query") String searchTxt) throws Exception {
		log.info("Album Detail Controller .... ");
	}
	
}

package kr.kina.controller;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kina.service.MemberService;

@Controller
public class MainController {

	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	MemberService service;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String mainPage() throws Exception {
		log.info("Genie Start ..");
		return "home";
	}
	
}

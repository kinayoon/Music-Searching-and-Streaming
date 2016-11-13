package kr.kina.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kina.domain.ArtistVO;
import kr.kina.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	static final Logger log = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	SearchService service;
	
	/**	통합검색 : '아티스트 -> 앨범 -> 곡' 순서대로 
	 *  select query (DAO처리) 
	 *  javascript로 동적처리해서 화면에 보여주기
	 *  @param query  :검색어
	 * */
	@RequestMapping(value="/searchMain", method=RequestMethod.GET)
	public void searchMain(@RequestParam("query") String queryText, Model model) throws Exception { 
		log.info("searchMain Controller .. ");
		
		List<ArtistVO> vo = service.searchArtist(queryText);
		if(vo == null){
			model.addAttribute("artistList", null);
			model.addAttribute("artistNum", null);
		}
		model.addAttribute("searchText", queryText);
		model.addAttribute("artistList", vo);
		model.addAttribute("artistNum", vo.size());
	}
}

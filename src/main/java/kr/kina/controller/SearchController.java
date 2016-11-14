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
import kr.kina.domain.SongVO;
import kr.kina.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	static final Logger log = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	SearchService service;
	
	/** searchMain(통합검색)
	 *  @param query
	 * */
	@RequestMapping(value="/searchMain", method=RequestMethod.GET)
	public void searchMain(@RequestParam("query") String queryText, Model model) throws Exception { 
		log.info("searchMain Controller .. ");
		
		List<SongVO> songVO = service.searchSong(queryText);
		List<ArtistVO> artistVO = service.searchArtist(queryText);
		
		//검색결과 : null
		if(artistVO.size() == 0){
			log.info("---------------------------------------------------------------");
			model.addAttribute("artistNum", 0);
		}
		model.addAttribute("searchText", queryText);
		
		//곡 검색
		model.addAttribute("songList", songVO);
		model.addAttribute("songNum", songVO.size());
		
		//아티스트 검색
		model.addAttribute("artistList", artistVO);
		model.addAttribute("artistNum", artistVO.size());
	}
}

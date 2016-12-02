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

import kr.kina.domain.SongVO;
import kr.kina.service.DetailService;
import kr.kina.service.AudioURLMaker;

@Controller
@RequestMapping("/detail")
public class DetailController {

	private static final Logger log = LoggerFactory.getLogger(DetailController.class);
	
	@Inject
	DetailService service;
	
	@Inject
	AudioURLMaker url;
	
	@RequestMapping(value="/artist", method=RequestMethod.GET)
	public void resultArtist(@RequestParam("artist") String artist, Model model) throws Exception {
		log.debug("Artist Detail Controller .... ");
		
		List<SongVO> songVO = service.artistPage(artist);  //title, duration, album, tracknum, artist, filepath--> url
		int size = songVO.size();	
		
		if(size >= 1)	model.addAttribute("resultArtistSize", size);	
		else            model.addAttribute("resultArtistSize", "이 없습니다.");
				
		model.addAttribute("SongByArtist", songVO);
		model.addAttribute("artistTxt", artist);
	}
	
	
	@RequestMapping(value="/album", method=RequestMethod.GET)
	public void resultAlbum(@RequestParam("id") String id, Model model) throws Exception {
		log.debug("Album Detail Controller .... ");
		
		List<SongVO> songVO = service.albumPage(id);
		int size = songVO.size();
		
		if(size >= 1)	model.addAttribute("resultAlbumSize", size);	
		else            model.addAttribute("resultAlbumSize", "이 없습니다.");	
		
		model.addAttribute("SongByAlbum", songVO);
		model.addAttribute("albumTxt", id);
		model.addAttribute("albumTitle", songVO.get(0).getAlbum());
		model.addAttribute("albumArtist", songVO.get(0).getArtist());
	}
		

}

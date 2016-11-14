package kr.kina.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.kina.domain.ArtistVO;
import kr.kina.domain.SongVO;
import kr.kina.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService{

	static final Logger log = LoggerFactory.getLogger(SearchServiceImpl.class);
	
	@Inject
	SearchDAO dao;
	
	
	@Override
	public List<ArtistVO> searchArtist(String searchText) throws Exception {
		return dao.searchArtist(searchText);
	}


	@Override
	public List<SongVO> searchSong(String searchText) throws Exception {
		return dao.searchSong(searchText);
	}

}

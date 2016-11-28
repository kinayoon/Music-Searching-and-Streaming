package kr.kina.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.kina.domain.AlbumVO;
import kr.kina.domain.ArtistVO;
import kr.kina.domain.Criteria;
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


	@Override
	public List<AlbumVO> searchAlbum(String searchText) throws Exception {
		return dao.searchAlbum(searchText);
	}


	@Override
	public List<ArtistVO> listPageArtist(Criteria criteria) throws Exception {
		return dao.listPageArtist(criteria);
	}


	@Override
	public List<SongVO> listPageSong(Criteria criteria) throws Exception {
		return dao.listPageSong(criteria);
	}


	@Override
	public List<AlbumVO> listPageAlbum(Criteria criteria) throws Exception {
		return dao.listPageAlbum(criteria);
	}

}

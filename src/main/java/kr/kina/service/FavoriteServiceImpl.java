package kr.kina.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.kina.domain.FavoriteSongVO;
import kr.kina.domain.SongVO;
import kr.kina.persistence.DetailDAO;
import kr.kina.persistence.DetailDAOImpl;
import kr.kina.persistence.FavoriteDAO;

@Service
public class FavoriteServiceImpl implements FavoriteService{

	private static final Logger log = LoggerFactory.getLogger(DetailDAOImpl.class);
	
	@Inject
	FavoriteDAO dao;

	@Override
	public void likeitSong(FavoriteSongVO vo) throws Exception {
		dao.likeitSong(vo);
	}

	@Override
	public List<SongVO> searchSong(String userid) throws Exception {
		return dao.searchSong(userid);
	}

	@Override
	public List<String> searchDuplicate(String id, String title) throws Exception {
		return dao.searchDuplicate(id, title);
	}

	@Override
	public void deleteFavoriteSong(String id) throws Exception {
		dao.deleteFavoriteSong(id);
	}

}

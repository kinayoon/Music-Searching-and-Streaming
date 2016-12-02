package kr.kina.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.kina.domain.FavoriteSongVO;
import kr.kina.domain.SongVO;

@Repository
public class FavoriteDAOImpl implements FavoriteDAO{

	private static final Logger log = LoggerFactory.getLogger(FavoriteDAOImpl.class);
	private String namespace = "kr.kina.mappers.FavoriteSongMapper";
	
	@Inject
	SqlSession session;

	@Override
	public void likeitSong(FavoriteSongVO vo) throws Exception {
		session.insert(namespace+".insertFavoriteSong", vo);
	}

	@Override
	public List<SongVO> searchSong(String userid) throws Exception {
		return session.selectList(namespace+".searchFavoriteSong", userid);
	}

	@Override
	public List<String> searchDuplicate(String id, String title) throws Exception {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("userid", id);
		paramMap.put("title", title);
		return session.selectList(namespace+".searchDuplicate", paramMap);
	}

	@Override
	public void deleteFavoriteSong(String id) throws Exception {
		session.delete(namespace+".deleteFavoriteSong", id);		
	}
}

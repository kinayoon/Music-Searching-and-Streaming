package kr.kina.persistence;

import java.util.List;
import java.util.Map;

import kr.kina.domain.FavoriteSongVO;
import kr.kina.domain.SongVO;

public interface FavoriteDAO {

	void likeitSong(FavoriteSongVO vo) throws Exception;
	List<SongVO> searchSong(String userid) throws Exception;
	Object searchDuplicate(String id, String title) throws Exception; 
}

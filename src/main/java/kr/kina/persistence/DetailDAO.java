package kr.kina.persistence;

import java.util.List;

import kr.kina.domain.SongVO;

public interface DetailDAO {

	List<SongVO> detailArtist(String artist) throws Exception;
	List<SongVO> detailAlbum(String id) throws Exception;
	
}

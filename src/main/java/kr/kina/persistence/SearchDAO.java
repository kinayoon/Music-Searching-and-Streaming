package kr.kina.persistence;

import java.util.List;

import kr.kina.domain.AlbumVO;
import kr.kina.domain.ArtistVO;
import kr.kina.domain.SongVO;

public interface SearchDAO {

	void searchAll(String searchText) throws Exception;    //전체검색
	List<ArtistVO> searchArtist(String searchText) throws Exception; //아티스트
	List<AlbumVO> searchAlbum(String searchText) throws Exception;  //앨범
	List<SongVO> searchSong(String searchText) throws Exception;	//곡
	
}

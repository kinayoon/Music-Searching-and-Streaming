package kr.kina.service;

import java.util.List;

import kr.kina.domain.AlbumVO;
import kr.kina.domain.ArtistVO;
import kr.kina.domain.SongVO;

public interface SearchService {

	List<ArtistVO> searchArtist(String searchText) throws Exception;  //아티스트 검색
	List<SongVO> searchSong(String searchText) throws Exception;  //곡 검색
	List<AlbumVO> searchAlbum(String searchText) throws Exception; //앨범 검색
}

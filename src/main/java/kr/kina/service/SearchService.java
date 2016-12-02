package kr.kina.service;

import java.util.List;

import kr.kina.domain.AlbumVO;
import kr.kina.domain.ArtistVO;
import kr.kina.domain.Criteria;
import kr.kina.domain.SongVO;

public interface SearchService {

	List<ArtistVO> searchArtist(String searchText) throws Exception;  // search artist in searchMain.jsp
	List<SongVO> searchSong(String searchText) throws Exception;  //search song in searchMain.jsp
	List<AlbumVO> searchAlbum(String searchText) throws Exception; //search album in searchMain.jsp
	
	List<ArtistVO> listPageArtist(Criteria criteria) throws Exception;  //pagination
	List<SongVO> listPageSong(Criteria criteria) throws Exception;  	//pagination
	List<AlbumVO> listPageAlbum(Criteria criteria) throws Exception; 	//pagination
	

}

package kr.kina.persistence;

import java.util.List;

import kr.kina.domain.AlbumVO;
import kr.kina.domain.ArtistVO;
import kr.kina.domain.Criteria;
import kr.kina.domain.SongVO;

public interface SearchDAO {

	List<ArtistVO> searchArtist(String searchText) throws Exception; //¾ÆÆ¼½ºÆ®
	List<AlbumVO> searchAlbum(String searchText) throws Exception;  //¾Ù¹ü
	List<SongVO> searchSong(String searchText) throws Exception;	//°î
	
	List<ArtistVO> listPageArtist(Criteria criteria) throws Exception;
	List<AlbumVO> listPageAlbum(Criteria criteria) throws Exception;
	List<SongVO> listPageSong(Criteria criteria) throws Exception;
	

}

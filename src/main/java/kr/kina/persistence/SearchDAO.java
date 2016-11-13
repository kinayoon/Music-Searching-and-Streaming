package kr.kina.persistence;

import java.util.List;

import kr.kina.domain.ArtistVO;

public interface SearchDAO {

	void searchAll(String searchText) throws Exception;    //전체검색
	List<ArtistVO> searchArtist(String searchText) throws Exception; //아티스트
	void searchAlbum(String searchText) throws Exception;  //앨범
	void searchSong(String searchText) throws Exception;	//곡
	
}

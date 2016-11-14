package kr.kina.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.kina.domain.AlbumVO;
import kr.kina.domain.ArtistVO;
import kr.kina.domain.SongVO;

@Repository
public class SearchDaoImpl implements SearchDAO{

	static private Logger log = LoggerFactory.getLogger(SearchDaoImpl.class);
	private String namespace ="kr.kina.mappers.SearchMapper";
	
	@Inject
	SqlSession session;	
	
	@Override
	public void searchAll(String searchText) throws Exception {  //전체검색
		
	}

	@Override
	public List<ArtistVO> searchArtist(String searchText) throws Exception {
		return session.selectList(namespace+".searchArtist", searchText);		
	}

	@Override
	public List<AlbumVO> searchAlbum(String searchText) throws Exception {
		return null;
	}

	@Override
	public List<SongVO> searchSong(String searchText) throws Exception {
		return session.selectList(namespace+".searchSong", searchText);
	}

}

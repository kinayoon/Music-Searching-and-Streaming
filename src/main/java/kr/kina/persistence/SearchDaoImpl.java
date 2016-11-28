package kr.kina.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.kina.domain.AlbumVO;
import kr.kina.domain.ArtistVO;
import kr.kina.domain.Criteria;
import kr.kina.domain.SongVO;

@Repository
public class SearchDaoImpl implements SearchDAO{

	static private Logger log = LoggerFactory.getLogger(SearchDaoImpl.class);
	private String namespace ="kr.kina.mappers.SearchMapper";
	
	@Inject
	SqlSession session;	
	

	@Override
	public List<ArtistVO> searchArtist(String searchText) throws Exception {
		return session.selectList(namespace+".searchArtist", searchText);		
	}

	@Override
	public List<AlbumVO> searchAlbum(String searchText) throws Exception {
		return session.selectList(namespace+".searchAlbum", searchText);
	}

	@Override
	public List<SongVO> searchSong(String searchText) throws Exception {
		return session.selectList(namespace+".searchSong", searchText);
	}

	@Override
	public List<ArtistVO> listPageArtist(Criteria criteria) throws Exception {
		return session.selectList(namespace+".listArtist", criteria);
	}

	@Override
	public List<AlbumVO> listPageAlbum(Criteria criteria) throws Exception {
		return session.selectList(namespace+".listAlbum", criteria);
	}

	@Override
	public List<SongVO> listPageSong(Criteria criteria) throws Exception {
		return session.selectList(namespace+".listSong", criteria);
	}

}

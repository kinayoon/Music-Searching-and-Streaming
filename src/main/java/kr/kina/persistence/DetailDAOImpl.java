package kr.kina.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.kina.domain.SongVO;

@Repository
public class DetailDAOImpl implements DetailDAO{

	private static final Logger log = LoggerFactory.getLogger(DetailDAOImpl.class);
	private String namespace = "kr.kina.mappers.DetailMapper";
	
	@Inject
	SqlSession session;
	
	@Override
	public List<SongVO> detailArtist(String artist) throws Exception {
		log.debug("detail artist page..");
		return session.selectList(namespace+".detailArtist", artist);
	}

	@Override
	public List<SongVO> detailAlbum(String id) throws Exception {
		log.debug("detail album page..");
		return session.selectList(namespace+".detailAlbum", Integer.parseInt(id));
	}

}

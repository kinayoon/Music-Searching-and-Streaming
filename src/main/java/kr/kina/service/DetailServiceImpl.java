package kr.kina.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.kina.domain.SongVO;
import kr.kina.persistence.DetailDAO;
import kr.kina.persistence.DetailDAOImpl;

@Service
public class DetailServiceImpl implements DetailService{

	private static final Logger log = LoggerFactory.getLogger(DetailDAOImpl.class);
	
	@Inject
	DetailDAO dao;
	

	@Override
	public List<SongVO> artistPage(String artist) throws Exception {
		return dao.detailArtist(artist);
	}
	
	@Override
	public List<SongVO> albumPage(String id) throws Exception {
		return dao.detailAlbum(id);
	}

}

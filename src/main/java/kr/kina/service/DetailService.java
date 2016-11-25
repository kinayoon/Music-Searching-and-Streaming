package kr.kina.service;

import java.util.List;

import kr.kina.domain.SongVO;

public interface DetailService {

	List<SongVO> albumPage(String id) throws Exception;
	List<SongVO> artistPage(String artist) throws Exception;
}

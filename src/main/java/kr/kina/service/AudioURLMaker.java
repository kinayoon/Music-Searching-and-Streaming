package kr.kina.service;

import org.springframework.stereotype.Service;

@Service
public class AudioURLMaker {  // For access external data (localhost D:/)

	public String urlMaker(String filepath) throws Exception{
		String url = filepath.substring(13).replace('\\', '/');
		url = "/songs" + url;
	
		return url;
	}
}

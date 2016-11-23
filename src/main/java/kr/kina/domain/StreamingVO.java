package kr.kina.domain;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class StreamingVO implements Serializable{

	private static final long serialVersionUID = 12L;
	private String title;
	private String artist;
	private String album;
	private String filePath;
		
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}

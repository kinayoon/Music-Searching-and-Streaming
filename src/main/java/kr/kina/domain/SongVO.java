package kr.kina.domain;

public class SongVO {
 
	private int albumid;
	private String album;
	private String title;  //filename
	private String artist;
	private double duration;  // mils -> sec으로 계산.
	private String tracknum;
	private String releaseDate;
	private String filePath;
	
	public SongVO(){}
		
	public int getAlbumid() {
		return albumid;
	}

	public void setAlbumid(int albumid) {
		this.albumid = albumid;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

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

	public double getDuration() {
		return duration;
	}

	public void setDuration(double duration) {
		this.duration = duration;
	}

	public String getTrackNum() {
		return tracknum;
	}

	public void setTrackNum(String tracknum) {
		this.tracknum = tracknum;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
}

package team_vo.VO;

public class BoardVO {
	private int bno;
	private String title;
	private String writer;
	private String contents;
	private String regdate;
	private String ip;
	private int status;
	private int hits;
	private String spot;
	private int recommend;
	private String proex;
	
	public String getProex() {
		return proex;
	}

	public void setProex(String proex) {
		this.proex = proex;
	}


	public BoardVO(int bno, String title, String writer, String contents, String regdate, String ip, int status,
			int hits, String spot, int recommend, String proex) {
		super();
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
		this.ip = ip;
		this.status = status;
		this.hits = hits;
		this.spot = spot;
		this.recommend = recommend;
		this.proex = proex;
	}





	public BoardVO(int bno, String title, String writer, String contents, String regdate, String ip, int status,
			int hits, String spot, int recommend) {
		super();
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
		this.ip = ip;
		this.status = status;
		this.hits = hits;
		this.spot = spot;
		this.recommend = recommend;
	}





	public int getRecommend() {
		return recommend;
	}





	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}





	public BoardVO() {
	}
	
	
	
	

	public BoardVO(int bno, String title, String writer, String contents, String regdate, String ip, int status,
			int hits, String spot) {
		super();
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
		this.ip = ip;
		this.status = status;
		this.hits = hits;
		this.spot = spot;
	}

	



	public String getSpot() {
		return spot;
	}





	public void setSpot(String spot) {
		this.spot = spot;
	}





	public BoardVO(int bno, String title, String writer, String contents, String regdate, String ip, int status,
			int hits) {
		super();
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
		this.ip = ip;
		this.status = status;
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "BoardVO ["+"title=" + title + ", writer=" + writer + ", contents=" + contents
				+ ", ip=" + ip + ", status=" + status + ", hits=" + hits + "]";
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}
	
	
	
	
	
}

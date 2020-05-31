package team_vo.VO;

public class freeboardVO {
	private int bno;
	private String title;
	private String writer;
	private String contents;
	private String regdate;
	private String ip;
	private int hits;
	private int recommend;
	
	public freeboardVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
	public freeboardVO(int bno, String title, String writer, String contents, String regdate, String ip, int hits,
			int recommend) {
		super();
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
		this.ip = ip;
		this.hits = hits;
		this.recommend = recommend;
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
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	
	
	
	
	
	
	
}

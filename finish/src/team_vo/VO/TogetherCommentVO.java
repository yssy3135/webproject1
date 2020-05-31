package team_vo.VO;

public class TogetherCommentVO {
	private int tcno;
	private int t_bno;
	private String t_writer;
	private String t_contents;
	private String t_regdate;
	
	
	public TogetherCommentVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getTcno() {
		return tcno;
	}

	public void setTcno(int tcno) {
		this.tcno = tcno;
	}

	public TogetherCommentVO(int tcno, int t_bno, String t_writer, String t_contents, String t_regdate) {
		super();
		this.tcno = tcno;
		this.t_bno = t_bno;
		this.t_writer = t_writer;
		this.t_contents = t_contents;
		this.t_regdate = t_regdate;
	}

	public TogetherCommentVO(int t_bno, String t_writer, String t_contents, String t_regdate) {
		super();
		this.t_bno = t_bno;
		this.t_writer = t_writer;
		this.t_contents = t_contents;
		this.t_regdate = t_regdate;
	}
	
	public TogetherCommentVO(int t_bno, String t_writer, String t_contents) {
		super();
		this.t_bno = t_bno;
		this.t_writer = t_writer;
		this.t_contents = t_contents;
	}
	
	
	
	public int getT_bno() {
		return t_bno;
	}
	public void setT_bno(int t_bno) {
		this.t_bno = t_bno;
	}
	public String getT_writer() {
		return t_writer;
	}
	public void setT_writer(String t_writer) {
		this.t_writer = t_writer;
	}
	public String getT_contents() {
		return t_contents;
	}
	public void setT_contents(String t_contents) {
		this.t_contents = t_contents;
	}
	public String getT_regdate() {
		return t_regdate;
	}
	public void setT_regdate(String t_regdate) {
		this.t_regdate = t_regdate;
	}
	
	
	
	
	
	
}



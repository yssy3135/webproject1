package team_vo.VO;

public class FreecommentVO {
	private int rno;
	private int re_bno;
	private String re_writer;
	private String re_contents;
	private String re_regdate;
	

	public FreecommentVO() {
		// TODO Auto-generated constructor stub
	}
	public int getRno() {
		return rno;
	}

	public FreecommentVO(int rno, int re_bno, String re_writer, String re_contents, String re_regdate) {
		super();
		this.rno = rno;
		this.re_bno = re_bno;
		this.re_writer = re_writer;
		this.re_contents = re_contents;
		this.re_regdate = re_regdate;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public FreecommentVO(int re_bno, String re_writer, String re_contents, String re_regdate) {
		super();
		this.re_bno = re_bno;
		this.re_writer = re_writer;
		this.re_contents = re_contents;
		this.re_regdate = re_regdate;
	}
	
	public FreecommentVO(int re_bno, String re_writer, String re_contents) {
		super();
		this.re_bno = re_bno;
		this.re_writer = re_writer;
		this.re_contents = re_contents;

	}
	
	public int getRe_bno() {
		return re_bno;
	}
	public void setRe_bno(int re_bno) {
		this.re_bno = re_bno;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	public String getRe_contents() {
		return re_contents;
	}
	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}
	public String getRe_regdate() {
		return re_regdate;
	}
	public void setRe_regdate(String re_regdate) {
		this.re_regdate = re_regdate;
	}
	
	
	
	
	
	
	

}

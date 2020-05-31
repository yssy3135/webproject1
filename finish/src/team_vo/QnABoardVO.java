package team_vo;

public class QnABoardVO {
	private int bno;
	private String btitle;
	private String mname;
	private String bcontents;
	private String bregdate;
	private int bhits;
	private String bpassword;

	
	public QnABoardVO() {
		super();
	}

	public QnABoardVO(int bno, String btitle, String mname, String bcontents, String bregdate, int bhits,
			String bpassword) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.mname = mname;
		this.bcontents = bcontents;
		this.bregdate = bregdate;
		this.bhits = bhits;
		this.bpassword = bpassword;

	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getBcontents() {
		return bcontents;
	}

	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}

	public String getBregdate() {
		return bregdate;
	}

	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}

	public int getBhits() {
		return bhits;
	}

	public void setBhits(int bhits) {
		this.bhits = bhits;
	}

	public String getBpassword() {
		return bpassword;
	}

	public void setBpassword(String bpassword) {
		this.bpassword = bpassword;
	}

	@Override
	public String toString() {
		return "QnABoardVO [bno=" + bno + ", btitle=" + btitle + ", mname=" + mname + ", bcontents=" + bcontents
				+ ", bregdate=" + bregdate + ", bhits=" + bhits + ", bpassword=" + bpassword + "]";
	}



	
}

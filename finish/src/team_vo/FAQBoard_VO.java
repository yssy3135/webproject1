package team_vo;

public class FAQBoard_VO {
	
	private int bno;
	private String btitle;
	private String mname;
	private String bcontents;
	private String bregdate;

	
	public FAQBoard_VO() {
		super();
	}

	public FAQBoard_VO(int bno, String btitle, String mname, String bcontents, String bregdate) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.mname = mname;
		this.bcontents = bcontents;
		this.bregdate = bregdate;
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


	@Override
	public String toString() {
		return "FAQBoard_VO [bno=" + bno + ", btitle=" + btitle + ", mname=" + mname + ", bcontents=" + bcontents
				+ ", bregdate=" + bregdate + "]";
	}

	
}

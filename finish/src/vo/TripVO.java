package vo;

public class TripVO {
	private int pno;
	private String tema;
	private String pname;
	private int pprice;
	private int qty;
	private String pcontents;
	private String mainimg;
	private String detailimg;
	private String course;
	private String pdate;

	public TripVO() {
		super();
	}

	public TripVO(int pno, String tema, String pname, int pprice, int qty, String pcontents, String mainimg,
			String detailimg, String course, String pdate) {
		super();
		this.pno = pno;
		this.tema = tema;
		this.pname = pname;
		this.pprice = pprice;
		this.qty = qty;
		this.pcontents = pcontents;
		this.mainimg = mainimg;
		this.detailimg = detailimg;
		this.course = course;
		this.pdate = pdate;

	}
	
	public TripVO(String tema, String pname, int pprice, int qty, String pcontents, String mainimg,
			String detailimg, String course, String pdate) {
		super();
		this.tema = tema;
		this.pname = pname;
		this.pprice = pprice;
		this.qty = qty;
		this.pcontents = pcontents;
		this.mainimg = mainimg;
		this.detailimg = detailimg;
		this.course = course;
		this.pdate = pdate;

	}
	
	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getTema() {
		return tema;
	}

	public void setTema(String tema) {
		this.tema = tema;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getPcontents() {
		return pcontents;
	}

	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}

	public String getMainimg() {
		return mainimg;
	}

	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}

	public String getDetailimg() {
		return detailimg;
	}

	public void setDetailimg(String detailimg) {
		this.detailimg = detailimg;
	}
	
	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "TripVO [pno=" + pno + ", tema=" + tema + ", pname" + pname + ",pprice" + pprice + ",qty" + qty + ",mainimg" + mainimg + ",detailimg" + detailimg + ",course" + course + ",pdate" + pdate  + "]";
	}
}

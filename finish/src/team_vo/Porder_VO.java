package team_vo;

public class Porder_VO {
	private String odate;
	private int ono;
	private int memno;
	private String pname;
	private int pprice;
	private String status;
	private String tdate;
	
	public Porder_VO() {}

	public Porder_VO(String odate, int ono, int memno, String pname, int pprice, String status, String tdate) {
		super();
		this.odate = odate;
		this.ono = ono;
		this.memno = memno;
		this.pname = pname;
		this.pprice = pprice;
		this.status = status;
		this.tdate = tdate;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	
	
	
}

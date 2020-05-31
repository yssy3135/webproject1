package vo;

public class TemaVO {
	private int tno;
	private String tname;
	
	public TemaVO() {
		// TODO Auto-generated constructor stub
	}

	public TemaVO(int tno, String tname) {
		super();
		this.tno = tno;
		this.tname = tname;
	}
	
	public TemaVO(String tname) {
		super();
		this.tname = tname;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}
	
	
	
	
	
}

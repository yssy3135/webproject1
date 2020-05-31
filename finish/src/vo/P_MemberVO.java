package vo;

public class P_MemberVO {
	private int memno;
	private String mid;
	private String mpw;
	private String mname;
	private String mbirth;
	private String mgender;
	private String mhp;
	private String memail;
	
	public P_MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public P_MemberVO(int memno, String mid, String mpw, String mname, String mbirth, String mgender, String mhp,
			String memail) {
		super();
		this.memno = memno;
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mbirth = mbirth;
		this.mgender = mgender;
		this.mhp = mhp;
		this.memail = memail;
	}
	
	public P_MemberVO(String mid, String mpw, String mname, String mbirth, String mgender, String mhp,
			String memail) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mbirth = mbirth;
		this.mgender = mgender;
		this.mhp = mhp;
		this.memail = memail;
	}

	public int getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMhp() {
		return mhp;
	}

	public void setMhp(String mhp) {
		this.mhp = mhp;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "P_MemberVO [memno=" +memno + ", mid" + mid + ", mpw" + mpw + ", mname" + mname + ", mbirth" + mbirth + ", mgender" + mgender + ", mhp" + mhp + "]"; 
	}
	
}

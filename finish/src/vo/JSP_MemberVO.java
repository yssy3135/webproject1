package vo;

public class JSP_MemberVO {
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String mp;
	private String regdate;
	private int memno; 				//integer로 하는 경우도 있음 위에건 stirng이니까 wrapper로
	private String email;
	
	public JSP_MemberVO() {}

	public JSP_MemberVO(String id, String pw, String name, String birth, String mp, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.mp = mp;
		this.email = email;
	}//memno 없는 생성자

	public JSP_MemberVO(String id, String pw, String name, String birth, String mp, int memno, String email, String regdate) {
		super();
		this.memno = memno;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.mp = mp;
		this.email = email;
		this.regdate = regdate;
	}//memno 있는 생성자

	
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getMp() {
		return mp;
	}

	public void setMp(String mp) {
		this.mp = mp;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
	}
	
	
	
	
	
}

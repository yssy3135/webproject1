package vo;
// VO (Value Object) : DBMS에서 되돌려주는 레코드 1개의 데이터를 담을 수 있는 객체
// 캡슐화 : 변수 - private / method(getter, setter) - public
// = Beans, Java Bean, JSP Bean (껍데기가 콩을 감싸고있는 모양처럼) 캡슐화가 되어있으니 빈즈라고 부른다
// 데이터를 담아놓을 수 있는 객체구나~~~~~~!

public class DeptVO {
	//되돌려주는 데이터를 담을 변수 선언 (클래스를 벗어나면 못쓰도록 private 처리)
	private int deptno;
	private String dname;
	private String loc;
	
	public DeptVO() {}	//기본생성자.
	
	//메소드가 아닌 생성자를 통해서도 데이터를 주고 받을 수 있음~!
	public DeptVO(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}
	
	
	//private 처리해주었으니 메소드를 통해 쓴다.
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
	
	
	
}

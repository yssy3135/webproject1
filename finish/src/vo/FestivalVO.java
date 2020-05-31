package vo;

public class FestivalVO {
	private String location;
	private String fname;
	private String fimg;
	private String fdate;
	private String fdate1;
	
	public FestivalVO() {
		// TODO Auto-generated constructor stub
	}

	public FestivalVO(String location, String fname, String fimg, String fdate, String fdate1) {
		this.location = location;
		this.fname = fname;
		this.fimg = fimg;
		this.fdate = fdate;
		this.fdate1 = fdate1;
	}
	
	public FestivalVO(String location, String fimg, String fdate, String fdate1) {
		this.location = location;
		this.fimg = fimg;
		this.fdate = fdate;
		this.fdate1 = fdate1;
	}
	
	public FestivalVO(String fimg) {
		this.fimg = fimg;
	}
	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFimg() {
		return fimg;
	}

	public void setFimg(String fimg) {
		this.fimg = fimg;
	}

	public String getFdate() {
		return fdate;
	}

	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
	
	public String getFdate1() {
		return fdate1;
	}

	public void setFdate1(String fdate1) {
		this.fdate1 = fdate1;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "FestivalVO [location=" + location + ", fname=" + fname + ", fimg" + fimg + ", fdate" + fdate + ", fdate1" + fdate1 + "]";
	}
	
	
	
}

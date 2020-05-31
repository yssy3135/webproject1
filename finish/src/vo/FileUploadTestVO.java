package vo;

public class FileUploadTestVO {
	private int fno;
	private String title;
	private String writer;
	private String contents;
	private String filepath;
	
	public FileUploadTestVO() {}

	public FileUploadTestVO(int fno, String title, String writer, String contents, String filepath) {
		super();
		this.fno = fno;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.filepath = filepath;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	
	
	
	
}

package file.dto;

public class Filetest {
	
	private int file_no;
	private int reg_no;
	private String originName;
	private String storedName;
	private String filePath;
	private String fileKind;
	

	@Override
	public String toString() {
		return "Filetest [file_no=" + file_no + ", reg_no=" + reg_no + ", originName="
				+ originName + ", storedName=" + storedName + ", filePath=" + filePath + ", fileKind=" + fileKind + "]";
	}
	public String getFileKind() {
		return fileKind;
	}
	public void setFileKind(String fileKind) {
		this.fileKind = fileKind;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getReg_no() {
		return reg_no;
	}
	public void setReg_no(int reg_no) {
		this.reg_no = reg_no;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
}

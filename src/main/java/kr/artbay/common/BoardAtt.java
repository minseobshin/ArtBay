package kr.artbay.common;

public class BoardAtt {
	//저희 테이블에 맞춰서 수정 해야 해요
	int Serial;
	int grp;
	int seq;
	String attFile;
	String delFile;
	
	public int getSerial() {return Serial;}
	public void setSerial(int serial) {Serial = serial;}
	public int getGrp() {return grp;}
	public void setGrp(int grp) {this.grp = grp;}
	public int getSeq() {return seq;}
	public void setSeq(int seq) {this.seq = seq;}
	public String getAttFile() {return attFile;}
	public void setAttFile(String attFile) {this.attFile = attFile;}
	public String getDelFile() {
		return delFile;
	}
	public void setDelFile(String delFile) {
		this.delFile = delFile;
	}
	
}

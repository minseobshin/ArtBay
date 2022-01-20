package kr.artbay.common;

public class ArtBayAtt {
	//저희 테이블에 맞춰서 수정 해야 해요
	int serial;
	int lot;
	String imgFile;
	String thumbnail;
	
	//qna 추가필드
	int grp;
	String attFile;
	
	public int getSerial() {return serial;}
	public void setSerial(int serial) {this.serial = serial;}
	public int getLot() {return lot;}
	public void setLot(int lot) {this.lot = lot;}
	public String getImgFile() {return imgFile;}
	public void setImgFile(String imgFile) {this.imgFile = imgFile;}
	public String getThumbnail() {return thumbnail;}
	public void setThumbnail(String thumbanil) {this.thumbnail = thumbanil;}
	
	public int getGrp() {return grp;}
	public void setGrp(int grp) {this.grp = grp;}
	public String getAttFile() {return attFile;}
	public void setAttFile(String attFile) {this.attFile = attFile;}
	
	
	
}

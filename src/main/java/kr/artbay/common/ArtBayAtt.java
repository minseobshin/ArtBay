package kr.artbay.common;

public class ArtBayAtt {
	//저희 테이블에 맞춰서 수정 해야 해요
	int Serial;
	int lot;
	String imgFile;
	int thumbanil;
	
	public int getSerial() {return Serial;}
	public void setSerial(int serial) {Serial = serial;}
	public int getLot() {return lot;}
	public void setLot(int lot) {this.lot = lot;}
	public String getImgFile() {return imgFile;}
	public void setImgFile(String imgFile) {this.imgFile = imgFile;}
	public int getThumbanil() {return thumbanil;}
	public void setThumbanil(int thumbanil) {this.thumbanil = thumbanil;}
	
}

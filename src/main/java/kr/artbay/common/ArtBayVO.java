package kr.artbay.common;

import java.util.ArrayList;
import java.util.List;

public class ArtBayVO {
	//저희 프로젝트에 맞춰서 바꿔야 해요
	int serial;
	String mid;
	String subject;
	String doc;
	String pwd;
	String mdate;
	int hit;
	int grp;
	int seq;
	int deep;
	int attCnt;
	List<ArtBayAtt> attList = new ArrayList<ArtBayAtt>();
	List<String> delList = new ArrayList<String>();	
	String[] delFile;
	
	public String[] getDelFile() {return delFile;}
	public void setDelFile(String[] delFile) {this.delFile = delFile;}
	public int getSerial() {return serial;}
	public void setSerial(int serial) {this.serial = serial;}
	public String getMid() {return mid;}
	public void setMid(String mid) {this.mid = mid;}
	public String getSubject() {return subject;}
	public void setSubject(String subject) {this.subject = subject;}
	public String getDoc() {return doc;}
	public void setDoc(String doc) {this.doc = doc;}
	public String getPwd() {return pwd;}
	public void setPwd(String pwd) {this.pwd = pwd;}
	public String getMdate() {return mdate;}
	public void setMdate(String mdate) {this.mdate = mdate;}
	public int getHit() {return hit;}
	public void setHit(int hit) {this.hit = hit;}
	public int getGrp() {return grp;}
	public void setGrp(int grp) {this.grp = grp;}
	public int getSeq() {return seq;}
	public void setSeq(int seq) {this.seq = seq;}
	public int getDeep() {return deep;}
	public void setDeep(int deep) {this.deep = deep;}
	public int getAttCnt() {
		return attCnt;
	}
	public void setAttCnt(int attCnt) {this.attCnt = attCnt;}
	public List<ArtBayAtt> getAttList() {return attList;}
	public void setAttList(List<ArtBayAtt> attList) {this.attList = attList;}
	public List<String> getDelList() {return delList;}
	public void setDelList(List<String> delList) {this.delList = delList;}
	
}

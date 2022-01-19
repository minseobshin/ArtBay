package kr.artbay.common;

public class ArtBaySessionVo {
	
	//로그인 세션유지 전용

	String mid;
	String pwd;
	String oldPwd;
	String newPwd;
	String newPwdChk;
	
	public String getMid() {return mid;}
	public void setMid(String mid) {this.mid = mid;}
	public String getPwd() {return pwd;}
	public void setPwd(String pwd) {this.pwd = pwd;}
	public String getOldPwd() {return oldPwd;}
	public void setOldPwd(String oldPwd) {this.oldPwd = oldPwd;}
	public String getNewPwd() {return newPwd;}
	public void setNewPwd(String newPwd) {this.newPwd = newPwd;}
	public String getNewPwdChk() {return newPwdChk;}
	public void setNewPwdChk(String newPwdChk) {this.newPwdChk = newPwdChk;}
	
}

package kr.artbay.common;

import java.util.ArrayList;
import java.util.List;

public class ArtBayVo { 
	//혹시 빠진게 있나 확인 부탁해요~
	int serial;
	int lot;
	
	//즉시판매가
	int direct_price;
	
	//응찰
	int bid_price;
	String bid_date;
	
	//낙찰 
	int winbid_price;
	String winbid_date;
	
	//member
	String mid;
	String injung;
	String irum;
	String birth;
	String phone;
	String memberJoinEmail;
	String gender;
	int age;
	String pwd;
	String oldPwd;
	String zip;
	String address;
	String address2;
	String mdate;
	String m_status;
	
	//경매작품
	String artwork_name;
	String artwork_ctgr;
	String artist;
	String material;
	String artwork_size;
	String contents;
	String etc;
	int start_price;
	int current_price;
	String regist_date;
	String due_date;
	int bid_cnt;
	String crnt_status;
	String sort;
	
	//공지사항
	String title;
	String doc;
	String not_date;
	
	
	//QNA
	int qna_num;
	String qna_title;
	String qna_doc;
	String qna_date;
	String qna_status;
	String qna_type;
	String qna_pwd;
	
	int hit;
	int grp;
	int seq;
	int deep;
	String thumbnail;
	
	
	
	String imgFile;
	int attCnt;
	List<ArtBayAtt> attList = new ArrayList<ArtBayAtt>();
	List<String> delList = new ArrayList<String>();	
	String[] delFile;
	
	
	//faq
	String ctgr;
	String faq_title;
	String faq_doc;
	
	
	
	
	
	public String getCtgr() {return ctgr;}
	public void setCtgr(String ctgr) {this.ctgr = ctgr;}
	public String getFaq_title() {return faq_title;}
	public void setFaq_title(String faq_title) {this.faq_title = faq_title;}
	public String getFaq_doc() {return faq_doc;}
	public void setFaq_doc(String faq_doc) {this.faq_doc = faq_doc;}
		
	public String[] getDelFile() {return delFile;}
	public void setDelFile(String[] delFile) {this.delFile = delFile;}
	public int getSerial() {return serial;}
	public void setSerial(int serial) {this.serial = serial;}
	public String getMid() {return mid;}
	public void setMid(String mid) {this.mid = mid;}
	public String getDoc() {return doc;}
	public void setDoc(String doc) {this.doc = doc;}
	public String getPwd() {return pwd;}
	public String getOldPwd() {return oldPwd;}
	public void setOldPwd(String oldPwd) {this.oldPwd = oldPwd;}
	public int getLot() {return lot;}
	public void setLot(int lot) {this.lot = lot;}
	public int getDirect_price() {return direct_price;}
	public void setDirect_price(int direct_price) {this.direct_price = direct_price;}
	public int getBid_price() {return bid_price;}
	public void setBid_price(int bid_price) {this.bid_price = bid_price;}
	public String getBid_date() {return bid_date;}
	public void setBid_date(String bid_date) {this.bid_date = bid_date;}
	public int getWinbid_price() {return winbid_price;}
	public void setWinbid_price(int winbid_price) {this.winbid_price = winbid_price;}
	public String getWinbid_date() {return winbid_date;}
	public void setWinbid_date(String winbid_date) {this.winbid_date = winbid_date;}
	public String getInjung() {return injung;}
	public void setInjung(String injung) {this.injung = injung;}
	public String getIrum() {return irum;}
	public void setIrum(String irum) {this.irum = irum;}
	public String getBirth() {return birth;}
	public void setBirth(String birth) {this.birth = birth;}
	public String getPhone() {return phone;}
	public void setPhone(String phone) {this.phone = phone;}
	public String getEmail() {return memberJoinEmail;}
	public String getMemberJoinEmail() {return memberJoinEmail;}
	public void setMemberJoinEmail(String memberJoinEmail) {this.memberJoinEmail = memberJoinEmail;}
	public void setEmail(String email) {this.memberJoinEmail = email;}
	public String getGender() {return gender;}
	public void setGender(String gender) {this.gender = gender;}
	public int getAge() {return age;}
	public void setAge(int age) {this.age = age;}
	public String getZip() {return zip;}
	public void setZip(String zip) {this.zip = zip;}
	public String getAddress() {return address;}
	public void setAddress(String address) {this.address = address;}
	public String getAddress2() {return address2;}
	public void setAddress2(String address2) {this.address2 = address2;}
	public String getM_status() {return m_status;}
	public void setM_status(String m_status) {this.m_status = m_status;}
	public String getArtwork_name() {return artwork_name;}
	public void setArtwork_name(String artwork_name) {this.artwork_name = artwork_name;}
	public String getArtwork_ctgr() {return artwork_ctgr;}
	public void setArtwork_ctgr(String artwork_ctgr) {this.artwork_ctgr = artwork_ctgr;}
	public String getArtist() {return artist;}
	public void setArtist(String artist) {this.artist = artist;}
	public String getMaterial() {return material;}
	public void setMaterial(String material) {this.material = material;}
	public String getArtwork_size() {return artwork_size;}
	public String getContents() {return contents;}
	public void setContents(String contents) {this.contents = contents;}
	public String getEtc() {return etc;}
	public void setEtc(String etc) {this.etc = etc;}
	public void setArtwork_size(String artwork_size) {this.artwork_size = artwork_size;}
	public int getStart_price() {return start_price;}
	public void setStart_price(int start_price) {this.start_price = start_price;}
	public int getCurrent_price() {return current_price;}
	public void setCurrent_price(int current_price) {this.current_price = current_price;}
	public String getRegist_date() {return regist_date;}
	public void setRegist_date(String regist_date) {this.regist_date = regist_date;}
	public String getDue_date() {return due_date;}
	public void setDue_date(String due_date) {this.due_date = due_date;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public int getQna_num() {return qna_num;}
	public void setQna_num(int qna_num) {this.qna_num = qna_num;}
	public String getQna_title() {return qna_title;}
	public void setQna_title(String qna_title) {this.qna_title = qna_title;}
	public String getQna_doc() {return qna_doc;}
	public void setQna_doc(String qna_doc) {this.qna_doc = qna_doc;}
	public String getQna_date() {return qna_date;}
	public void setQna_date(String qna_date) {this.qna_date = qna_date;}
	public String getQna_status() {return qna_status;}
	public void setQna_status(String qna_status) {this.qna_status = qna_status;}	
	public String getQna_type() {return qna_type;}
	public void setQna_type(String qna_type) {this.qna_type = qna_type;}
	public String getQna_pwd() {return qna_pwd;}
	public void setQna_pwd(String qna_pwd) {this.qna_pwd = qna_pwd;}
	public String getThumbnail() {return thumbnail;}
	public void setThumbnail(String thumbnail) {this.thumbnail = thumbnail;}
	public String getImgFile() {return imgFile;}
	public void setImgFile(String imgFile) {this.imgFile = imgFile;}
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
	public int getAttCnt() {return attCnt;}
	public void setAttCnt(int attCnt) {this.attCnt = attCnt;}
	public List<ArtBayAtt> getAttList() {return attList;}
	public void setAttList(List<ArtBayAtt> attList) {this.attList = attList;}
	public List<String> getDelList() {return delList;}
	public void setDelList(List<String> delList) {this.delList = delList;}
	public int getBid_cnt() {return bid_cnt;}
	public void setBid_cnt(int bid_cnt) {this.bid_cnt = bid_cnt;}
	public String getCrnt_status() {return crnt_status;}
	public void setCrnt_status(String crnt_status) {this.crnt_status = crnt_status;}
	public String getNot_date() {return not_date;}
	public void setNot_date(String not_date) {this.not_date = not_date;}
	public String getSort() {return sort;}
	public void setSort(String sort) {this.sort = sort;}
	
}

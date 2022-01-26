package kr.artbay.common;

public class Page {
	int startNo, endNo;
	int listSize = 10, blockSize=5, totSize;
	int startPage, endPage, totPage;
	int nowPage=1;
	String findCol="";
	String findType="";
	String findStr="";
	String mid = "";
	String sort="";
	String rSort="";
	
	String r_date="";
	

	public Page() {}
	
	public Page(int tot, int now) {
		this.totSize = tot;
		this.nowPage = now;
		pageCompute();
	}
	
	public void pageCompute() {
		totPage = (int)Math.ceil(totSize/(double)listSize);
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		endNo = (endNo>totSize)? totSize : endNo;
		//뒤 코드는 if(endNo>totSize) endNo = totSize와 같은 코드임
		
		endPage = (int)(Math.ceil(nowPage/(double)blockSize)) * blockSize;
		startPage = endPage - blockSize + 1;
		endPage = (endPage > totPage)? totPage : endPage;
	}

	public int getStartNo() {return startNo;}
	public void setStartNo(int startNo) {this.startNo = startNo;}
	public int getEndNo() {return endNo;}
	public void setEndNo(int endNo) {this.endNo = endNo;}
	public int getListSize() {return listSize;}
	public void setListSize(int listSize) {this.listSize = listSize;}
	public int getBlockSize() {return blockSize;}
	public void setBlockSize(int blockSize) {this.blockSize = blockSize;}
	public int getTotSize() {return totSize;}
	public void setTotSize(int totSize) {
		this.totSize = totSize;
		pageCompute();
	}
	public int getStartPage() {return startPage;}
	public void setStartPage(int startPage) {this.startPage = startPage;}
	public int getEndPage() {return endPage;}
	public void setEndPage(int endPage) {this.endPage = endPage;}
	public int getTotPage() {return totPage;}
	public void setTotPage(int totPage) {this.totPage = totPage;}
	public int getNowPage() {return nowPage;}
	public void setNowPage(int nowPage) {this.nowPage = nowPage;}
	public String getFindStr() {return findStr;}
	public void setFindStr(String findStr) {this.findStr = findStr;}	
	public String getMid() {return mid;}
	public void setMid(String mid) {this.mid = mid;}
	public String getFindCol() {return findCol;}
	public void setFindCol(String findCol) {this.findCol = findCol;}
	public String getFindType() {return findType;}
	public void setFindType(String findType) {this.findType = findType;}

	public String getSort() {return sort;}
	public void setSort(String sort) {this.sort = sort;}
	public String getrSort() {return rSort;}
	public void setrSort(String rSort) {this.rSort = rSort;}
	
	public String getR_date() {return r_date;}
	public void setR_date(String r_date) {this.r_date = r_date;}
}

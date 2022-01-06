package kr.artbay.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service //service가 없으면 config 파일을 만들어야 함
//@Transactional //순수하게 Dao 역할만 하도록 주석처리함.
public class TestService { //일종의 dao 역할 CRUD
	
	/*
	@Autowired
	BoardMapper bmapper;
	*/
	
	int[] su = {1,23,4564,254987,784,456,578,34,3,83472872,12312,432,98,756,0};
	
	public TestService() {
		System.out.println("BoardService(BoardService.java에..)........");
	}
	
	public int sum(int x, int y) {
		return (x+y);
	}
	
	public int max(int x, int y) {
		int max = su[x];
		for(int i=x; i<=y; i+=1) {
			if(su[i]>max) max=su[i];
		}
		
		return max;
	}
	
	public List<Integer> range(int x, int y) {
		List<Integer> list = new ArrayList<Integer>();
		for(int i=x; i<=y; i+=1) {
			list.add(su[i]);
		}
		
		return list;
	}
	
	/*
	public String getTotList() {
		String temp = "전체 건수: ";
		int totList = bmapper.totSize("");
		
		temp += totList;
		
		System.out.println(temp);
		
		return temp;
	}
	*/

}

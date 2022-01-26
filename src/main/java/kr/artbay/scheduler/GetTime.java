package kr.artbay.scheduler;

import java.time.LocalDateTime;

public class GetTime {
	LocalDateTime date;
	
	public GetTime() {
		date = LocalDateTime.now();
	}
	
	public LocalDateTime getDate() {return date;}
	public void setDate(LocalDateTime date) {this.date = date;}
}

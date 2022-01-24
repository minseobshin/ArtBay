package kr.artbay.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	@Scheduled(cron="*/5 * * * * *")
	public void scheduler1() {
		
	}
}

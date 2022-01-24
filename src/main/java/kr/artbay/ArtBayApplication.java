package kr.artbay;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class ArtBayApplication {

	public static void main(String[] args) {
		SpringApplication.run(ArtBayApplication.class, args);
	}
 
}

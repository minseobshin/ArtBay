package kr.artbay.scheduler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.artbay.common.ArtBayVo;
import kr.artbay.mybatis.ListViewService;

@Component
public class Scheduler {
	
	@Autowired
	ListViewService service;

}

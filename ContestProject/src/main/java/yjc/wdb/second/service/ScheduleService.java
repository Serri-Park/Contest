package yjc.wdb.second.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import yjc.wdb.second.bean.Schedule;



@Service
public interface ScheduleService {

	
	public void insertSche(Schedule svo)throws Exception;



	public Schedule getScheInfo(Integer s_id)throws Exception;


	public void deleteSche(int s_id)throws Exception;

	public void eventUpdate(Schedule schevo)throws Exception;
	public List<Schedule> getSearchList(HashMap<?, ?> map)throws Exception;
	public void insertScheduleDrop(Schedule cal)throws Exception;

	List<Schedule> getRecently(String u_id)throws Exception;

	List<Schedule> getEvents(int t_id)throws Exception;
}

package yjc.wdb.second.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.second.bean.Schedule;
import yjc.wdb.second.dao.ScheduleDAO;



@Service
public class ScheduleServiceImpl implements ScheduleService {

	
	@Inject
	private ScheduleDAO dao;
	
	@Override
	public void insertSche(Schedule svo) throws Exception {
		dao.join(svo);
	}

	@Override
	public List<Schedule> getEvents(int t_id) {
		// TODO Auto-generated method stub
		
	
		
		
		return dao.getEvents(t_id);
		
		
	}
	@Override
	public void deleteSche(int s_id) {
		// TODO Auto-generated method stub
		dao.deleteSche(s_id);
	}

	@Override
	public void eventUpdate(Schedule schevo) {
		// TODO Auto-generated method stub
		dao.updateSche(schevo);
	}

	@Override
	public void insertScheduleDrop(Schedule cal) {
		// TODO Auto-generated method stub
		dao.insertScheduleDrop(cal);
	}

	@Override
	public Schedule getScheInfo(Integer s_id) {
		// TODO Auto-generated method stub
		return dao.getScheInfo(s_id);
	}

	@Override
	public List<Schedule> getRecently(String u_id) {
		// TODO Auto-generated method stub
	
		return dao.getRecently(u_id);
	}
	@Override
	public List<Schedule> getSearchList(HashMap<?, ?> map) {
		// TODO Auto-generated method stub
		return dao.getSearchList(map);
	}
}

package yjc.wdb.second.dao;



import java.util.HashMap;
import java.util.List;

import yjc.wdb.second.bean.Schedule;








public interface ScheduleDAO {

	public void join(Schedule svo)throws Exception;

	public List<Schedule> getEvents(int t_id);
	public void deleteSche(int s_id);

	public void updateSche(Schedule schevo);

	public void insertScheduleDrop(Schedule cal);

	public Schedule getScheInfo(Integer s_id);

	public List<Schedule> getRecently(String u_id);
	public List<Schedule> getSearchList(HashMap<?, ?> map);
}

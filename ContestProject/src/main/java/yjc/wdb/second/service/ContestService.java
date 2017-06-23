package yjc.wdb.second.service;

import java.util.List;

import yjc.wdb.second.bean.Contest;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.bean.Receipt;
import yjc.wdb.second.bean.Work;

public interface ContestService {
	public void create(Contest contest) throws Exception;
	public Contest read(int c_id) throws Exception;
	public void update(Contest contest) throws Exception;
	public void delete(int c_id) throws Exception;
	public List<Contest> listPage(Criteria criteria) throws Exception;
	public int getTotalCount() throws Exception;
	public List<Contest> listSearch(Criteria criteria) throws Exception;
	public int getSearchTotalCount(Criteria criteria)  throws Exception;
	public List<String> getAttach(Integer c_id) throws Exception;
	public void insertSubmit(Receipt receipt)  throws Exception;
	public void insertwork(Work  work) throws Exception;
	public int getWorkCount(int r_id)throws Exception;
	public List<Contest>ContestLists()throws Exception;
}

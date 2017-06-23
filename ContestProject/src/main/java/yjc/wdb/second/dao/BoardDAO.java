package yjc.wdb.second.dao;

import java.util.List;

import yjc.wdb.second.bean.Board;
import yjc.wdb.second.bean.Criteria;

public interface BoardDAO {
	public void create(Board vo) throws Exception;
	public Board read(int bid) throws Exception;
	public void update(Board vo) throws Exception;
	public void delete(int bid) throws Exception;
	public List<Board> listAll() throws Exception;
	public List<Board> listPage(Criteria criteria) throws Exception;
	public int getTotalCount() throws Exception;
	public List<Board> listSearch(Criteria criteria) throws Exception;
	public int getSearchTotalCount(Criteria criteria)  throws Exception;
	public void addAttach(String f_name) throws Exception;
	public List<String> getAttach(Integer bid) throws Exception;
	public String readGroup(int gid) throws Exception;
	public void deleteAttach(Integer bid) throws Exception;
	public void replaceAttach(String f_name, Integer bid) throws Exception;
	public void updateHit(int bid) throws Exception;
}

package yjc.wdb.second.service;

import java.util.List;

import yjc.wdb.second.bean.Board;
import yjc.wdb.second.bean.Criteria;

public interface BoardService {
	public void regist(Board b)  throws Exception;
	public Board read(int bid) throws Exception;
	public void modify(Board b) throws Exception;
	public void remove(int bid) throws Exception;
	public List<Board> ListAll() throws Exception;
	public List<Board> listPage(Criteria criteria) throws Exception;
	public int getTotalCount() throws Exception;
	public List<Board> listSearch(Criteria criteria) throws Exception;
	public int getSearchTotalCount(Criteria criteria) throws Exception;
	public List<String> getAttach(Integer bid) throws Exception;
	public String readGroup(int gid) throws Exception;
}

package yjc.wdb.second.service;

import java.util.List;

import yjc.wdb.second.bean.BW;
import yjc.wdb.second.bean.IDEA;
import yjc.wdb.second.bean.Page;


public interface BWService {
	public void bwregist(BW b)  throws Exception;
	public int bwpage(int bw_id)  throws Exception;
	public void regist2(IDEA i)  throws Exception;
	public void ideaModify(IDEA i)  throws Exception;
	public int bwread(IDEA idea)  throws Exception;
	public List<IDEA> bwlistpage(String bwp_id) throws Exception;
	public int listpageid(Page page)  throws Exception;
	public int count(int bw_id)  throws Exception;
	public String timer(int bw_id)  throws Exception;
	public List<IDEA> idealist(int bw_id) throws Exception;
	public List<BW> bwlist(String t_id)throws Exception;
	public String category(String bwc_content) throws Exception;
	public void categoryupdate(IDEA idea) throws Exception;
}

package yjc.wdb.second.dao;

import java.util.List;

import yjc.wdb.second.bean.BW;
import yjc.wdb.second.bean.IDEA;
import yjc.wdb.second.bean.Page;

public interface BWDAO {
	public void bwcreate(BW vo) throws Exception;
	public int bwpage(int bw_id) throws Exception;
	public void idea(IDEA io) throws Exception;
	public void ideaModify(IDEA io) throws Exception;
	public int bwread(IDEA idea)throws Exception;
	public List<IDEA> bwlistpage(String bwp_id) throws Exception;
	public int listpageid(Page page)throws Exception;
	public int count(int bw_id) throws Exception;
	public String timer(int bw_id) throws Exception;
	public List<IDEA> idealist(int bw_id) throws Exception;
	public List<BW> bwlist(String t_id) throws Exception;
	public String category(String bwc_content)throws Exception;
	public void categoryupdate(IDEA idea)throws Exception;
}

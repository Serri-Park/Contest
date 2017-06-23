package yjc.wdb.second.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.second.bean.BW;
import yjc.wdb.second.bean.IDEA;
import yjc.wdb.second.bean.Page;
import yjc.wdb.second.dao.BWDAO;

@Service
public class BWServiceImple implements BWService{
	@Inject
	private BWDAO dao;

	@Override
	public void bwregist(BW b) throws Exception {
		// TODO Auto-generated method stub
		dao.bwcreate(b);
	}
	@Override
	public int bwpage(int bw_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.bwpage(bw_id);
	}

	@Override
	public void regist2(IDEA i) throws Exception {
		// TODO Auto-generated method stub
		dao.idea(i);
	}
	@Override
	public void ideaModify(IDEA i) throws Exception {
		// TODO Auto-generated method stub
		dao.ideaModify(i);
	}
	@Override
	public int bwread(IDEA idea) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println(idea_cont);
		return dao.bwread(idea);
	}
	@Override
	public List<IDEA> bwlistpage(String bwp_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.bwlistpage(bwp_id);
	}
	@Override
	public int listpageid(Page page) throws Exception {
		// TODO Auto-generated method stub
		return dao.listpageid(page);
	}
	@Override
	public int count(int bw_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(bw_id);
	}
	@Override
	public List<IDEA> idealist(int bw_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idealist(bw_id);
	}
	@Override
	public List<BW> bwlist(String t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.bwlist(t_id);
	}
	
	@Override
	public String category(String bwc_content) throws Exception {
		// TODO Auto-generated method stub
		return dao.category(bwc_content);
	}
	@Override
	public String timer(int bw_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.timer(bw_id);
	}
	@Override
	public void categoryupdate(IDEA idea) throws Exception {
		// TODO Auto-generated method stub
		dao.categoryupdate(idea);
	}

}

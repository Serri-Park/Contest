package yjc.wdb.second.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import yjc.wdb.second.bean.Contest;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.bean.Receipt;
import yjc.wdb.second.bean.Work;
import yjc.wdb.second.dao.ContestDAO;

@Service
public class ContestServiceImpl implements ContestService {

	@Inject
	private ContestDAO dao;
	
	@Transactional
	@Override
	public void create(Contest contest) throws Exception {
		// TODO Auto-generated method stub
		dao.create(contest);
		
		String[] files = contest.getF_name();
		if(files == null) return;
		for(String fileName : files) {
			dao.addAttach(fileName);
		}
		
	}

	@Override
	public Contest read(int c_id) throws Exception {
		// TODO Auto-generated method stub
		dao.updateHit(c_id);
		return dao.read(c_id);
	}

	@Override
	public void update(Contest contest) throws Exception {
		// TODO Auto-generated method stub
		dao.update(contest);
		
		int c_id = contest.getC_id();
		dao.deleteAttach(c_id);
		String[] files = contest.getF_name();
		
		if(files == null) return;
		
		for(String fileName : files) {
				dao.replaceAttach(fileName, c_id);
		}
		
	}

	@Override
	public void delete(int c_id) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(c_id);
		dao.deleteAttach(c_id);
	}

	@Override
	public List<Contest> listPage(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(criteria);
	}

	@Override
	public int getTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCount();
	}

	@Override
	public List<Contest> listSearch(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(criteria);
	}

	@Override
	public int getSearchTotalCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.getSearchTotalCount(criteria);
	}

	@Override
	public List<String> getAttach(Integer c_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getAttach(c_id);
	}
	@Override		
	public void insertSubmit(Receipt receipt) throws Exception {
		// TODO Auto-generated method stub
		Contest contest=new Contest();
	
     
		
		dao.insertSubmit(receipt);
	
	}
	
	@Override
	public void insertwork(Work work) throws Exception {
		// TODO Auto-generated method stub
		Receipt receipt=new Receipt();
		
		dao.insertwork(work);
		String[] files = work.getF_name();
		if(files == null) return;
		for(String fileName : files) {
			dao.addAttachs(fileName);
		}
		
	}

	@Override
	public int getWorkCount(int r_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getWorkCount(r_id);
	}

	@Override
	public List<Contest> ContestLists() throws Exception {
		// TODO Auto-generated method stub
		return dao.ContestLists();
	}

	
}

package yjc.wdb.second.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import yjc.wdb.second.bean.Board;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.dao.BoardDAO;
import yjc.wdb.second.dao.BoardReplyDAO;

@Service
public class BoardServiceImple implements BoardService{
	@Inject
	private BoardDAO dao;
	@Inject
	private BoardReplyDAO daor;
	
	@Transactional
	@Override
	public void regist(Board b) throws Exception {
		// TODO Auto-generated method stub
		dao.create(b);
		
		String[] files = b.getF_name();
		if(files == null) return;
		
		for (String fileName : files) {
			dao.addAttach(fileName);
		}
	}

	@Override
	public Board read(int bid) throws Exception {
		// TODO Auto-generated method stub
		dao.updateHit(bid);
		return dao.read(bid);
	}

	@Override
	public void modify(Board b) throws Exception {
		// TODO Auto-generated method stub
		dao.update(b);
		
		Integer bid = b.getB_id();
		dao.deleteAttach(bid);
		String[] files = b.getF_name();
		
		if(files == null) return;
		
		for (String filename : files) {
			dao.replaceAttach(filename, bid);
		}
	}

	@Override
	public void remove(int bid) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteAttach(bid);
		dao.delete(bid);
		daor.deleteAll(bid);
	}

	@Override
	public List<Board> ListAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}


	@Override
	public List<Board> listPage(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(criteria);
	}

	@Override
	public int getTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCount();
	}

	@Override
	public List<Board> listSearch(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(criteria);
	}

	@Override
	public int getSearchTotalCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.getSearchTotalCount(criteria);
	}

	@Override
	public List<String> getAttach(Integer bid) throws Exception {
		// TODO Auto-generated method stub
		return dao.getAttach(bid);
	}

	@Override
	public String readGroup(int gid) throws Exception {
		// TODO Auto-generated method stub
		return dao.readGroup(gid);
	}

}

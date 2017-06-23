package yjc.wdb.second.service;

import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Service;

import yjc.wdb.second.bean.BoardReply;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.dao.BoardReplyDAO;

@Service
public class BoardReplyServiceImple implements BoardReplyService {
	@Inject
	private BoardReplyDAO dao;
	
	@Override
	public List<BoardReply> list(int bid) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(bid);
	}

	@Override
	public void create(BoardReply reply) throws Exception {
		// TODO Auto-generated method stub
		dao.create(reply);
	}

	@Override
	public void update(BoardReply reply) throws Exception {
		// TODO Auto-generated method stub
		dao.update(reply);
	}

	@Override
	public void delete(int rno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(rno);
	}

	@Override
	public List<BoardReply> listPage(int bid, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(bid, criteria);
	}

	@Override
	public int replyCount(int bid) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyCount(bid);
	}

}

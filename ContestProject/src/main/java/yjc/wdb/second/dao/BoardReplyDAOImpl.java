package yjc.wdb.second.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.second.bean.BoardReply;
import yjc.wdb.second.bean.Criteria;

@Repository
public class BoardReplyDAOImpl implements BoardReplyDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "yjc.wdb.ReplyMapper";
	
	@Override
	public List<BoardReply> list(int bid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".list", bid);
	}

	@Override
	public void create(BoardReply reply) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+".create", reply);

	}

	@Override
	public void update(BoardReply reply) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".update", reply);

	}

	@Override
	public void delete(int rno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".delete", rno);

	}

	@Override
	public List<BoardReply> listPage(int bid, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("bid", bid);
		paraMap.put("criteria", criteria);
		return sqlSession.selectList(NAMESPACE+".listPage", paraMap);
	}

	@Override
	public int replyCount(int bid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".replyCount", bid);
	}

	@Override
	public void deleteAll(int bid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".deleteAll", bid);

	}

}

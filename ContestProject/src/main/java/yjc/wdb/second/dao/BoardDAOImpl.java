package yjc.wdb.second.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.second.bean.Board;
import yjc.wdb.second.bean.Criteria;
@Repository
public class BoardDAOImpl implements BoardDAO {
	private static final String namespace="yjc.wdb.bbsMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(Board vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".create", vo );
		
	}

	@Override
	public Board read(int bid) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace+".read",bid);
	}

	@Override
	public void update(Board vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".update",vo);
	}

	@Override
	public void delete(int bid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete",bid);
	}

	@Override
	public List<Board> listAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listAll");
	}

	@Override
	public List<Board> listPage(Criteria criteria) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listPage", criteria);
	}

	@Override
	public int getTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".totalCount");
	}

	@Override
	public List<Board> listSearch(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listSearch", criteria);
	}

	@Override
	public int getSearchTotalCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".searchTotalCount", criteria);
	}

	@Override
	public void addAttach(String f_name) throws Exception {
		sqlSession.insert(namespace+".addAttach", f_name);
	}

	@Override
	public List<String> getAttach(Integer bid) throws Exception {
		return sqlSession.selectList(namespace+".getAttach", bid);
	}

	@Override
	public String readGroup(int gid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".readGroup", gid);
	}

	@Override
	public void deleteAttach(Integer bid) throws Exception {
		sqlSession.delete(namespace+".deleteAttach", bid);
	}

	@Override
	public void replaceAttach(String f_name, Integer bid) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bid", bid);
		paramMap.put("f_name", f_name);
		
		sqlSession.insert(namespace+".replaceAttach", paramMap);
	}

	@Override
	public void updateHit(int bid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateHit", bid);
	}

}

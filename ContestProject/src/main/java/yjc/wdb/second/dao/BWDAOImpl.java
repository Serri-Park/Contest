package yjc.wdb.second.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.second.bean.BW;
import yjc.wdb.second.bean.IDEA;
import yjc.wdb.second.bean.Page;

@Repository
public class BWDAOImpl implements BWDAO{
private static final String namespace="yjc.wdb.bwMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void bwcreate(BW vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".bwcreate", vo );
		
	}
	@Override
	public int bwpage(int bw_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".bwpage",bw_id );
		return sqlSession.selectOne(namespace+".pageread",bw_id );
	}

	@Override
	public void idea(IDEA io) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".idea", io );
	}

	@Override
	public int bwread(IDEA idea) {
		// TODO Auto-generated method stub
		//System.out.println(idea_cont);
		return sqlSession.selectOne(namespace+".bwread", idea );
		
	}
	@Override
	public void ideaModify(IDEA io) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".ideaModify", io);
	}
	@Override
	public List<IDEA> bwlistpage(String bwp_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".bwlistpage", bwp_id);
		
	}
	@Override
	public int listpageid(Page page) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".listpageid", page );
	}
	@Override
	public int count(int bw_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".count",bw_id );
	}
	@Override
	public List<IDEA> idealist(int bw_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".idealist", bw_id);
	}
	@Override
	public List<BW> bwlist(String t_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".bwlist", t_id);
	}
	@Override
	public String category(String bwc_content) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".categoryinsert", bwc_content );
		return sqlSession.selectOne(namespace+".categoryselect",bwc_content);
	}
	@Override
	public String timer(int bw_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".timer",bw_id );
	}
	@Override
	public void categoryupdate(IDEA idea) throws Exception {
		int t = sqlSession.selectOne(namespace+".categoryupdateselect", idea);
		  idea.setBwc_id(t);
			sqlSession.update(namespace+".categoryupdate", idea);
		
		
	}

	
}

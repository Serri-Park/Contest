package yjc.wdb.second.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.second.bean.Userbean;




@Repository
public class memberDaoImpl implements memberDao {
     public final static String namespace="yjc.wdb.mappers"; 
     @Inject
     private SqlSession sqlsession;
     
	@Override
	public void insertMember(Userbean member)throws Exception {
		// TODO Auto-generated method stub
         sqlsession.insert(namespace+".insertmembers",member);
	}

	public Userbean view(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".view", mid);
	}

	@Override
	public List<Userbean> getMemberAll() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".getMemberAll");
	}

	@Override
	public Userbean login(Userbean vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".login",vo);
	}

	@Override
	public Userbean check(String id) throws Exception {
		return sqlsession.selectOne(namespace+".idChk", id);

	}
//	@Override
//	public Integer getType(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlsession.selectOne(namespace+".getType",id);
//	}
}

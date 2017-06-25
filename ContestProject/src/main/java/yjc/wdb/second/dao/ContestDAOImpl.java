package yjc.wdb.second.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.second.bean.Contest;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.bean.Receipt;
import yjc.wdb.second.bean.Work;
@Repository
public class ContestDAOImpl implements ContestDAO {
	private static final String namespace="yjc.wdb.ContestMapper";

	@Inject
	private SqlSession sql;
	
	@Override
	public void create(Contest contest) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".create", contest);
	}

	@Override
	public Contest read(int c_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".read", c_id);
	}

	@Override
	public void update(Contest contest) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".update", contest);
	}

	@Override
	public void delete(int c_id) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace+".delete", c_id);
	}

	@Override
	public List<Contest> listPage(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listPage", criteria);
	}

	@Override
	public int getTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".totalCount");
	}

	@Override
	public List<Contest> listSearch(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listSearch", criteria);
	}

	@Override
	public int getSearchTotalCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".searchTotalCount", criteria);
	}

	@Override
	public void addAttach(String f_name) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".addAttach", f_name);
	}

	@Override
	public List<String> getAttach(Integer c_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".getAttach", c_id);
	}

	@Override
	public void deleteAttach(Integer c_id) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace+".deleteAttach", c_id);
	}

	@Override
	public void replaceAttach(String f_name, Integer c_id) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("c_id", c_id);
		paramMap.put("f_name", f_name);
		
		sql.insert(namespace+".replaceAttach", paramMap);
	}

	@Override
	public void updateHit(int c_id) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".updateHit", c_id);
	}
	@Override
	public void insertSubmit(Receipt receipt) {
		// TODO Auto-generated method stub
		sql.insert(namespace+".submitInsert",receipt);
	}
	
	@Override
	public void insertwork(Work work) {
		// TODO Auto-generated method stub
		sql.insert(namespace+".WorkInsert",work);
	}

	@Override
	public Receipt receiptInfo(int r_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".getr_id",r_id);
	}

	@Override
	public void addAttachs(String f_name) throws Exception {
		sql.insert(namespace+".addWork",f_name);
		
	}

	@Override
	public int getWorkCount(int r_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Contest> ContestLists() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".ContestListMain");
	}
}

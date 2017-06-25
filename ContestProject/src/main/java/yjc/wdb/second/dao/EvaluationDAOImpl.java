package yjc.wdb.second.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.second.bean.Evaluation;
import yjc.wdb.second.bean.Manager;
@Repository
public class EvaluationDAOImpl implements EvaluationDAO{
private static final String namespace="yjc.wdb.EvalMapper";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public Evaluation read(int c_Id) throws Exception {
		// TODO Auto-generated method stub
	
		return sql.selectOne(namespace+".read",c_Id);
	}

	@Override
	public void create(Evaluation vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".create",vo);
	}

	@Override
	public void firstCreate(Evaluation e) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".firstCreate",e);
	}

	@Override
	public Manager manager(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".manager",t_id);
	}

	@Override
	public Manager config(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".config",t_id);
	}

	@Override
	public List<Manager> read_id(int c_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".read_id",c_id);
	}

	@Override
	public Manager read_work(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".read_work", m);
	}

	@Override
	public int cnt_work(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".cnt_work",m);
	}

	@Override
	public void grande(Manager m) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".grande",m);
	}

	@Override
	public Manager get_work_id(Manager work) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".get_work_id", work);
	}

	@Override
	public void del_grande(Manager m) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace+".del_grande",m);
	}

	@Override
	public List<Manager> get_epage(int c_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".get_epage",c_id);
	}

	@Override
	public void update(Evaluation evaluation) {
		// TODO Auto-generated method stub
		sql.update(namespace+".update_ep",evaluation);
	}

	@Override
	public List<Manager> progress(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".progress",m);
	}

	@Override
	public int cnt_m(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".cnt_m",t_id);
	}

	@Override
	public int cnt_eval(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".cnt_eval",m);
	}

	@Override
	public int cnt_u_work(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".cnt_u_work",m);
	}

	@Override
	public List<Manager> cnt_alleval(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".cnt_alleval",m);
	}

	@Override
	public Manager get_ep_id(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".get_ep_id", t_id);
	}

	@Override
	public void stage_end(int t_id) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".stage_end", t_id);
	}

	@Override
	public void stage_pro(int ep_id) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".stage_pro", ep_id);
	}

	@Override
	public List<Manager> result_get(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".result_get", m);
	}

	@Override
	public void result_set(Manager m) throws Exception {
		// TODO Auto-generated method stub
		if(m.getW_result()>0)
		sql.update(namespace+".result_set",m);
		if(m.getW_result()<=0){
			m.setStage(m.getStage()-1);
			sql.update(namespace+".result_set",m);
		}
	}

	@Override
	public List<Manager> get_work(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".get_work", t_id);
	}

	@Override
	public Manager nowEp_id(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".nowEp_id", t_id);
	}

	@Override
	public void passFail(Evaluation vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".passFail", vo);
	}

	@Override
	public List<Manager> epEl(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".epEl", t_id);
	}

	@Override
	public int ep_id(int c_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".ep_id", c_id);
	}

	@Override
	public void elistCreate(Manager m) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".elistCreate",m);
	}

	@Override
	public List<Manager> getu_id(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".getu_id", t_id);
	}

}

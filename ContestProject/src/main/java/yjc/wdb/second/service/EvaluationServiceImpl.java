package yjc.wdb.second.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import yjc.wdb.second.bean.Evaluation;
import yjc.wdb.second.bean.Manager;
import yjc.wdb.second.dao.EvaluationDAO;
@Service
public class EvaluationServiceImpl implements EvaluationService{
	@Inject
	private EvaluationDAO dao;
	
	@Override
	public Evaluation read(int c_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(c_id);
	}
	@Transactional
	@Override
	public void create(Evaluation vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);
		System.out.println("두번째"+vo.getEp_how());
		if(vo.getEp_how().equals("Pass or Fail 방법")){
			dao.passFail(vo);
		}
	}
	@Transactional
	@Override
	public void firstCreate(Evaluation evaluation) throws Exception {
		// TODO Auto-generated method stub
		dao.firstCreate(evaluation);
		
		if(evaluation.getEp_how().equals("Pass or Fail 방법")){
			System.out.println("1번째"+evaluation.getEp_how());
			dao.passFail(evaluation);
		}
	}
	@Override
	public Manager manager(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.manager(t_id);
	}

	@Override
	public Manager config(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.config(t_id);
	}

	@Override
	public List<Manager> read_id(int c_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.read_id(c_id);
	}

	@Override
	public Manager read_work(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return dao.read_work(m);
	}

	@Override
	public int cnt_work(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return dao.cnt_work(m);
	}

	@Override
	public void grande(Manager m) throws Exception {
		// TODO Auto-generated method stub
		dao.grande(m);
		
	}

	@Override
	public Manager get_work_id(Manager work) throws Exception {
		// TODO Auto-generated method stub
		return dao.get_work_id(work);
	}

	@Override
	public void del_grande(Manager m) throws Exception {
		// TODO Auto-generated method stub
		dao.del_grande(m);
	}

	@Override
	public List<Manager> get_epage(int c_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.get_epage(c_id);
	}

	@Override
	public void update(Evaluation evaluation) {
		// TODO Auto-generated method stub
		dao.update(evaluation);
	}

	@Override
	public List<Manager> progress(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return dao.progress(m);
	}

	

	@Override
	public int cnt_m(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.cnt_m(t_id);
	}

	@Override
	public int cnt_eval(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return dao.cnt_eval(m);
	}

	@Override
	public int cnt_u_work(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return dao.cnt_u_work(m);
	}

	@Override
	public List<Manager> cnt_alleval(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return dao.cnt_alleval(m);     
	}

	@Override
	public Manager get_ep_id(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.get_ep_id(t_id);
	}

	@Override
	public void stage_end(int t_id) throws Exception {
		// TODO Auto-generated method stub
		dao.stage_end(t_id);
	}

	@Override
	public void stage_pro(int ep_id) throws Exception {
		// TODO Auto-generated method stub
		dao.stage_pro(ep_id);
	}

	@Override
	public List<Manager> result_get(Manager m) throws Exception {
		// TODO Auto-generated method stub
		return dao.result_get(m);
	}

	@Override
	public void result_set(Manager m) throws Exception {
		// TODO Auto-generated method stub
		dao.result_set(m);
	}

	@Override
	public List<Manager> get_work(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.get_work(t_id);
	}

	@Override
	public Manager nowEp_id(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.nowEp_id(t_id);
	}
	@Override
	public List<Manager> epEl(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.epEl(t_id);
	}
	@Override
	public int ep_id(int c_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.ep_id(c_id);
	}
	@Override
	public void elistCreate(Manager m) throws Exception {
		// TODO Auto-generated method stub
		dao.elistCreate(m);
	}

}

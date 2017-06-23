package yjc.wdb.second.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.second.bean.Userbean;
import yjc.wdb.second.dao.memberDao;





@Service
public class memberServiceImpl implements memberService {
@Inject
memberDao dao;

	@Override
	public void insertMember(Userbean member)throws Exception {
	dao.insertMember(member);

	}
	public Userbean view(String mid) {
		// TODO Auto-generated method stub
		return dao.view(mid);
	}
	
	@Override
	public List<Userbean> getMemberAll() {
		// TODO Auto-generated method stub
		return dao.getMemberAll();
	}
	@Override
	public Userbean login(Userbean vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	@Override
	public Userbean check(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.check(id);
	}

//	public Integer getType(String id) throws Exception{
//		return dao.getType(id);
//	}


}

package yjc.wdb.second.service;

import java.util.List;
import java.util.Map;

import yjc.wdb.second.bean.Userbean;






public interface memberService {
	public void insertMember(Userbean member)throws Exception;
	public Userbean login(Userbean vo)throws Exception;
	public Userbean check(String id)throws Exception;
	public List<Userbean> getMemberAll();
	public Userbean view(String mid);
//	public Integer getType(String id) throws Exception;
}

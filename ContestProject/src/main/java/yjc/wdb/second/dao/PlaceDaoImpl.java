package yjc.wdb.second.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.ognl.Evaluation;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.second.bean.Board;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.bean.Criteria2;
import yjc.wdb.second.bean.PlaceVo;
import yjc.wdb.second.bean.Reservation;
import yjc.wdb.second.bean.evaluationVo;
import yjc.wdb.second.bean.pay;




@Repository
public class PlaceDaoImpl implements PlaceDao {
	@Inject
	private SqlSession session;
	private static String namespace = "web.yjc.wdb.mappers.placeMapper";

	@Override
	public void insertPlace(PlaceVo place) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertPlace", place);

	}

		

	@Override
	public PlaceVo getPlaceInfo(Integer p_id) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".listInfo", p_id);
	}

	@Override
	public void insertReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertReservation", reservation);
	}

	@Override
	public List<Reservation> ReservationList(String u_id) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listRservation", u_id);
	}

	@Override
	public Reservation getReservationInfo(Integer  pr_id) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".reservationInfo", pr_id);
	}

	@Override
	public void insertpay(pay pay) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertpay", pay);
	}

	@Override
	public void deletePlace( Integer p_id) {
		// TODO Auto-generated method stub
		session.delete(namespace + ".deletePlace", p_id);
	}

	@Override
	public void updatePlace( Integer p_id) {
		// TODO Auto-generated method stub
		session.update(namespace + ".updatePlace",  p_id);
	}

	@Override
	public List<pay> Paylist(String id) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listPay", id);
	}

	@Override
	public void deleteReservation(  Integer pr_id) {
		// TODO Auto-generated method stub
		session.delete(namespace + ".deletereservation", pr_id);
	}

	@Override
	public void updateReservationStatus( Integer pr_id) {
		// TODO Auto-generated method stub
		session.update(namespace + ".reservationUpdate", pr_id);
	}

	@Override
	public List<evaluationVo> list(Integer  p_id) throws Exception {

		return session.selectList(namespace + ".list", p_id);
	}

	@Override
	public void create(evaluationVo vo) throws Exception {

		session.insert(namespace + ".create", vo);
	}
	@Override
	public void update(evaluationVo vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update", vo);

	}

	@Override
	public void delete(Integer r_id) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", r_id);

	}

	@Override
	public List<evaluationVo> listPage( Integer p_no, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("p_no", p_no);
		paraMap.put("criteria", criteria);
		return session.selectList(namespace+".listPage", paraMap);
	}

	@Override
	public int replyCount(Integer p_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".replyCount", p_no);
	}

	@Override
	public List<PlaceVo> PlaceList(Criteria2 criteria) {
		// TODO Auto-generated method stub
	return session.selectList(namespace + ".listPlace",criteria);
	
	}


	@Override
	public int getTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".totalCount");
	}
	@Override
	public List<PlaceVo> listSearch(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listSearch", criteria);
	}

	@Override
	public int getSearchTotalCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".searchTotalCount", criteria);
	}

	

}

package yjc.wdb.second.service;

import java.util.List;

import javax.inject.Inject;



import org.springframework.stereotype.Service;

import yjc.wdb.second.bean.Board;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.bean.Criteria2;
import yjc.wdb.second.bean.PlaceVo;
import yjc.wdb.second.bean.Reservation;
import yjc.wdb.second.bean.evaluationVo;
import yjc.wdb.second.bean.pay;
import yjc.wdb.second.dao.PlaceDao;


@Service
public class PlaceServiceImpl implements PlaceService {
	@Inject
	PlaceDao dao;

	@Override
	public void insertPlace(PlaceVo place) {
		// TODO Auto-generated method stub
		dao.insertPlace(place);
	}

	@Override
	public List<PlaceVo> PlaceList(Criteria2 criteria) {
		// TODO Auto-generated method stub
		return dao.PlaceList(criteria);

	}
	
	

	
	@Override
	public PlaceVo getPlaceInfo(Integer p_id) {
		// TODO Auto-generated method stub
		return dao.getPlaceInfo(p_id);
	}

	@Override
	public void insertReservation(Reservation reservation) {
		// TODO Auto-generated method stub

		dao.insertReservation(reservation);

	}

	@Override
	public List<Reservation> ReservationList(String u_id) {
		// TODO Auto-generated method stub
		return dao.ReservationList(u_id);
	}

	@Override
	public Reservation getReservationInfo( Integer pr_id) {
		// TODO Auto-generated method stub
		return dao.getReservationInfo(pr_id);
	}

	@Override
	public void insertpay(pay pay) {
		// TODO Auto-generated method stub
		dao.insertpay(pay);

		// dao.deleteReservation(pay.getReservation_id());
		dao.updateReservationStatus(pay.getPr_id());
	}

	@Override
	public void deletePlace( Integer  p_id) {
		// TODO Auto-generated method stub
		dao.deletePlace( p_id);
	}

	@Override
	public void updatePlace( Integer  p_id) {
		// TODO Auto-generated method stub
		dao.updatePlace( p_id);
	}

	@Override
	public List<pay> Paylist(String id) {
		// TODO Auto-generated method stub
		return dao.Paylist(id);
	}

	@Override
	public void addReply(evaluationVo vo) throws Exception {
		// TODO Auto-generated method stub
	dao.create(vo);
	}

	

	@Override
	public void update(evaluationVo evaluationVo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(evaluationVo);
	}

	@Override
	public void delete( Integer r_id) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(r_id);
	}


	@Override
	public int getTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCount();
	}

	@Override
	public List<PlaceVo> listSearch(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(criteria);
	}

	@Override
	public int getSearchTotalCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.getSearchTotalCount(criteria);
	}



}

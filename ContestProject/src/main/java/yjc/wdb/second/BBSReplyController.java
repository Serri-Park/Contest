package yjc.wdb.second;

import java.util.*;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import yjc.wdb.second.bean.BoardReply;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.service.BoardReplyService;

@RestController
@RequestMapping("replies")
public class BBSReplyController {
	@Inject
	private BoardReplyService service;

	@RequestMapping(value="/{b_id}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("b_id") int b_id, @PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			criteria.setPage(page);
			int replyCount = service.replyCount(b_id);
			criteria.setTotalCount(replyCount);
			List<BoardReply> list = service.listPage(b_id, criteria);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("criteria", criteria);
			map.put("list", list);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{cid}",	method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("cid") int cid){
		ResponseEntity<String> entity = null;
		try {
			service.delete(cid);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);	
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value="/{cid}",
	method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("cid") int cid, 
			@RequestBody BoardReply reply) {
		ResponseEntity<String> entity = null;
		try {
			reply.setBc_id(cid);;
			service.update(reply);
			
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/all/{b_id}", method=RequestMethod.GET)
	public ResponseEntity<List<BoardReply>> getReplylistity(@PathVariable("b_id") int b_id) {
		ResponseEntity<List<BoardReply>> entity = null;
		try {
			List<BoardReply> list = service.list(b_id);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody BoardReply reply) {
		ResponseEntity<String> entity = null;
		try {
			service.create(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			System.out.println("성공");
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping("getErrorAuth")
	public ResponseEntity<Void> getErrorAuth() {
		ResponseEntity<Void> re = new ResponseEntity(HttpStatus.BAD_REQUEST);
		return re;
	}
	
}

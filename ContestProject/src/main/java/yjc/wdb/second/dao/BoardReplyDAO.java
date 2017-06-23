package yjc.wdb.second.dao;

import java.util.List;

import yjc.wdb.second.bean.BoardReply;
import yjc.wdb.second.bean.Criteria;

public interface BoardReplyDAO {
   
   public List<BoardReply> list(int bid) throws Exception;
   public void create(BoardReply reply) throws Exception;
   public void update(BoardReply reply) throws Exception;
   public void delete(int rno) throws Exception;
   public List<BoardReply> listPage(int bid, Criteria criteria) throws Exception;
   public int replyCount(int bid) throws Exception;
   public void deleteAll(int bid) throws Exception;
   
}
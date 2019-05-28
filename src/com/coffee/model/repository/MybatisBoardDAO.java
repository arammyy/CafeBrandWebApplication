package com.coffee.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coffee.model.domain.Board;

@Repository
public class MybatisBoardDAO implements BoardDAO {
   @Autowired
   private SqlSessionTemplate sessionTemplate;

   @Override
   public int insert(Board board) {
      return sessionTemplate.insert("Board.insert", board);
   }
   @Override
   public int reply(Board board) {
	   System.out.println(board.getTitle());
	   System.out.println(board.getContent());
	   System.out.println(board.getTeam());
	   System.out.println(board.getRank());
	   System.out.println(board.getDepth());
	   System.out.println(board.getMember().getMember_id());
	   return sessionTemplate.insert("Board.reply", board);
   }
      
   @Override
   public List selectAll() {
      return sessionTemplate.selectList("Board.selectAll");
   }

   @Override
   public Board select(int board_id) {
      return sessionTemplate.selectOne("Board.select", board_id);
   }

   @Override
   public int update(Board board) {
      return sessionTemplate.update("Board.update", board);
   }


   @Override
   public int delete(int Board_id) {
      return sessionTemplate.delete("Board.delete", Board_id);
   }

   
}

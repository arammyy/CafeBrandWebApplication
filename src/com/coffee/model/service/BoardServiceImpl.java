package com.coffee.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coffee.common.exception.DeleteFailException;
import com.coffee.common.exception.EditFailException;
import com.coffee.common.exception.RegistFailException;
import com.coffee.model.domain.Board;
import com.coffee.model.repository.BoardDAO;
@Service
public class BoardServiceImpl implements BoardService{
	   @Autowired
	   private BoardDAO boardDAO;

	@Override
	public void insert(Board board) throws RegistFailException{
		int result=boardDAO.insert(board);
	      if(result==0) {
	         throw new RegistFailException("등록되지 않았습니다");
	      }
	}
	
	@Override
	public void reply(Board board) throws RegistFailException{
		int result=boardDAO.reply(board);
		if(result==0) {
			throw new RegistFailException("등록되지 않았습니다");
		}
	}

	 @Override
	   public List selectAll() {
	      return boardDAO.selectAll();
	   }

	   @Override
	   public Board select(int board_id) {
	      return boardDAO.select(board_id);
	   }

	   @Override
	   public void update(Board board) throws EditFailException{
	      int result=boardDAO.update(board);
	      if(result==0) {
	         throw new EditFailException("수정되지 않았습니다");
	      }
	   }


	   @Override
	   public void delete(int board_id) throws DeleteFailException{
	      int result=boardDAO.delete(board_id);
	      if(result==0) {
	         throw new DeleteFailException("삭제되지 않았습니다");
	      }
	   }

}

package com.coffee.model.repository;

import java.util.List;

import com.coffee.model.domain.Board;

public interface BoardDAO {
	public int insert(Board board);
	public int reply(Board board);
	public List selectAll();
	public Board select(int board_id);
	public int update(Board board);
	public int delete(int board_id);
}

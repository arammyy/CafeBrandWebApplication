package com.coffee.model.service;

import java.util.List;

import com.coffee.model.domain.Board;
import com.coffee.model.domain.Board;

public interface BoardService {
	public void insert(Board board);
	public void reply(Board board);
	public List selectAll();
	public Board select(int board_id);
	public void update(Board board);
	public void delete(int board_id);

}

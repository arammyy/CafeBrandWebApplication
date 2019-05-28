package com.coffee.controller.client;

import java.util.List;

import javax.security.auth.login.AccountNotFoundException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.coffee.common.exception.DeleteFailException;
import com.coffee.common.exception.EditFailException;
import com.coffee.common.exception.RegistFailException;
import com.coffee.model.domain.Board;
import com.coffee.model.domain.Grade;
import com.coffee.model.domain.Member;
import com.coffee.model.service.BoardService;

@Controller
@RequestMapping("/client")
public class ClientBoardController {
   @Autowired
   private BoardService boardService;
   
   
   //목록 가져오기
   @RequestMapping(value="/board/list",method=RequestMethod.GET)
	public ModelAndView selectAll(HttpServletRequest request) {
	   System.out.println("목록보기 요청");
		List<Board> boardList = boardService.selectAll();
		int member_id=2; //넣어줘야함
		ModelAndView mav = new ModelAndView("client/board/list");
		mav.addObject("boardList", boardList);
		mav.addObject("member_id", (Integer)member_id);
		
		return mav;
	}
   
   //한건 가져오기
   @RequestMapping(value="/board/detail",method=RequestMethod.GET)
   public ModelAndView select(int board_id) {
	   System.out.println("상세보기 요청");
	      Board board=boardService.select(board_id);
	      ModelAndView mav=new ModelAndView("client/board/detail");
	      mav.addObject("board",board);
	      
	      return mav;
   }
   
   //등록으로 가기
	
	  @RequestMapping(value="/board/goRegist",method=RequestMethod.GET) 
	  public ModelAndView goRegist() {
	  ModelAndView mav=new ModelAndView("client/board/regist");
	  
	 return mav; }
	 
   
   //등록하기
   @RequestMapping(value="/board/doRegist",method=RequestMethod.POST)
   public ModelAndView insert(Board board, int member_id) {
	      Member member = new Member();
	      member.setMember_id(member_id);
	      board.setMember(member);
	      boardService.insert(board);
	      ModelAndView mav=new ModelAndView("redirect:/client/board/list");
	     // mav.addObject("member_id", member_id);
      return mav;
   }
   
   //삭제하기
   @RequestMapping(value="/board/delete",method=RequestMethod.POST) //jsp파일에서 겟인지 포스튼지 확인
   public ModelAndView delete(int board_id) {
      System.out.println("삭제 요청");
      boardService.delete(board_id);
      ModelAndView mav=new ModelAndView("redirect:/client/board/list");

      return mav;
      }

   //수정하기   
   @RequestMapping(value="/board/edit", method=RequestMethod.POST)
   public ModelAndView update(Board board, int member_id) {
	  Member member = new Member();
      member.setMember_id(member_id);
      board.setMember(member);
      boardService.update(board);
      System.out.println(board.getMember().getMember_id());
      ModelAndView mav=new ModelAndView("redirect:/client/board/list");

      return mav;
      }
   
   
   //답글달기로..
   @RequestMapping(value="/board/goReply", method=RequestMethod.POST)
   public ModelAndView goReply(Board board, int member_id) {
	  Member member = new Member();
      member.setMember_id(member_id);
      board.setMember(member);
      
      ModelAndView mav=new ModelAndView("client/board/reply");
      mav.addObject("board", board);
      return mav;
      }
   
   //답글 달기
   @RequestMapping(value="/board/reply", method=RequestMethod.POST)
   public ModelAndView reply(Board board, int member_id) {
	  Member member = new Member();
      member.setMember_id(member_id);
      board.setMember(member);
      boardService.reply(board);
      ModelAndView mav=new ModelAndView("redirect:/client/board/list");
      return mav;
      }

   @ExceptionHandler(AccountNotFoundException.class)
   public ModelAndView handleException(AccountNotFoundException e) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("client/error/errorpage");
      mav.addObject("err", e);

      return mav;

   }

   @ExceptionHandler(RegistFailException.class)
   public String registException(RegistFailException e) {
      StringBuffer sb=new StringBuffer();
      sb.append("{");
      sb.append("\"result\":0");
      sb.append("}");
      return sb.toString();
   }
   @ExceptionHandler(EditFailException.class)
   public String editException(EditFailException e) {
	   return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
   }
   @ExceptionHandler(DeleteFailException.class)
   public String deleteException(DeleteFailException e) {
	   return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
   }
}

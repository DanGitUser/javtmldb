package controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.member.Register;
import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;
import util.AlertUtil;

@WebServlet("/board/write")
@Slf4j
public class Write extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    Criteria cri = Criteria.init(req);
		if(req.getSession().getAttribute("member") == null) {
			AlertUtil.alert("Please Login first", "/member/login?" + cri.getQs2(),  req, resp, true);
			return;
		}
		req.setAttribute("cri", cri);
		req.getRequestDispatcher("/WEB-INF/views/board/write.jsp").forward(req, resp);	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Session check
	    Criteria cri = Criteria.init(req);
        if(req.getSession().getAttribute("member") == null) {
            AlertUtil.alert("Please Login first", "/member/login?" + cri.getQs2(),  req, resp, true);
            return;
        }
		
		// Get Parameter
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String id = req.getParameter("id");
		Integer cno = Integer.valueOf(req.getParameter("cno"));
		
		// Board Instance Creation
		Board board = Board.builder().title(title).content(content).id(id).cno(cno).build();
		log.info("{}", board);
		
		// Service
		new BoardService().write(board);
		
		//Redirecton
		AlertUtil.alert("Posted Successfully", "/board/list?cno=" + cri.getQs() + "&amount=" + cri.getAmount() , req, resp);
		
	}

	
}

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

@WebServlet("/board/modify")
@Slf4j
public class Modify extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Criteria cri = Criteria.init(req);
        
        if (req.getParameter("bno") == null) {
            AlertUtil.alert("Please Login first", "/board/list", req, resp);
            return;
        }
        Long bno = Long.valueOf(req.getParameter("bno"));
        
        if (req.getSession().getAttribute("member") == null) {
            AlertUtil.alert("Please Login first", "/member/login?bno=" + bno + "&" + cri.getQs2(), req, resp, true);
            return;
        }

        BoardService service = new BoardService();
        Board board = service.findByNo(Long.parseLong(req.getParameter("bno")));
        req.setAttribute("cri", cri);
        req.setAttribute("board", board);
        req.getRequestDispatcher("/WEB-INF/views/board/modify.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Session check
        Criteria cri = Criteria.init(req);
        if (req.getSession().getAttribute("member") == null) {
            AlertUtil.alert("Please Login first", "/member/login?" + cri.getQs2(), req, resp, true);
            return;
        }

        // Get Parameter
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String id = req.getParameter("id");
        Integer cno = Integer.valueOf(req.getParameter("cno"));
        Long bno = Long.valueOf(req.getParameter("bno"));

        // Board Instance Creation
        Board board = Board.builder().title(title).content(content).id(id).cno(cno).bno(bno).build();
        log.info("{}", board);

        // Service
        new BoardService().modfiy(board);

        // Redirecton
        AlertUtil.alert("Modified Successfully", "/board/view?bno=" + bno + "&" + cri.getQs2(), req, resp);

    }

}

package controller.member;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import service.MemberService;
import util.HikariCPUtil;

@WebServlet("/member/login")
@Slf4j
public class Login extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
//		log.info("{}", HikariCPUtil.getDataSource());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		log.info("{} {}", id, pw);
		
		boolean ret = new MemberService().login(id, pw);
		log.info("{}=", ret);
		
		if (ret) {
	    	HttpSession session = req.getSession();
	    	session.setMaxInactiveInterval(60 * 10);
	    	session.setAttribute("member", new MemberService().findById(id));
	    	
	    	String url = req.getParameter("url");
	    	if(url == null ) {	    		
	    		resp.sendRedirect(req.getContextPath() + "/index");
	    	} else {
	    		resp.sendRedirect(URLDecoder.decode(url, "utf-8"));
	    	}
	    } else {
			resp.sendRedirect("login?msg=LoginFailed");
	    }
	}
	
}

package chapt01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = {"/SecondServlet", "/Servlet2"})
public class SecondServlet extends HttpServlet {
	
	// text/html, text/plain, text/xml, application/json
	// image/png
	// mime-type
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// vanilla response state text/plain
		resp.setContentType("text/html; charset=euc-kr");
		PrintWriter out = resp.getWriter();
		out.write("this kinda works");
		System.out.println("System Console Message");
		out.println("<h1>화면에 출력 abcde</h1>");
	}
	
	

}

package crud;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			HttpServletRequest hr = (HttpServletRequest) request;
			HttpSession hs = hr.getSession();
			HttpServletResponse resp = (HttpServletResponse) response;
			PrintWriter out = response.getWriter();
			response.setContentType("html/text");
			String user = request.getParameter("user");
			String password = request.getParameter("password");
			JDBC J = new JDBC();
			ArrayList<user> au =J.fcon();
			Random random = new Random();
	        int upperBound = 100;
	        int randomInt = random.nextInt(upperBound);
	        System.out.println("hello");
			if (password != null) {
				for (user u : au) {
					if (user.equals(u.getUser()) && password.equals(u.getPass())) {
						System.out.println("helooo");
						resp.setHeader("user", user);
				        resp.setHeader("key", randomInt+"");
				        J.fconn(randomInt+"",user);
						hs.setAttribute("aunthen", "true");
						//String res = (String) hs.getAttribute("aunthen");
						System.out.println("jjkj");
						RequestDispatcher rd = request.getRequestDispatcher("crud.jsp");
					rd.forward(request, response);
					}
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}
}

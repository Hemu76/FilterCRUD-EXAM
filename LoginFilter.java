package crud;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/EmployeeServlet")
public class LoginFilter extends HttpFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			String s = "" + request.getAttribute("aunthen");
			if (s != null) {
				System.out.println("broooo");
				HttpServletRequest hr = (HttpServletRequest) request;
				HttpSession hs = hr.getSession();
				HttpServletResponse resp = (HttpServletResponse) response;
				JDBC J = new JDBC();
				String kk = hr.getHeader("key");
				String uu = hr.getHeader("user");
				System.out.println(kk + " " + uu);
				String res = (String) hs.getAttribute("aunthen");
				String userr = J.fconnn(uu);
				if (res != null) {
					if (kk.equals(userr)) {
						chain.doFilter(request, response);
					}
				} else {
					resp.sendRedirect("login.html");
				}
			}
		} catch (Exception e) {
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phone+" "+password+" "+check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			us.setPhone(phone);
			
			
			HttpSession session = req.getSession();
			
			if(check!=null) {

				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f2=dao.checkUser(email);
				if(f2) {
					boolean f=dao.userRegister(us);
					if(f) {
						session.setAttribute("sucMsg", "Registered successfully");
						resp.sendRedirect("register.jsp");
					}else {
						session.setAttribute("failedMsg", "Something wrong on server");
						resp.sendRedirect("register.jsp");
					}
				}else {
					session.setAttribute("failedMsg", "User already exist try with another Email");
					resp.sendRedirect("register.jsp");
				}
			}else {
				//System.out.println("check terma and conditions");
				session.setAttribute("failedMsg", "Check agree terms and conditions");
				resp.sendRedirect("register.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

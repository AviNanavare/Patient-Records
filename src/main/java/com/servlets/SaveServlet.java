package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Patient;
import com.helper.FactoryProvider;

public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				
				String name = request.getParameter("name"); 
				String address = request.getParameter("address");
				String email = request.getParameter("email");
				String phoneNumber = request.getParameter("phoneNumber");
				String password = request.getParameter("password");
				
				Patient patient = new Patient(name, address, email, phoneNumber, password);
				
				Session session = FactoryProvider.getFactory().openSession();
				Transaction tx = session.beginTransaction();
				session.save(patient);
				tx.commit();
				session.close();
				
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<h1 style='text-align:center;'>Patient-Details is Added</h1>"
						+ "<br>"
						+ "<h1 style='text-align:center;' ><a href='view.jsp'>View ALL-Patient Details</a></h1>");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

}

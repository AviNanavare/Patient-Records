package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Patient;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String name = request.getParameter("name"); 
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String phoneNumber = request.getParameter("phoneNumber");
			String password = request.getParameter("password");
			int id = Integer.parseInt(request.getParameter("id").trim());
			
			Session session4 = FactoryProvider.getFactory().openSession();
			Transaction tx = session4.beginTransaction();
			
			Patient n = session4.get(Patient.class, id);
			n.setName(name);
			n.setAddress(address);
			n.setEmail(email);
			n.setPassword(password);
			n.setPhoneNumber(phoneNumber);
			n.setPassword(password);
			
			tx.commit();
			session4.close();
			response.sendRedirect("view.jsp");
			
		} catch (Exception e) {
				e.printStackTrace();
		}
	}

}

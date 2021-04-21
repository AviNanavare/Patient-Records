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

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	try {
		 		
		 		int id = Integer.parseInt(request.getParameter("id").trim());
		 		Session session2 = FactoryProvider.getFactory().openSession();
		 		Transaction tx = session2.beginTransaction();
		 		Patient n = (Patient) session2.get(Patient.class, id);
		 		session2.delete(n);
		 		tx.commit();
		 		session2.close();
		 		response.sendRedirect("view.jsp");
		 		
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}

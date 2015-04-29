package com.dts.core.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GetProjectList extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//
//		// System.out.println("Request");
//
//		String str = request.getParameter("search");
//
//		Session session = HibernateSessionFactory.getSession();
//
//		Criteria criteria = session.createCriteria(Pojectlist.class);
//
//		Criterion criterion = Restrictions.like("ptitle", str + "%");
//
//		criteria.add(criterion);
//
//		List list = criteria.list();
//
//		// System.out.println(list);
//
//		// System.out.println(list.size());
//
//		PrintWriter writer = response.getWriter();
//
//		Iterator<Pojectlist> iterator = list.iterator();
//
//		writer.print("ul");
//
//		while (iterator.hasNext()) {
//
//			Pojectlist pojectlist = (Pojectlist) iterator.next();
//
//			writer.print("<li>" + pojectlist.getPtitle() + "</li");
//
//			System.out.println(pojectlist.getPtitle());
//
//		}
//
//		writer.print("/ul");
//
//		writer.close();
		
		String str = request.getParameter("searchitem");

		try {
			System.out.println("this is project List"+str);

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection connection=DriverManager.getConnection("jdbc:odbc:crsm");

		
			String sql = "select taggingname from taggingsystem where taggingname like '" + str 
					+ "%'  ORDER  by rank desc";

			Statement statement = connection.createStatement();

			ResultSet rs = statement.executeQuery(sql);

			PrintWriter out = response.getWriter();

			out.print("<ul>");

			while (rs.next()) {

				out.print("<li>" + rs.getString(1) + "</li>");
				

			}

			out.print("</ul>");


			out.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

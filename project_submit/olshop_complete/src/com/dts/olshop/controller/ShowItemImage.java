package com.dts.olshop.controller;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dts.olshop.dao.ItemDAO;
import com.dts.olshop.model.Item;



/**
 * Servlet implementation class DisplayImage
 */
@WebServlet("/showitemimage.do")

public class ShowItemImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("itemid");
		//System.out.println("Image id of size = "+id);
		//byte[] imgdata;
		
		ItemDAO idao=new ItemDAO();
		//Item i=idao.getItemImage(id);
		
		byte[] i1=idao.getItemImage(id);
		       //System.out.println("Image size = "+i1.length);
		        response.setContentType("image/gif");
		              OutputStream o = response.getOutputStream();
		              o.write(i1);
		              o.flush();
		              o.close();
		              
		              
	}

}







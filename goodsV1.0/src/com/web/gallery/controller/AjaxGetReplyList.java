package com.web.gallery.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.web.gallery.model.service.GalleryService;
import com.web.gallery.model.vo.Reply;

/**
 * Servlet implementation class AjaxGetReplyList
 */
@WebServlet("/gallery/getReplyList")
public class AjaxGetReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxGetReplyList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		List<Reply> list = new GalleryService().getReplyList(gNo);
		
//		JSONArray jsonArr = new JSONArray();
//		for(Reply r : list) {
//			JSONObject obj = new JSONObject();
//			obj.put("writer", r.getmNickname());
//			obj.put("writeDate", r.getrDate());
//			obj.put("content", r.getrContent());
//			jsonArr.add(obj);
//		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

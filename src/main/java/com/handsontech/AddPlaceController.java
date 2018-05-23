package com.handsontech;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.handsontech.service.DataDao;

@Controller
public class AddPlaceController {

	@RequestMapping("/LoadContinent")
	public void add(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json");
        try {
                String term = request.getParameter("val");
                System.out.println("Data from ajax call" + term);

                DataDao dataDao = new DataDao();
                ArrayList<String> list = dataDao.getFrameWork(term);

                String searchList = new Gson().toJson(list);
                response.getWriter().write(searchList);
        } catch (Exception e) {
                System.err.println(e.getMessage());
        }

	}
	
	@RequestMapping("/LoadCountry")
	public void addCountry(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json");
		System.out.println("Data from Country call");
        try {
                String term = request.getParameter("val");
                System.out.println("Data from Country call" + term);

                DataDao dataDao = new DataDao();
                ArrayList<String> list = dataDao.getCountryWork(term);

                String searchList = new Gson().toJson(list);
                response.getWriter().write(searchList);
        } catch (Exception e) {
                System.err.println(e.getMessage());
        }
	}
	
	@RequestMapping("/LoadState")
	public void addState(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json");
		System.out.println("Data from State call");
        try {
                String term = request.getParameter("val");
                System.out.println("Data from State call" + term);

                DataDao dataDao = new DataDao();
                ArrayList<String> list = dataDao.getStateWork(term);

                String searchList = new Gson().toJson(list);
                response.getWriter().write(searchList);
        } catch (Exception e) {
                System.err.println(e.getMessage());
        }
	}
	
	
	@RequestMapping("/LoadCity")
	public void addCity(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json");
		System.out.println("Data from City call");
        try {
                String term = request.getParameter("val");
                System.out.println("Data from City call" + term);

                DataDao dataDao = new DataDao();
                ArrayList<String> list = dataDao.getCityWork(term);

                String searchList = new Gson().toJson(list);
                response.getWriter().write(searchList);
        } catch (Exception e) {
                System.err.println(e.getMessage());
        }
	}

}

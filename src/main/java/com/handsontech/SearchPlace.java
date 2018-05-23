package com.handsontech;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.handsontech.model.AddPlace;
import com.handsontech.model.SearchPlaceModel;
import com.handsontech.model.SearchPlaceModel.Pair;

@Controller
public class SearchPlace {
	@RequestMapping(value = "/SearchIndex", method = RequestMethod.POST)
	public void searchPlace(HttpServletRequest request, HttpServletResponse response) {
		String input = request.getParameter("val");
		HttpSession session = request.getSession(false);
		SearchPlaceModel sp = new SearchPlaceModel();
		ArrayList<Pair> map = sp.getAllCities(input);
		ArrayList<String> arl = new ArrayList<String>();
		for (Pair pair : map) {
			arl.add(pair.CityName);
		}
		try {
			String searchList = new Gson().toJson(arl);
			response.getWriter().write(searchList);
			System.out.println("ll : "+searchList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/Search", method = RequestMethod.POST)
	public ModelAndView searchPlacePage(HttpServletRequest request, HttpServletResponse response) {
		String input = request.getParameter("valName");
		HttpSession session = request.getSession(false);
		AddPlace place = new AddPlace();
		int PID = place.getPlaceDetails(input);
		ModelAndView view = new ModelAndView();
		view.setViewName("Place");
		view.addObject("PlaceIdentification", String.valueOf(PID));
		System.out.println("ID : " + PID);
		return view;
	}
	
	
	
}

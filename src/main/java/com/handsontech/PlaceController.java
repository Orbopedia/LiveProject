package com.handsontech;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.handsontech.model.UserModel;

@Controller
public class PlaceController {
	
	@RequestMapping("/Place/{jid}")
	public ModelAndView Place(@PathVariable String jid, HttpServletRequest request){
		HttpSession session = request.getSession(false);
		ModelAndView mv = new ModelAndView();
		UserModel bean = new UserModel();
		int UID = 0;
		try {
			if((Integer.parseInt(session.getAttribute("UID").toString())) == 0) {
				UID = -1;
			}else {
				UID = Integer.parseInt(session.getAttribute("UID").toString());
				mv.addObject("UserBeanObject", bean.setAllValues(UID));
			}
		}catch(Exception e) {
			
		}
		mv.setViewName("Place");
		mv.addObject("PlaceIdentification", jid);
		return mv;
	}
}

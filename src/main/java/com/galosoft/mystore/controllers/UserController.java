package com.galosoft.mystore.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.galosoft.mystore.dao.UserDao;
import com.galosoft.mystore.model.User;
import com.galosoft.mystore.services.SecurityService;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SecurityService securityService;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@RequestMapping("/showReg")
	public String showRegistrationPage() {
		return "login/registerUser";
	}
	
	@RequestMapping("/login")
	public String loginPage() {
		return "login/login";
	}
	
	@RequestMapping(value="/registerUser", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user) {
		user.setPassword(encoder.encode(user.getPassword()));
		userDao.save(user);
		return "login/registerSuccess";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(@RequestParam("email") String email, @RequestParam("password") String password, ModelMap modelMap) {
		
		boolean loginResponse = securityService.login(email, password);
		
		if(loginResponse) {
			return "admin";
		} else {
			modelMap.addAttribute("msg", "Incorrect user and password");
			return "login/login";
		}
		
	}
}

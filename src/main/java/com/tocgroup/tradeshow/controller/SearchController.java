package com.tocgroup.tradeshow.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tocgroup.tradeshow.service.VendorService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {

	@Autowired
	VendorService vendorService;
	private static final Logger logger = LoggerFactory
			.getLogger(SearchController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public @ResponseBody String home(Model model, @RequestParam("q") String q) {
		String name = "{\"first_name\": \"James\",\"last_name\": \"Butler\",\"profile_url\": \"/users/78749\"}";
		String response = "[" + name + "," + name + "," + name + "," + name
				+ "," + name + "," + name + "]";
		logger.info("-- > Search controller is called -- > " + response);

		model.addAttribute("message", "Search is coming soon !.");

		return response;
	}
}

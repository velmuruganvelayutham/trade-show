package com.tocgroup.tradeshow.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {

	private static final Logger logger = LoggerFactory
			.getLogger(SearchController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public @ResponseBody String home(Model model, @RequestParam("q") String q) {
		logger.info("-- > Search controller is called -- > ");

		model.addAttribute("message", "Search is coming soon !.");

		return "[{\"first_name\": \"James\",\"last_name\": \"Butler\",\"profile_url\": \"/users/78749\" }]";
	}

}

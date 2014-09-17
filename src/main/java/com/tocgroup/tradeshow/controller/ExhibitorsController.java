package com.tocgroup.tradeshow.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tocgroup.tradeshow.model.Vendor;
import com.tocgroup.tradeshow.service.VendorService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExhibitorsController {

	@Autowired
	VendorService vendorService;
	private static final Logger logger = LoggerFactory
			.getLogger(ExhibitorsController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/exhibitors", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("message", "Exhibitors list are coming soon !.");

		Vendor vendor = new Vendor();
		vendor.setShowName("show name");
		vendor.setBoothNo("12345");
		vendor.setVendorName("vendor name");
		vendorService.create(vendor);

		return "exhibitors.";
	}

}

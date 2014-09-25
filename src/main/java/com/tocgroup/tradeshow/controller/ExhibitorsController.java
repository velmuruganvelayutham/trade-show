package com.tocgroup.tradeshow.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.CsvToBean;
import au.com.bytecode.opencsv.bean.HeaderColumnNameTranslateMappingStrategy;

import com.tocgroup.tradeshow.dao.Page;
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
	public String list(Locale locale, Model model,
			@RequestParam(value = "page", defaultValue = "1") int pageNo,
			@RequestParam(value = "size", defaultValue = "10") int size) {

		logger.info("Exibitors list is called ", locale);
		Page page = new Page(pageNo, size);
		Long count = vendorService.count();
		if (count != null && count != 0)
			page.setTotalNoOfPages(count / size);
		List<Vendor> allVendors = vendorService.findAll(page);
		model.addAttribute("vendors", allVendors);
		int current = page.getPageNo();
		int begin = Math.max(1, current - 5);
		int end = Math.min(begin + 10, page.getTotalNoOfPages() == null ? 0
				: page.getTotalNoOfPages().intValue());

		model.addAttribute("page", page);
		model.addAttribute("beginIndex", begin);
		model.addAttribute("endIndex", end);
		model.addAttribute("currentIndex", current);
		return "exhibitors.";
	}

	@RequestMapping(value = "/import", method = RequestMethod.GET)
	public String importCSV(Locale locale, Model model) {

		logger.info("ImportCSV  is called ", locale);
		model.addAttribute("message", "Exhibitors list are coming soon !.");
		return "exhibitors.";

	}

	@RequestMapping(value = "/import/csv", method = RequestMethod.POST)
	public String importCSVPost(Locale locale,
			@RequestParam("file") MultipartFile file) throws IOException {

		logger.info("-- CSV imporing is started --   " + file.getName());
		HeaderColumnNameTranslateMappingStrategy<Vendor> beanStrategy = new HeaderColumnNameTranslateMappingStrategy<Vendor>();
		beanStrategy.setType(Vendor.class);

		Map<String, String> columnMapping = new HashMap<String, String>();
		columnMapping.put("Show", "showName");
		columnMapping.put("Vendor Name", "vendorName");
		columnMapping.put("Booth No", "boothNo");
		columnMapping.put("Phone", "phone");
		columnMapping.put("Address", "address");
		columnMapping.put("Email", "email");
		columnMapping.put("Website", "website");

		beanStrategy.setColumnMapping(columnMapping);

		CsvToBean<Vendor> csvToBean = new CsvToBean<Vendor>();
		InputStreamReader inputStreamReader = new InputStreamReader(
				file.getInputStream());
		CSVReader reader = new CSVReader(inputStreamReader);
		List<Vendor> vendors = csvToBean.parse(beanStrategy, reader);
		for (Vendor vendor : vendors) {
			System.out.println(vendor);
			vendorService.create(vendor);
		}
		logger.info("-- CSV imported completed --   " + file.getName());
		return "exhibitors.";

	}

	@RequestMapping(value = "/export", method = RequestMethod.GET)
	public String exportCSV(Locale locale, Model model) {

		logger.info("Export CSV  is called ", locale);
		model.addAttribute("message", "Exhibitors list are coming soon !.");
		return "exhibitors.";

	}

}

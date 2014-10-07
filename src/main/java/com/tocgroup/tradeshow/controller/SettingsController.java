package com.tocgroup.tradeshow.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.CsvToBean;
import au.com.bytecode.opencsv.bean.HeaderColumnNameTranslateMappingStrategy;

import com.tocgroup.scrap.FallToy14;
import com.tocgroup.tradeshow.model.Settings;
import com.tocgroup.tradeshow.model.Vendor;
import com.tocgroup.tradeshow.service.SettingsService;
import com.tocgroup.tradeshow.service.VendorService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SettingsController {

	private static final Logger logger = LoggerFactory
			.getLogger(SettingsController.class);

	@Autowired
	SettingsService settingsService;
	@Autowired
	VendorService vendorService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		List<Settings> settings = settingsService.findAll();

		model.addAttribute("settings", settings);
		model.addAttribute("message", "Settings  are coming soon !.");

		return "settings.";
	}

	@RequestMapping(value = { "/settings/{action}", "", "" }, method = RequestMethod.POST)
	public @ResponseBody String save(
			@RequestParam MultiValueMap<String, String> map,
			@PathVariable String action) throws FileNotFoundException {
		List<String> urlList = map.get("url");
		String url = "";
		if (null != urlList && urlList.size() > 0)
			url = urlList.get(0);

		if (action.equalsIgnoreCase("add")) {
			Settings settings = new Settings();
			settings.setUrl(url);
			settings.setWebsiteName(url);
			settingsService.create(settings);
		} else if (action.equalsIgnoreCase("edit")) {
			String id = map.get("settings_id").get(0);
			Settings setting = settingsService.find(Long.valueOf(id));
			setting.setUrl(url);
			settingsService.update(setting);
		} else if (action.equalsIgnoreCase("delete")) {
			String id = map.get("id").get(0);
			Settings setting = settingsService.find(Long.valueOf(id));
			settingsService.delete(setting);
		} else {
			File file = new FallToy14().extract();
			logger.info("-- CSV imporing is started --   " + file.getName());
			HeaderColumnNameTranslateMappingStrategy<Vendor> beanStrategy = new HeaderColumnNameTranslateMappingStrategy<Vendor>();
			beanStrategy.setType(Vendor.class);

			Map<String, String> columnMapping = new HashMap<String, String>();
			columnMapping.put("Show", "showName");
			// columnMapping.put("Show Date", "showStartDate");
			columnMapping.put("vendor Name", "vendorName");
			columnMapping.put("Address", "address");
			columnMapping.put("Phone", "phone");
			columnMapping.put("Fax", "fax");
			columnMapping.put("Website", "website");
			columnMapping.put("Booth No", "boothNo");
			// columnMapping.put("Category", "email");
			beanStrategy.setColumnMapping(columnMapping);
			CsvToBean<Vendor> csvToBean = new CsvToBean<Vendor>();
			InputStreamReader inputStreamReader = new InputStreamReader(
					new FileInputStream(file));
			CSVReader reader = new CSVReader(inputStreamReader);
			List<Vendor> vendors = csvToBean.parse(beanStrategy, reader);
			for (Vendor vendor : vendors) {
				System.out.println(vendor);
				vendorService.create(vendor);
			}
			logger.info("-- CSV imported completed --   " + file.getName());
		}
		return "saved successully";

	}

	@RequestMapping(value = "/settings/delete", method = RequestMethod.POST, consumes = {
			"application/json", "application/xml",
			"application/x-www-form-urlencoded" })
	public String delete(@RequestBody String json, Model model) {
		JsonReader jsonReader = Json.createReader(new StringReader(json));
		JsonArray jsonArray = jsonReader.readArray();
		int size = jsonArray.size();
		System.out.println("Json input is " + jsonArray);
		for (int i = 0; i < size; i++) {
			String id = ((JsonObject) jsonArray.get(i)).getString("id");
			Settings setting = settingsService.find(Long.valueOf(id));
			settingsService.delete(setting);
			System.out.println("deleted successfully " + id);
		}
		return "exhibitors.";
	}

}

package com.tocgroup.tradeshow.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tocgroup.tradeshow.dao.VendorDao;
import com.tocgroup.tradeshow.model.Vendor;
import com.tocgroup.tradeshow.service.VendorService;

@Service
public class VendorServiceImpl implements VendorService {

	@Autowired
	private VendorDao vendorDao;

	@Override
	public List<Vendor> findAll() {
		List<Vendor> findAll = vendorDao.findAll();
		return findAll;
	}

	@Override
	public Vendor find(Long id) {
		Vendor vendor = vendorDao.findOne(Long.valueOf(id));
		return vendor;
	}

	@Override
	@Transactional
	public void create(Vendor vendor) {
		vendorDao.save(vendor);
	}

	@Override
	public void delete(Vendor vendor) {
		vendorDao.delete(vendor);
	}
}

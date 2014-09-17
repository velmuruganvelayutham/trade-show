package com.tocgroup.tradeshow.service;

import java.util.List;

import com.tocgroup.tradeshow.model.Vendor;

public interface VendorService {

	public List<Vendor> findAll();

	public Vendor find(Long id);

	public void create(Vendor vendor);

	public void delete(Vendor vendor);
}

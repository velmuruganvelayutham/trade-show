package com.tocgroup.tradeshow.dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDao<T extends Serializable> {

	public T findOne(Long id);

	public List<T> findAll();

	public void save(T entity);

	public void update(T entity);

	public void delete(T entity);

}

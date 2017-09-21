package com.chenbingxian.core.base;

import java.io.Serializable;



public interface BaseService<T,PK extends Serializable> {

	/**
	 * 查询所有
	 * @return list集合
	 */
	//public List<T> select();
	
	/**
	 * 分页查询
	 */
	//public Page<T> pageSelect(Page<T> page);
	
	/**
	 * 根据id查询
	 */
	public T selectById(int id);
	
	/**
	 * 新增
	 */
	public int insert(T t);
	
	/**
	 * 修改
	 */
	public int update(T t);
	
	/**
	 * 删除
	 */
	public int delete(int id);
	
	
}

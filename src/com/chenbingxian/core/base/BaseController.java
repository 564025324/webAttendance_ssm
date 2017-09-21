package com.chenbingxian.core.base;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
 

 

public abstract class BaseController<T,PK extends Serializable> {
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @ModelAttribute 注解相当于前置处理
	 * 放在方法上表示所有该类执行方法之前先执行该注解的方法
	 */
	@ModelAttribute
	public void init(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		this.request = request;
		this.request.setCharacterEncoding("UTF-8");
		this.response = response;
		this.response.setCharacterEncoding("UTF-8");
	}
	
	/**
	 * 查询
	 */
	public abstract String selectAll();
	 
	/**
	 * 新增修改
	 */
	public abstract String update(T t);
	
	/**
	 * 修改跳转
	 */
	public abstract String insert(T t);
	
	/**
	 * 展示
	 */
	public abstract String selectById(int id);
	
	/**
	 * 删除
	 */
	public abstract String delete(int id);
	
}

	
	
	
	
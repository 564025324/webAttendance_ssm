package com.lijwen.core.query;

import java.util.List;

import net.sf.json.JSONArray;

public  class Json {
 public  static <T> String listToJson(List<T> t){
	 JSONArray sjArray = JSONArray.fromObject(t);
		String str = sjArray.toString();
		return str;
 }
}

package com.savanna.model.dao;

import java.util.List;
import java.util.Map;

public interface SuperDAO<T> {
	int getTotalCount();
	List<T> getPagedList(Map<String, Integer> map);
	int getTotalCount2(String str);
	List<T> getPagedList2(Map<String, Object> map);
}
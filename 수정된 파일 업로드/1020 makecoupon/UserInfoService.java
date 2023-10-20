package com.gamestoreproject.service;

import java.util.ArrayList;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.GamesDao;
@Service
public class UserInfoService {
	@Autowired
	private GamesDao gdao;
	public ArrayList<String> getTypeList(String text,String type) {
		ArrayList<String> typelist = new ArrayList<String>();
		ArrayList<String> typeList = new ArrayList<String>();
		System.out.println(type);
		if(type.equals("title")) {
			typelist = gdao.getTyp(text);	
			for(String types : typelist) { 
					typeList.add(types);
			}			
		} else {
			typelist = gdao.getType(text);						
			for(String types : typelist) {
				String[] ty = types.split(",\s"); 
				for(String t : ty) {
					typeList.add(t);
				}
			}
			HashSet<String> hs = new HashSet<String>(typeList); 
			typeList.clear();
			typeList.addAll(hs);
		}
		return typeList;
	}
}

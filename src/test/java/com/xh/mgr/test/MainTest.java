package com.xh.mgr.test;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

public class MainTest {
	public static void main(String[] args) {
		String s =null;
		String a = (String)s;
		System.out.println(StringUtils.isBlank(a));
	}
	public static void formatTest(){
		DecimalFormat df = new DecimalFormat("#.00000");
		double longitudeF = 121.411;
		double latitudeF = 30.803;
		String key = df.format(longitudeF) + df.format(longitudeF);
		System.out.println(key);
		
	}
	
	public static void splitTest(){
		String s = "F:\\tempfilepath\\20180110\\1515577741795201612\\201611\\照片 (3).jpg";
		System.out.println(StringUtils.split(s, ".")[0]);
	}
	public static void listTest(){
		List<String> list = new ArrayList<String>();
		list.add("1");
		list.add("1");
		list.add("1");
		System.out.println(StringUtils.join(list.toArray(), "','"));
	}
}

package com.atcrowdfunding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.atcrowdfunding.bean.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atcrowdfunding.service.UserService;

@Controller
@RequestMapping("/test")
public class TestController {
	public
	static  Logger logger1 = Logger.getLogger(TestController.class);
	@Autowired
	private UserService userService;
//
	@ResponseBody
	@RequestMapping("/queryAll")
	public Object queryAll() {
		List<User> users = userService.queryAll();
		return users;
	}
//
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/json")
	public Object json() {
		Map map = new HashMap();
		map.put("username", "zhangsan");
		logger1.trace("我是logger1，trace");

		logger1.debug("我是logger1，debug");

		logger1.info("我是logger1，info");

		logger1.warn("我是logger1，warn");

		logger1.error("我是logger1，error");

		logger1.fatal("我是logger1，fatal");
		return map;
	}
}

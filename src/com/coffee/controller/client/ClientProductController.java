package com.coffee.controller.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.coffee.model.domain.Product;
import com.coffee.model.service.ProductService;

@RestController
public class ClientProductController {
	@Autowired
	ProductService pro_service;
	
	@RequestMapping(value="/client/menu/", method=RequestMethod.GET)
	public List getAllMenu() {
		List menuList = pro_service.selectAll();
		return menuList;
	}
	
	@RequestMapping(value="/client/menu/{category_id}", method=RequestMethod.GET)
	public List getCategoryMenu(@PathVariable("category_id") int category_id) {
		System.out.println(category_id);
		List menuList = pro_service.selectByCategory(category_id);
		return menuList;
	}
	
	@RequestMapping(value="/client/point/", method=RequestMethod.GET)
	public List getAllPointMenu() {
		List ptMenuList = pro_service.selectPtAll();
		return ptMenuList;
	}
	@RequestMapping(value="/client/point/{category_id}", method=RequestMethod.GET)
	public List getPtCategoryMenu(@PathVariable("category_id") int category_id) {
		List ptMenuList = pro_service.selectPtByCategory(category_id);
		return ptMenuList;
	}
	@RequestMapping(value="/client/point/getProduct/{product_id}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable("product_id") int product_id) { 
		return pro_service.select(product_id);
	}
}

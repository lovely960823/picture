package mlt.boot.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mlt.boot.entity.Menu;
import mlt.boot.mapper.MenuMapper;
import mlt.boot.result.Result;

@Controller
public class IndexController {

	@Autowired
	MenuMapper menuMapper;
	
	
	//**********************************
	
	//首页轮播图
	@RequestMapping("/")
	public String index(HttpServletRequest request){
		Menu m = menuMapper.findPidById("1");
		String skin="1";
		if(m.getImg().contains("1")){
			skin="1";
		}else if(m.getImg().contains("2")){
			skin="2";
		}else{
			skin="3";
		}
		request.setAttribute("skin", skin);
		request.setAttribute("m", m);
		return "index/index";
	}
	//对应的Ztree数据
	@RequestMapping("/sys/menu")
	@ResponseBody
	public Result<List<Menu>> getAllMenu(String id){
		Result<List<Menu>> result = new Result<List<Menu>>();
		//List<Menu> list = menuMapper.findByParentId(id);
		List<Menu> list = menuMapper.findAll();
		result.setData(list);
		return result;
	}
	
	/**
	 * 要移动位置选择树(加载的数据是除了要移动的节点)
	 * @param id
	 * @return
	 */
	@RequestMapping("/sys/moveTree")
	@ResponseBody
	public Result<List<Menu>> moveTree(String id){
		Result<List<Menu>> result = new Result<List<Menu>>();
		List<Menu> list = menuMapper.findAllmoveTree(id);
		result.setData(list);
		return result;
	}


}

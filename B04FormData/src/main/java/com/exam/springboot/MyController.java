package com.exam.springboot;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {

	@RequestMapping("/")
	public String root() {
		return "home";
	}
	
	@RequestMapping("/model.do")
	public String test1(Model model) {
		model.addAttribute("name","홍길동");
		
		return "model";
	}
	
	@RequestMapping("/mv.do")
	public ModelAndView test2() {
		ModelAndView mv = new ModelAndView();
		
		List<String> lists = new ArrayList<>();
		lists.add("test1");
		lists.add("test2");
		lists.add("test3");
		
		mv.addObject("lists",lists);
		mv.addObject("name", name);
		mv.setViewName("mv");
		
		return mv;
		
	}
}

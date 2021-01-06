package web.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Product;
import web.service.face.HomeService;

@Controller
public class HomesController {

	@Autowired private HomeService homeService;
	
	@RequestMapping(value="/") // url주소
	public String home(Model model) {
		
		List<HashMap<String, Object>> list = homeService.selectProduct();
		
		model.addAttribute("list", list);
	
		return "home/home"; //jsp주소
	}
}

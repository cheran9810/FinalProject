package web.controller;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Comment;
import web.dto.Report;
import web.service.face.RegisterService;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {

	@Autowired
	RegisterService registerService;
	
	@RequestMapping(value = "/insert")
	public String insert(Comment comment, Model model, HttpSession session) {

		comment.setUserid((String) session.getAttribute("id"));
		System.out.println(comment.getUserid());
		registerService.insertComment(comment);
		
		

		return "redirect:/trade/view?regNo=" + comment.getRegNo();
	}

	@RequestMapping(value = "/delete")
	public void delete(Comment comment, Writer writer, Model model) {

		boolean success = registerService.deleteComment(comment);

		try {
			writer.append("{\"success\":" + success + "}");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/report")
	public void report(Report report, Writer writer, HttpSession session) {

//		Comment comment = new Comment();
		report.setUserid((String) session.getAttribute("id"));
		System.out.println(report.getUserid());
		System.out.println("------------------");
		
		boolean result = registerService.report(report);

		int cnt = registerService.getTotalCntReport(report);

		try {
			writer.append("{\"result\": " + result + "}");
		} catch (IOException e) {

			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Comment comment,Model model) {
		System.out.println(comment);
		System.out.println("----------");
		System.out.println(comment.getRegNo());
		System.out.println("------------------");
		model.addAttribute("comment", comment);
		return "trade/commentUpdate";
	}
	
	@RequestMapping(value = "/commentUpdate",method = RequestMethod.POST)
	public String commentUpdate(Comment comment, Model model,HttpSession session) {
		
		 
		comment.setUserid((String) session.getAttribute("id"));
		System.out.println(comment.getUserid());
		registerService.updateComment(comment);
		
		return "redirect:/trade/view?regNo=" + comment.getRegNo();
	}
}

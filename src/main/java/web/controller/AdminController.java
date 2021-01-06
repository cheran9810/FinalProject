package web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Answer;
import web.dto.Comment;
import web.dto.Member;
import web.dto.Product;
import web.dto.Question;
import web.service.face.AdminService;
import web.service.face.MemberService;
import web.util.Paging;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	//메인
	@RequestMapping(value = "interceptor/admin/main")
	public void adminMain() {}
	
	//qa 리스트
	@RequestMapping(value = "/interceptor/admin/QAlist")
	public void adminQAList(Paging curPage, Model model) {
		
		Paging paging = adminService.getQAPaging(curPage);
		model.addAttribute("paging", paging);
		
		List<Map<String, Object>> list = adminService.getQAList(paging);
		model.addAttribute("list", list);
		
	}
	
	//qa 작성
	@RequestMapping(value = "/interceptor/admin/QAwrite")
	public void adminQAWrite(Question question, Model model) {
		
		model.addAttribute("view", question);
	}
	@RequestMapping(value = "/interceptor/admin/QAwrite", method = RequestMethod.POST)
	public String adminQAWriteProcess(Answer answer) {
		System.out.println(answer); //qpk title content
		
		boolean check = adminService.checkWrite(answer);
		
		if(check) {
			adminService.amdinQAWrite(answer);
		}else {
			return "redirect:/interceptor/admin/QAlist";			
		}
		return "redirect:/interceptor/admin/QAlist";
	}
	
	//qa 수정
	@RequestMapping(value="/interceptor/admin/QAupdate")
	public void adminQAUpdate(Answer answer, Model model) {
		Answer view = memberService.memberQADetail(answer);
		
		model.addAttribute("view", view);
	}
	@RequestMapping(value="/interceptor/admin/QAupdate", method = RequestMethod.POST)
	public String amdinQAUpdateProcess(Answer answer) {
		
		adminService.adminQAUpdate(answer);
		
		return "redirect:/interceptor/admin/QAlist";
	}
	
	@RequestMapping(value="/interceptor/admin/QAdelete")
	public String adminQADelete(Answer answer) {
		adminService.adminQADelete(answer);
		
		return "redirect:/interceptor/admin/QAlist";
	}
	
	@RequestMapping(value="/interceptor/admin/boardreport")
	public void adminBoardReportList(Paging curPage, Model model) {
		Paging paging= adminService.boardReportPaging(curPage);
		model.addAttribute("paging", paging);
		
		List<Map<String,Object>> list = adminService.getBoardReportList(paging);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/interceptor/admin/commentreport")
	public void adminCommentReportList(Paging curPage, Model model) {
		
		Paging paging= adminService.commentReportPaging(curPage);
		model.addAttribute("paging", paging);
		
		List<Map<String, Object>> list = adminService.getcommentReportList(paging);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/interceptor/admin/commentdelete")
	public String adminCommentDelete(Comment comment) {
		adminService.reportCommentDelete(comment);
		
		return "redirect:/interceptor/admin/commentreport";
	}
	
	@RequestMapping(value="/interceptor/admin/boarddelete")
	public String adminBoardDelete(Product product) {
		adminService.reportBoardDelete(product);
		
		return "redirect:/interceptor/admin/boardreport";
	}
	

	@RequestMapping(value="/interceptor/admin/memberdelete")
	public void memberDelete(Member member, Model model) {
		System.out.println("탈퇴 과정1");
		model.addAttribute("member", member);
	}
	
	@RequestMapping(value="/interceptor/admin/memberdelete", method = RequestMethod.POST)
	public void memberDeleteProcess(Member member, String check) {
		System.out.println("탈퇴 과정2");
		System.out.println(member);
		System.out.println(check);
		String check1 = "탈퇴 완료";
		
		if(check1.equals(check)) {
			
		adminService.memberDelete(member);
		
		}
	}
}
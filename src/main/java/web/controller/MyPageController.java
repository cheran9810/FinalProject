package web.controller;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.service.face.MyPageService;
import web.util.Paging;


@Controller
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired private MyPageService myPageService;

	@RequestMapping(value = "/mypage/mypage",  method=RequestMethod.GET)
	public void mypage(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("id");
		
		//개인정보 조회
		Map<String, Object> userdata =  new HashMap<>(); 
		userdata = myPageService.getData(id);
		model.addAttribute("userdata", userdata);
		
	}
	
	@RequestMapping(value = "/mypage/mypage",  method=RequestMethod.POST)
	public String mypageProc(HttpSession session, Member member) {
		
		myPageService.editdata(session, member);
		
		return "redirect:/mypage/mypage";
	}
	
	@RequestMapping(value = "/mypage/mypost", method = RequestMethod.GET)
	public void myReg(HttpSession session, Model model, Paging curPage) {

		curPage.setUser_email((String) session.getAttribute("id")); 
		//페이징 계산
		Paging paging = myPageService.getPaging(curPage);
		paging.setSearch(curPage.getSearch());
		paging.setUser_email((String) session.getAttribute("id"));
		
		model.addAttribute("myRegpaging", paging);
			
		//내가 쓴 게시글 조회
		List<Map<String, Object>> regList = myPageService.myRegList(paging);
		
		model.addAttribute("regList", regList);
	}
		
	
	@RequestMapping(value = "/mypage/mypost", method = RequestMethod.POST)
	public String myRegProc(HttpServletRequest req) {
		
		String[] postArr = req.getParameterValues("checkbox");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("postArr", postArr);
		
		if(postArr != null) {
			myPageService.deleteMyPost(map);
		}
		
		
		return "redirect:/mypage/mypost";
	}
	
	@RequestMapping(value = "/mypage/mycomment", method = RequestMethod.GET)
	public void myCmt(HttpSession session, Model model, Paging curPage){
		
		curPage.setUser_email((String) session.getAttribute("id")); 
		//페이징 계산 
		Paging paging = myPageService.getPagingCmt(curPage);
		paging.setSearch(curPage.getSearch());
		paging.setUser_email((String) session.getAttribute("id"));
		System.out.println("확인 ---------------------");
		System.out.println(paging);
		model.addAttribute("paging", paging);
		
		//내가 쓴 댓글 조회
		List<Map<String, Object>> commentList = myPageService.myCommentList(paging);
		model.addAttribute("commentList", commentList);
		
	}
	
	@RequestMapping(value = "/mypage/mycomment", method = RequestMethod.POST)
	public String myCmtProc(HttpServletRequest req){
	
		String[] postArr = req.getParameterValues("checkbox");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("postArr", postArr);
		if(postArr != null) {
			myPageService.deleteMyCmt(map);			
		}
		
		return "redirect:/mypage/mycomment";
	
}
	@RequestMapping(value= "/mypage/myscrap", method = RequestMethod.GET)
	public void myScrap(HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");
		
		//개인정보 조회
		List<Map<String, Object>> userscrap = myPageService.getScrap(id);
		model.addAttribute("userscrap", userscrap);
	}
	
	@RequestMapping(value= "/mypage/myscrap", method = RequestMethod.POST)
	public String myScrapProc(HttpServletRequest req) {
		
		String[] postArr = req.getParameterValues("checkbox");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("postArr", postArr);
		
		if(postArr != null) {
			myPageService.deleteMyScrap(map);
		}
		
		
		return "redirect:/mypage/myscrap";
	}
 
}














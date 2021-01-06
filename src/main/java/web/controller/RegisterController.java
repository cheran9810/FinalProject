package web.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import file.dto.Filetest;
import file.service.face.FileService;
import web.dto.Comment;
import web.dto.Member;
import web.dto.Product;
import web.dto.Recommend;
import web.dto.ReportBoard;
import web.service.face.RegisterService;
import web.util.Paging;

@Controller
@RequestMapping(value = "/trade")
public class RegisterController {

	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	@Autowired
	FileService fileService;
	@Autowired
	RegisterService registerService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public void home() {

	}
	@RequestMapping(value = "/list")
	public void list(@RequestParam(value = "location", required = false) List<String> location,
			@RequestParam(value = "category", required = false) List<String> category,
			@RequestParam(value = "search", required = false) String search,
			@RequestParam(value = "price", required = false) String price, 
			Paging curPage, Model model, HttpSession session, Member member) {

		// 페이징 계산
		Paging paging = registerService.getPaging(curPage);
		paging.setSearch(curPage.getSearch());
		model.addAttribute("paging", paging);
		
		
		member.setId((String) session.getAttribute("id"));
		
		member.setDong((String)session.getAttribute("dong"));
		
		System.out.println(location);
		String dong = "";
		
		if(location == null) {
		Member searchDong = registerService.searchDong(member);
		System.out.println("동 확인 : " +searchDong.getDong());
		
		dong = searchDong.getDong();
		}
		List<Product> list = registerService.list(location, category, search, price, paging, dong);
		model.addAttribute("list", list);
		
		System.out.println("paging.getStartNo : " + paging.getStartNo());
		System.out.println("paging.getEndNo : " + paging.getEndNo());
		// 
	}
	/*
	 * // 게시글 목록
	 * 
	 * @RequestMapping(value = "/list") public void list(@RequestParam(value =
	 * "location", required = false) List<String> location,
	 * 
	 * @RequestParam(value = "category", required = false) List<String> category,
	 * 
	 * @RequestParam(value = "search", required = false) String search,
	 * 
	 * @RequestParam(value = "price", required = false) String price, Paging
	 * curPage, Model model) {
	 * 
	 * // 페이징 계산 Paging paging = registerService.getPaging(curPage);
	 * paging.setSearch(curPage.getSearch()); model.addAttribute("paging", paging);
	 * 
	 * // 게시글 목록 List<Product> list = registerService.list(location, category,
	 * search, price, paging); model.addAttribute("list", list);
	 * 
	 * System.out.println("paging.getStartNo : " + paging.getStartNo());
	 * System.out.println("paging.getEndNo : " + paging.getEndNo());
	 * 
	 * }
	 */

	// 게시글 작성
	@RequestMapping(value = "/resister", method = RequestMethod.GET)
	public void register() {

	}

	@RequestMapping(value = "/resister", method = RequestMethod.POST)
	public String fileup(@RequestParam("file") List<MultipartFile> fileList, Product product, HttpSession session,
			@RequestParam("dong") String dong) {

		System.out.println("dong 잘 들어갔니 : " + dong);
		// 다른 것들 업로드..
		System.out.println(product);
		// 시 군구 합치는 작업
		product.setLocation(product.getSi() + " " + product.getGu() + " " + dong);

		// 유저 이메일..임시로 세션이없어서 집어넣음
		product.setUserEmail((String) session.getAttribute("id"));

		// price 컴마떼기
		int priceInt = product.getPrice();
		String price = Integer.toString(priceInt);

		price = price.replaceAll(",", "");

		int priceString = Integer.parseInt(price);
		product.setPrice(priceString);

		// 날짜 형식 바꾸끼
		Date today = new Date();

		Date sqlDate = new Date(today.getTime());
		product.setRegDate(sqlDate);
		System.out.println(sqlDate);

		System.out.println("------------------");
		System.out.println(product.getTradeClass());
		registerService.registContents(product);

		// 파일 업로드.. 여러개올릴수 있음
		try {
			for (int i = 0; i < fileList.size(); i++) {
				MultipartFile fileupload = fileList.get(i);

				logger.info("파일업로드 처리");
				System.out.println("fileupload : " + fileupload);
				logger.info("fileupload : " + fileupload.getOriginalFilename());
				fileService.filesave(fileupload);
				System.out.println(fileupload);

			}

		} catch (Exception e) {
			System.out.println("업로드 할 파일이 존재하지 않습니다");
		}

		return "redirect:/trade/list";

	}

	// 게시글 상세보기
	@RequestMapping(value = "/view")
	public String view(Product viewBoard, Model model, HttpSession session) {

		// 게시글 번호가 1보다 작으면 목록으로 보내기
		if (viewBoard.getRegNo() < 1) {
			return "redirect:/trade/list";
		}

		// 게시글 상세 정보 전달
		viewBoard = registerService.boardView(viewBoard);
		model.addAttribute("view", viewBoard);

		// 이미지 List

		List<Filetest> fileList = registerService.getFileList(viewBoard);
		model.addAttribute("file", fileList);

		// 추천 상태 전달

		Recommend recommend = new Recommend();
		recommend.setRegNo(viewBoard.getRegNo()); // 게시글 번호
		recommend.setUserid((String) session.getAttribute("id")); // 로그인한 아이디

		boolean isRecommend = registerService.isRecommend(recommend);
		model.addAttribute("isRecommend", isRecommend);

		// 신고 상태 전달
		ReportBoard reportBoard = new ReportBoard();
		reportBoard.setRegNo(viewBoard.getRegNo());// 게시글 번호
		reportBoard.setUserid((String) session.getAttribute("id"));// 로그인한 아이디

		boolean isReportBoard = registerService.isReportBoard(reportBoard);
		model.addAttribute("isReportBoard", isReportBoard);

		// 댓글 리스트 전달
		List<Comment> commentList = registerService.getCommentList(viewBoard);
		model.addAttribute("commentList", commentList);

		return "trade/view";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update(Product product, Model model) {

		product = registerService.boardView(product);
		model.addAttribute("view", product);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateProcess(Product product) {
		System.out.println("update 들어오나?");
		registerService.update(product);
		return "redirect:/trade/view?regNo=" + product.getRegNo();
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteProcess(Product product, Model model) {
		registerService.delete(product);
		System.out.println("들어오니???delete");
		return "redirect:/trade/list";
	}

	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public void recommend(Recommend recommend, Writer writer, HttpSession session) {

		System.out.println("recommend는 들어오니???//");
		// 추천 정보 토글
		System.out.println("Test"+recommend);
		
		recommend.setUserid((String) session.getAttribute("id"));
		
		System.out.println("Test"+recommend);
		boolean result = registerService.recommend(recommend);
		
		System.out.println(result);
//		result 값이 왜안뜨지?
		// 추천 수 조회
		int cnt = registerService.getTotalCntRecommend(recommend);

		// 결과 JSON응답
		try {
			writer.append("{\"result\": " + result + ", \"cnt\": " + cnt + "}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/reportBoard")
	public void reportBoard(ReportBoard reportBoard, Writer writer, HttpSession session) {

		reportBoard.setUserid((String) session.getAttribute("id"));
		boolean result = registerService.reportBoard(reportBoard);

		int cnt = registerService.getTotalCntReportBoard(reportBoard);

		try {
			writer.append("{\"result\": " + result + ", \"cnt\": " + cnt + "}");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}

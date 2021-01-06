package web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import web.dto.Answer;
import web.dto.Member;
import web.dto.Question;
import web.kakao.KakaoLogin;
import web.naver.NaverLoginBO;
import web.service.face.MemberService;
import web.util.Paging;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public void join() {
	}

	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	public String joinProcess(Member writer) {
		boolean joinResult = memberService.join(writer);

		if (joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/";

		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/join";

		}

	}

	// 일반 회원 login
	@RequestMapping(value = "/member/weblogin", method = RequestMethod.GET)
	public void login() {
	}

	@RequestMapping(value = "/member/weblogin", method = RequestMethod.POST)
	public String loginProcess(Member writer, HttpSession session, Model model) {

//		System.out.println(writer);
		boolean loginResult = memberService.login(writer);
		
		if(loginResult) {
			Member m = memberService.selectOneMember(writer.getId());
			
			if (writer.getPw().equals(m.getPw()) && !"admin".equals(writer.getId())) {
				session.setAttribute("login", true);
				session.setAttribute("login", m);
				session.setAttribute("id", writer.getId());

				return "redirect:/";
				
			} else if ("admin".equals(writer.getId())) {
				session.setAttribute("login", true);
				session.setAttribute("login", m);
				session.setAttribute("id", writer.getId());

				logger.info("관리자 로그인 성공");
				return "redirect:/";
			}
		}
		
		logger.info("로그인실패");
		return "redirect:/member/login";

	}

	// SNS 로그인
	@RequestMapping(value = "/member/login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberLogin(ModelAndView mav, HttpSession session) {

		// 네이버
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		mav.addObject("naverUrl", naverAuthUrl);
		logger.info("naverUrl = {}", naverAuthUrl);
		// 카카오
		String kakaoUrl = KakaoLogin.getAuthorizationUrl(session);
		mav.addObject("kakaoUrl", kakaoUrl);
		logger.info("kakaoUrl = {}", kakaoUrl);

		mav.setViewName("member/login");

		return mav;
	}

	// naverLogin 성공시
	@RequestMapping(value = "/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException, java.text.ParseException {
		logger.info("callback 호출 확인");

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAcessToken(session, code, state);
		logger.info("oauthToken = {}", oauthToken);

		apiResult = naverLoginBO.getUserProfile(oauthToken);

		// JSON -> 객체를 문자열로 변환

		// 네이버에서 불러온값 형변환 해야함
		JSONParser parser = new JSONParser(); // JSONParser -> Json문자열을 object로 변환해주는 객체
		Object obj = parser.parse(apiResult); // 네이버에서 받아온 객체를 Object로 변환
		JSONObject jsonObj = (JSONObject) obj; // Object를 JSONObject로 형변환

		JSONObject responseOBJ = (JSONObject) jsonObj.get("response"); // JSONObject(jsonObj)를 get("response")해서 회원정보를
																		// JSONObject(responseOBJ)로 꺼냄

		// 자동 회원가입 되게 하기.
		Map<String, Object> map = new HashMap<>();
		map.put("pw", (String) responseOBJ.get("id")); // 네이버에서 주는 유저 식별코드
		map.put("nick", (String) responseOBJ.get("name")); // 네이버에서 주는 유저 이름
		map.put("id", (String) responseOBJ.get("email") + "N"); // 네이버에서 주는 유저 이메일

		// email을 가지고 db가서 회원 정보 가져오기
		Member member = memberService.selectOneMember((String) responseOBJ.get("email") + "N");

		logger.info("테스트 = {}", (String) responseOBJ.get("gender"));
		logger.info("member = {}", member);

		// 회원가입 안되어 있을 경우
		if (member == null || member.getId() == null) {
			logger.info("naverMap = {}", map);
			model.addAttribute("snsMember", map);
			return "member/join"; // join.jsp로 보내서 회원가입 시킴

			// 회원가입 되어 있는 경우
		} else {
			logger.info("map = {}", map);
			session.setAttribute("login", member);
			return "redirect:/"; // 첫화면
		}

	}

	@RequestMapping(value = "/kakao/callback", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String KakaoInfo(Model model, @RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		JsonNode node = KakaoLogin.getAccessToken(code);
		logger.info("node = {}", node);
		// accessToken이 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		// 사용자 정보
		JsonNode userInfo = KakaoLogin.getKakaoUserInfo(accessToken);
		// 확인 하기
		logger.info("userInfo = {}", userInfo);
		// 유저 정보 카카오에 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakaoAccount = userInfo.path("kakao_account");

		logger.info("kakaoEmail = {}", kakaoAccount.path("email").asText());
		// 자동회원가입
		Member member = memberService.selectOneMember(kakaoAccount.path("email").asText() + "K");

		Map<String, Object> map = new HashMap<>();
		map.put("id", kakaoAccount.path("email").asText() + "K");
		map.put("pw", userInfo.path("id").asText());

		logger.info("kakao_account = {}", kakaoAccount);
		logger.info("map = {}", map);

		// 회원가입 안되어 있을 경우
		if (member == null || member.getId() == null) {

			logger.info("kakaoMap = {}", map);
			model.addAttribute("snsMember", map);
			return "member/join"; // join.jsp로 보내서 회원가입 시킴
		} else {

			// 회원가입 되어 있는 경우
			logger.info("map = {}", map);
			session.setAttribute("login", member);
			return "redirect:/"; // 첫화면

		}
	}

//	로그아웃
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/";
	}
	
//관리자 페이지
	@RequestMapping(value = "/interceptor/admin/adminmain")
	public void adminMain() {}
	
	@RequestMapping(value = "/interceptor/admin/fail")
	public void adminFail() {}
	
	// qa 리스트
	@RequestMapping(value = "/member/QAlist")
    public void memberQAList(Paging curPage, Model model, HttpSession session) {
       
		String userEmail = (String)session.getAttribute("id");
		System.out.println("세션 갑 확인 : " + userEmail);
       Paging paging = memberService.getPagingByID(curPage, userEmail);
       model.addAttribute("paging", paging);

       List<Map<String, Object>> list = memberService.myQAList(paging, userEmail);
       model.addAttribute("list", list);
    }
	
	@RequestMapping(value = "/member/QAwrite")
	public void adminQAWrite(Question question, Model model,HttpSession session) {
		question.setUserEmail((String)session.getAttribute("id"));
		System.out.println("세션 값 확인 ");
		System.out.println(question.getUserEmail());
		model.addAttribute("view", question);
	}
	
    @RequestMapping(value = "/member/QAwrite", method = RequestMethod.POST)
    public String memberQAWriteProcess(Question question,HttpSession session) {
       
       question.setUserEmail((String)session.getAttribute("id"));
       
       memberService.QAwrite(question);
       
       return "redirect:/member/QAlist";
    }

    // qa 수정
			@RequestMapping(value = "/member/QAupdate")
			public void memberQAUpdate(Question question, Model model) {

				Question view = memberService.memberQADetail(question);

				model.addAttribute("view", view);
			}

			@RequestMapping(value = "/member/QAupdate", method = RequestMethod.POST)
			public String memberQAUpdateProcess(Question question) {

				memberService.memberQAUpdate(question);

				return "redirect:/member/QAlist";
			}

			// qa 삭제
			@RequestMapping(value = "/member/QAdelete")
			public String memberQADeleteProcess(Question question) {
				System.out.println("삭제동작" + question);
				memberService.memberQADelete(question);

				return "redirect:/member/QAlist";
			}

			// qa view
			@RequestMapping(value = "/member/QAview")
			public void memberQAView(Question question, Answer answer, Model model, HttpSession session) {
//				question.setUserEmail((String)session.getAttribute("id"));
//				System.out.println("상세보기 세션값 확인 : " + question.getUserEmail());
				
				model.addAttribute("id", (String)session.getAttribute("id"));
				
				Question view = memberService.memberQADetail(question);
				model.addAttribute("view", view);
			}
			
			@RequestMapping(value = "/member/QAview1")
			public void memberQAView1(Answer answer, Model model,HttpSession session) {
				model.addAttribute("id", (String)session.getAttribute("id"));
				
				Answer view = memberService.memberQADetail(answer);
				System.out.println(view);
				model.addAttribute("view", view);
			}
	
}

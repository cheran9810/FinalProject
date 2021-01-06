package web.kakao;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoLogin {
	
	private static final Logger logger = LoggerFactory.getLogger(KakaoLogin.class);	
	
	private final static String K_CLIENT_ID = "d245b35bda7d4b497cace4eae5158376"; // restAPI KEY
	private final static String K_REDIRECT_URI = "http://localhost:8088/kakao/callback"; //콜백 주소
	
	public static String getAuthorizationUrl(HttpSession session) {
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
				+ K_REDIRECT_URI + "&response_type=code";
		//값 확인됨
//		log.debug("kakakoUrl= {}",kakaoUrl);
		return kakaoUrl;
	}
	

	public static JsonNode getAccessToken(String authorize_code) {
		
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		final List<NameValuePair> postList = new ArrayList<NameValuePair>();
		postList.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postList.add(new BasicNameValuePair("client_id", "d245b35bda7d4b497cace4eae5158376")); // restAPI KEY
		postList.add(new BasicNameValuePair("redirect_uri", "http://localhost:8088/kakao/callback")); //콜백주소
		
		logger.info("authorize_code = {}", authorize_code);
		//로그인 과정중 얻은 code값		
		postList.add(new BasicNameValuePair("code", authorize_code));
		logger.info("postList = {}", postList);
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		logger.info("client = {}", client);
		logger.info("post = {}", post);
		JsonNode returnNode = null;
		
		try {
			//예외처리 해야함
			post.setEntity(new UrlEncodedFormEntity(postList));
			final HttpResponse response = client.execute(post);
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info("returnNode = {}", returnNode);
		return returnNode;
	}
	
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		logger.info("accessToken={}", accessToken);

		post.addHeader("Authorization", "Bearer " + accessToken);
		JsonNode returnNode = null;
		
		try {
			final HttpResponse response = client.execute(post);
			//JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			logger.info("returnNode = {}", returnNode);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnNode;
	}
}
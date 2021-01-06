package com.devmg.app;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;

import com.devmg.dto.Chat;
import com.devmg.service.ChatService;
import com.devmg.service.ChatServiceImpl;



@Controller 

@ServerEndpoint(value="/echo.do/{myid}/{userid}") 

public class WebSocketChat { 
	
	
	
	
	
	private static final List<Session> sessionList=new ArrayList<Session>();;
	private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class); 
	public WebSocketChat() {
		// TODO Auto-generated constructor stub 
		System.out.println("웹소켓(서버) 객체생성"); 
		} 
	
	@OnOpen
	public void onOpen(Session session){
		logger.info("Open session id:"+session.getId());
		
		
		System.out.println("getRequestParameterMap : "+session.getRequestParameterMap().get("myid"));
		System.out.println("getRequestParameterMap : "+session.getRequestParameterMap().get("userid"));
		String myid = session.getRequestParameterMap().get("myid").toString();
		String userid = session.getRequestParameterMap().get("userid").toString();
		
		session.getUserProperties().put("myid",myid);
		session.getUserProperties().put("userid",userid);
		
		System.out.println("getMessageHandlers : "+session.getUserProperties().get("myid"));
		System.out.println("getMessageHandlers : "+session.getUserProperties().get("userid"));
		System.out.println("getpath : " + session.getRequestURI());
		try { 
			final Basic basic=session.getBasicRemote(); 
//			basic.sendText("대화방에 연결 되었습니다.");
			}catch (Exception e) { 
				// TODO: handle exception 
				System.out.println(e.getMessage()); 
				} 
		sessionList.add(session);
		System.out.println("디버깅 : 세션아이디!!"+WebSocketChat.sessionList.get(0).getId());
				} 

	
	
	
	
	
	
	
	
		/* 
		 * 모든 사용자에게 메시지를 전달한다.
		 * @param self * 
		 * @param sender
		 * @param message 
		 */
		
		/* 상대방 매칭하는 코드 이 메소드에 삽임함 */
		private void sendAllSessionToMessage(Session self, String sender, String message, String nowtime2) { 
			
			ChatService chatservice = new ChatServiceImpl();
			//-----메세지 디비 삽입하는 코드---
			String senderid = self.getUserProperties().get("myid").toString().replaceAll("[\\[\\]]", "");
			String receiverid = self.getUserProperties().get("userid").toString().replaceAll("[\\[\\]]", "");
			
			//타임스탬프생성
			long timestamp = Calendar.getInstance().getTime().getTime();
			String nowtime = new Timestamp(timestamp).toString();
			//텍스트 html코드까지 삽입..
			
		
//			String text="<div class='direct-chat-text'>"+sender+" : "+message+"</div>";
			String text=message;
			Chat chat = new Chat();
			
			
			chat.setSender(senderid);
			chat.setReciever(receiverid);
			chat.setMessage(text);
			chat.setSend_time(nowtime);
			
			
			
			System.out.println("senderid  : " + chat.getSender());
			System.out.println("receiverid  : " + chat.getReciever());
			System.out.println("text  : " + chat.getMessage());
			System.out.println("nowtime : "+ chat.getSend_time());
	
			
			chatservice.InsertMessageService(chat);
			
			
			try {
				for(Session session : WebSocketChat.sessionList) {
					/* 아이디 매칭 */
					//(나의 userid) =받을사람
					String id1 = self.getUserProperties().get("userid").toString();
					//(상대방의 myid)=받을사람
					String id2 = session.getUserProperties().get("myid").toString();
					//내가보낼상대 아이디와 상대방의 아이디가 같다면 메세지를 전송한다
					if((!self.getId().equals(session.getId()))&&id1.equals(id2)) { 
						
						System.out.println("self.getId() : "+self.getId());
						System.out.println("session.getId() : "+session.getId());
						System.out.println("id1 : " + id1);
						System.out.println("id2 : " + id2);
//						session.getBasicRemote().sendText("<div class='direct-chat-text'>"+sender+" : "+message+"</div>");
						session.getBasicRemote().sendText("<div class='direct-chat-msg'>\r\n" + 
								"                    <div class='direct-chat-infos clearfix'>\r\n" + 
								"                      <span class='direct-chat-name float-left'>"
								+sender+"</span>\r\n" + 
								"                      <span class='direct-chat-timestamp float-right'>"+nowtime2+"</span>\r\n" + 
								"                    </div>\r\n" + 
								"                    <!-- /.direct-chat-infos -->\r\n" + 
								"                    <img class='direct-chat-img' src='/resources/dist/img/cherry.png' alt='message user image'>\r\n" + 
								"                    <!-- /.direct-chat-img -->\r\n" + 
								"                    <div class='direct-chat-text'>\r\n" + 
								"                     "
								+message+"\r\n" + "\r\n" + 
								"                    </div>");
						
					
						
						
					}
				} 
			}catch (Exception e) {
					// TODO: handle exception 
					System.out.println(e.getMessage()); 
					}
		} 
		/*  
		 * 내가 입력하는 메세지 
		 *  @param message 
		 *   @param session 
		 */ 
		@OnMessage 
		public void onMessage(String message,Session session) {
			
			/* 컴마로 message에서 sender를 분리하는데, 컴마가 들어간 문장도 분리해버리는 문제 발생하여 수정 */
			String[] first_split=message.split("!@#azo6065745t5");
			String nick=first_split[0];
			message=first_split[1];
			String[] message_split = message.split(",");
			
			String sender="";
			for(int i=0; i<message_split.length;i++) {
				if(i==message_split.length-1)
				{sender=message_split[i];}
			}
			int sender_length=sender.length();
			
			int message_length=message.length();
			System.out.println("sender_length"+sender_length);
			System.out.println("message_length"+message_length);
			message=message.substring(0, message_length-sender_length-1); 
			
//			String sender = message.split(",")[1]; 
//			message = message.split(",")[0]; 
//			System.out.println("디버깅!!message:"+message);
//			System.out.println("디버깅!!sender:"+sender);
			//----------------------------------------------------------
			
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH시mm분");
			
			Date time = new Date();
			String nowtime = format.format(time);
			
			logger.info("Message From "+nick + ": "+message); 
			try { 
				
				///나한테보여지는 메세지
				final Basic basic=session.getBasicRemote(); 
//				basic.sendText("<div class='direct-chat-text'>"+sender+" : "+message+"</div>");
				basic.sendText("<div class='direct-chat-msg right'>\r\n" + 
						"                    <div class='direct-chat-infos clearfix'>\r\n" + 
						"                      <span class='direct-chat-name float-right'>"
						+nick+ "</span>\r\n" + 
						"                      <span class='direct-chat-timestamp float-left'>"+nowtime+"</span>\r\n" + 
						"                    </div>\r\n" + 
						"                    <!-- /.direct-chat-infos -->\r\n" + 
						"                    <img class='direct-chat-img' src='/resources/dist/img/cherry.png' alt='message user image'>\r\n" + 
						"                    <!-- /.direct-chat-img -->\r\n" + 
						"                    <div class='direct-chat-text'>\r\n" + 
						message+"\r\n" + 
						"                    </div>");
				}catch (Exception e) { 
					// TODO: handle exception 
					System.out.println(e.getMessage()); 
				} 
			
				//상대방에게 메세지 보내는  메소드
				sendAllSessionToMessage(session, nick, message,nowtime);
			} 
		@OnError 
		public void onError(Throwable e,Session session) { 
					
		} 
		@OnClose 
		public void onClose(Session session) {
					logger.info("Session "+session.getId()+" has ended");
					sessionList.remove(session); 
		}
}

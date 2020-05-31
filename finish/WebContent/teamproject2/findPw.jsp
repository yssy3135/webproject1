<%@page import="team_dao.P_Member_DAO"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Properties"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String key = "";
	
	P_Member_DAO dao = new P_Member_DAO();

	
	int getMemno = dao.findPw(id, email);

	if(getMemno == -1){
		out.println("일치하는 정보가 없음.");
	}else if(getMemno != -1){
		
		
		
		String host = "smtp.naver.com";
		String user = "ovover2@naver.com";
		String password = "wnsghsla12!";
		
		//메일 받을 주소
		String to_email = email;
		
		//stmp 서버 정보 설정.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "*");
		
		//인증번호 생성기.
		
		StringBuffer temp =new StringBuffer();
                Random rnd = new Random();
                for(int i=0;i<10;i++){
                    int rIndex = rnd.nextInt(3);
                    switch (rIndex) {
                    case 0:
                        // a-z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                        break;
                    case 1:
                        // A-Z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                        break;
                    case 2:
                        // 0-9
                        temp.append((rnd.nextInt(10)));
                        break;
                    }
                }
         String AuthenticationKey = temp.toString();
         //인증번호.
         System.out.println(AuthenticationKey);
         key = AuthenticationKey;
         
          Session session2 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
             protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(user,password);
             }
         });

         
         try {
             MimeMessage msg = new MimeMessage(session2);
             msg.setFrom(new InternetAddress(user, "KH Books"));
             msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
             
             //메일 제목
             msg.setSubject("안녕하세요 KH BOOKS 인증 메일입니다.");
             //메일 내용
             msg.setText("인증 번호는 :"+temp);
             
             Transport.send(msg);
             System.out.println("이메일 전송");
             
         }catch (Exception e) {
             e.printStackTrace();// TODO: handle exception
         }
         HttpSession saveKey = request.getSession();
         saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
         
         
         //패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
         request.setAttribute("id", id);
         //request.getRequestDispatcher("/finId.jsp").forward(request, response);
	}

%>

<%=key%>
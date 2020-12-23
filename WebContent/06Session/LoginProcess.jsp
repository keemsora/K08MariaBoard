<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

//web.xml에 저장된 컨텍스트 초기화 파라미터를 가져옴
String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

//DAO객체생성 및 DB연결
MemberDAO dao = new MemberDAO(drv, url);

//폼값으로 받은 아이디, 패스워드를 통해 로그인 처리 함수 호출
boolean isMember = dao.isMember(id, pw);/*
		해당 함수는 count()를 사용하므로 로그인 시 사용한 아이디,
		패스워드 외의 정보를 얻어올 수 없다.
	*/
if(isMember==true){
	//로그인 성공 시 세션영역에 아래 속성을 저장한다.
	session.setAttribute("USER_ID", id);
	session.setAttribute("USER_PW", pw);
	//로그인 페이지로 이동
	response.sendRedirect("Login.jsp");
}
else{
	//로그인 실패 시 리퀘스트 영역에 속성을 저장 후 로그인 페이지로 포워드한다.
	request.setAttribute("ERROR_MSG", "회원이 아닙니다.");
	request.getRequestDispatcher("Login.jsp").forward(request,response);
}
%>
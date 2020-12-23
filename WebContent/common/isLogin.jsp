<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 파일명 : isLogin.jsp -->
<%
/*
	해당 페이지처럼 JSP코드를 포함한 파일을 include할 때는 지시어를 사용하는 것이 좋다.
	액션태그를 사용하는 경우 먼저 컴파일이 된 후 페이지에 삽입되므로 문제가 될 수 있다.
*/
//글쓰기 페이지 진입 전 로그인되었는지 확인
if(session.getAttribute("USER_ID")==null){
	
	/*
	특정 페이지로 진입할 시 세션이 없는 경우 로그인 페이지로 이동시키게 되는데
	이때 request객체를 통해 현재 진입하고자 하는 페이지의 URI를 얻어온다.
	*/
	String r_uri = request.getRequestURI();
%>
	<script>
		/*
		만약 로그인되지 않았다면 로그인 페이지로 이동시킨다.
		단, 진입하려던 페이지의 URI를 파라미터로 전달한다.
		*/
		alert("로그인 후 이용해 주십시오.");
		location.href="../06Session/Login.jsp?returnURL=<%=r_uri%>";
	</script>
<%	
	/*
	JS코드보다 JSP코드가 우선순위가 높으므로 
	만약 if문 뒤에 JSP코드가 존재하면 위의 JS코드가 실행되지 않는다.
	*/
	return;
}
%>
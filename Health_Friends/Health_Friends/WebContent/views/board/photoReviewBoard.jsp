<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.boardlist{
}
img{
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
<%--
	<%@include file="header.jsp" %>
--%>	

	<section class="boardlist">
		<a href="accompanyBoard.jsp">동행 구해요</a>
		<a href="photoReviewBoard.jsp">후기</a>
		<a href="noticeBoard.jsp">공지사항</a>
	</section>	
	
	<h2>사진후기</h2>
	
	<section id="photoReviewBoard_list">
		<a href="">
			<img alt="" src="">
			<br/>
			임시게이글제목	<br/>
			닉네임
		</a>

	</section>
	
	
<%--	
	<%@include file="footer.jsp" %>
--%>		
</body>
</html>
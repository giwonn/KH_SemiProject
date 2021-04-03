<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.board.biz.BoardBizImpl"%>
<%@page import="com.board.biz.BoardBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function loginChk(){
		alert("로그인 해주세요.");
	}
	
</script>
<style type="text/css">

</style>
</head>
<%
	BoardBiz biz = new BoardBizImpl();
	List<BoardDto> list = biz.notice_selectList();
%>
<body>
<%---
	<%@include file="header.jsp" %>
 --%>	
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="photoReviewBoard.jsp">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	
	<h2>공지사항</h2>
	
	<table border="1">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
			</tr>
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.postNo }</td>
				<td>
					<c:choose>
						<c:when test="${dto.postDelflag eq'Y' }">
							<c:out value="---삭제된 게시글입니다---"></c:out>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${empty session.Ldto}">
									<a href="javascript:loginChk();">${dto.postTitle }</a>
								</c:when>
								<c:otherwise>
									<a href="./notice.do?command=select&postId=${dto.postId }">${dto.postTitle }</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</td>
				<td>회원id넣어야함</td>
				<td>${dto.postRegdate }</td>
			</tr>
		</c:forEach>
	</table>
	<c:choose>
		<c:when test="${not empty session.Ldto }">
	 	<input type="button" value="글작성" onclick="location.href='./notice.do?command=insert'" />
	 	</c:when>
	 </c:choose>
<%---	
	<%@include file="footer.jsp" %>
--%>
</body>
</html>











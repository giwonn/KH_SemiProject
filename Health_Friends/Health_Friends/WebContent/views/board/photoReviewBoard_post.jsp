<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.js"></script>
	<link href="assets/css/commonBoard.css" rel="stylesheet" type="text/css" />
<script
	src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>



<style>
.main img {
	width: 100%;
	height: 2000px;
	vertical-align: middle;
}

.btn01 {
	background: #FF4500;
}

.btn02 {
	background: Tan;
}

html {
	font-size: 10px;
}

ul, li {
	list-style: none;
}

.board_wrap {
	width: 1000px;
	margin: 100px auto;
}

.board_title {
	margin-bottom: 30px;
}

.board_title strong {
	font-size: 3rem;
}

.board_title p {
	margin-yop: 5px;
	font-size: 1.4rem;
}

.bt_wrap {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #FF4500;
	border-radius: 2px;
	font-size: 1.4rem;
}

.bt_wrap a.on {
	background: white;
	color: #FF4500;
	border-radius: 100px
}

.bt_wrap a.off {
	background: #FF4500;
	color: #fff;
	border-radius: 100px;
}

.board_list {
	width: 100%;
	border-top: 2px solid #000;
}

.board_list>div {
	border-bottom: 1px solid #ddd;
	font-size: 0;
}

.board_list>div.top {
	border-bottom: 1px soild #999;
}

.board_list>div:last-child {
	border-bottom: 1px solid #000;
}

.board_list>div>div {
	display: inline-block;
	padding: 15px 0;
	text-align: center;
	font-size: 1.4rem;
}

.board_list>div.top>div {
	font-weight: 600;
}

.board_list .num {
	width: 10%;
}

.board_list .title {
	width: 60%;
	text-align: left;
}

.board_list .top .title {
	text-align: center;
}

.board_list .writer {
	width: 10%;
}

.board_list .date {
	width: 10%;
}

.board_list .count {
	width: 10%;
}

.board_view {
	width: 100%;
	border-top: 2px solid #000;
}

.board_view .title {
	padding: 20px 15px;
	border-bottom: 1px dashed #ddd;
	font-size: 2rem;
}

.board_view .info {
	padding: 15px;
	border-bottom: 1px solid #999;
	font-size: 0;
}

.board_view .info dl {
	position: relative;
	display: inline-block;
	padding: 0 20px;
}

.board_view .info dl:first-child {
	padding-left: 0;
}

.board_view .info dl::before {
	content: "";
	position: absolute;
	top: 1px;
	left: 0;
	display: block;
	width: 1px;
	height: 13px;
	background: #ddd;
}

.board_view .info dl:first-child::before {
	display: none;
}

.board_view .info dl dt, .board_view .info dl dd {
	display: inline-block;
	font-size: 1.4rem;
}

.board_view .info dl dt {
	
}

.board_view .info dl dd {
	margin-left: 10px;
	color: #777;
}

.board_view .cont {
	padding: 15px;
	border-bottom: 1px solid #000;
	line-height: 160%;
	font-size: 1.4rem;
}

[contenteditable=true]:empty:before{
  content: attr(placeholder);
  display: block; /* For Firefox */
}
.title [contenteditable=true] {
  border: 1px solid #ddd;
  color : #333;
  font-size: 12px;
  width: 300px;
  padding: 5px;
}




</style>

</head>
<body>

	<%
		RegistDto Ldto = (RegistDto) session.getAttribute("Ldto");
	%>

	<div class="main01">
		<img
			src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg"
			style="width: 100%; height: auto">
		<div class=text01 style="font-size: 40px; font-weight: bold">게시판
			입니다</div>
		<br>
		<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div>
		<br>
	</div>


	<div class="main02" style="text-align: center">
		<div style="font-size: 40px; font-weight: bold">후기 게시판</div>
		<br>
		<p>소중한 추억을 남겨보세요.</p>
		<br> <a href="  " class="btn btn02">메인 페이지</a> <a
			href="./board.do?command=list  " class="btn btn01">동행 구해요</a> <a
			href="./review.do?command=list  " class="btn btn01">사진 후기</a> <a
			href="./notice.do?command=list " class="btn btn01">공지사항</a>
	</div>

	<div class="board_wrap">
		<section id="">
			<form action="../../review.do" method="post">
				<input type="hidden" name="command" value="insertRes" /> <input
					type="hidden" name="userNo" value="${Ldto.getMember_no() }">


				<div class="board_title">
					<div class="board_view_wrap">
						<div class="board_view">
							<div class="title" name="postTitle" contenteditable="true" placeholder="제목을 입력하세요.">${dto.postTitle }
							</div>
							<div class="info">
								<dl>
									<dt>작성자</dt>
									<dd>${Ldto.member_id }</dd>
								</dl>
							</div>
							<div class="cont" id="editor" name="postContent"
								contenteditable="true"
								style="width: 97%; height: 500px; overflow: auto; width: 97%; height: 500px;">
								${dto.postContent }</div>
							<div class="bt_wrap">
								<a href="" class="off" type="submit">확인</a> <a
									href="./notice.do?command=list" class="off">취소</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>

	</div>



	<section class="boardlist">
		<a href="">동행 구해요</a> <a href="">후기</a> <a href="">공지사항</a>
	</section>

	<section id="">
		<form action="../../review.do" method="post">
			<input type="hidden" name="command" value="insertRes" /> <input
				type="hidden" name="userNo" value="${Ldto.getMember_no() }">
			<table border="1">
				<tr>
					<th colspan="3">사진후기</th>
				</tr>
				<tr>
					<td colspan="3"><input type="text" placeholder="게시글 제목을 적어주세요"
						name="postTitle" /></td>
				</tr>
				<tr>
					<td colspan="3"><textarea id="editor" name="postContent"
							placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="등록" /> <input type="button" value="취소"
				onclick="location.href='../../review.do?command=list'" />
		</form>
	</section>
	<script>
	    ClassicEditor
	        .create( document.querySelector( '#editor' ), {
	        	ckfinder: {
	        		uploadUrl: '../../fileupload.do'
	        	}
	        }).then(editor => {
	        	window.editor = editor
	        })
	        .catch( error => {
	            console.error( error );
	        } );
	</script>

</body>
</html>
















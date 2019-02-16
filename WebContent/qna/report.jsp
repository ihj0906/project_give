<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link href="../css/qna.css" rel="stylesheet" type="text/css" />

	<div module="calendar_Write">
	</div>
	
	<nav class="tabmenu">
		<ul>
			<li><a href="/qna/qna">문의 내역</a></li>
			<li class="on"><a href="/qna/report">문의 하기</a></li>
			<li><a href="/qna/faq">자주 묻는 질문</a></li>
		</ul>
	</nav>
	<form action="write_qna" method="post">
	<div class="content">
		<table summary="1:1 문의 글 작성 폼">
			<tr>
				<th scope="row">아이디</th>
				<td>
				<!-- readonly 읽기전용 속성 / 유저 아이디 가져올것 -->
					<input type = "text" name = "id" size = "50" readonly="readonly" value="${loginInfo.id}">
				</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td>
					<input type = "text" name = "subject" size = "50">
				</td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td>
					<input type = "text" name = "myname" size = "50">
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>
					<textarea name="content" rows = "14" cols = "50" ></textarea><BR>
				</td>
			</tr>
			<tr>
				<th scope="row">첨부파일</th>
				<td width="200">
						<input type="file" name="image">
				</td>
			</tr>
		</table>
	</div>
			<div class="btnArea">
				<input class="btn" type="submit" value="등록">
				<input class="btn" type="button" value="취소" onClick="">
			</div>
		</form>
			
<%@ include file="../footer.jsp" %>
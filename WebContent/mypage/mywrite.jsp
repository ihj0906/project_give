
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="mypagesidemenu.jsp" %>   

<div class="mygiveList">
		<h1><span>내 가 쓴 글</span></h1>
	<table class="mygiveList_table">
	<thead>
	<tr>
		<td>기부 재능</td>
		<td>모집 인원</td>
		<td>제목</td>
		<td>내용</td>
		<td>위치</td>
		<td>마감일</td>
		<td>스크랩</td>
	</tr>
	</thead>
	<c:forEach var="mydonation" items="${myDonationList}">
		<tr>
			<td>${mydonation.talent1}&ensp;/&ensp;${mydonation.talent2}</td>
			<td>0&ensp;/&ensp;${mydonation.people}</td>
			<td><a href="#">${mydonation.subject}</a></td>
			<td><a href="#">${mydonation.content}</a></td>
			<td>${mydonation.location}</td>
			<td>${mydonation.closing_date}&ensp;</td>
			<td><input type="checkbox" id="clip"></td>
		</tr>
	</c:forEach>
	</table>
</div>

<div id=member></div>


<%@ include file="../footer.jsp"%>
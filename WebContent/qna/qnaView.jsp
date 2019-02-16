<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link href="../css/qna.css" rel="stylesheet" type="text/css" />

	<nav class="tabmenu">
		<ul>
			<li class="on"><a href="/qna/qna">문의 내역</a></li>
			<li><a href="/qna/report">문의 하기</a></li>
			<li><a href="/qna/faq">자주 묻는 질문</a></li>
		</ul>
	</nav>
	<div class="note_area">
		<c:if test="${empty loginInfo}">
		<h4>로그인 시 문의 내역을 확인할 수 있습니다.</h4>
		</c:if>
		<c:if test="${!empty loginInfo}">
		<h4>[${loginInfo.id}]님의 문의 내역 입니다.</h4>
		</c:if>
		<table class="qnaList">
			<tr>
				<th>[답변] <fmt:formatDate value="${qnaView.cre_date}" type="date" /></th>
			</tr>
			<tr>
				<td id="qnaView">${qnaView.reply}</td>
			</tr>
			<tr>
				<td>[문의] <fmt:formatDate value="${qnaView.cre_date}" type="date" /></td>
			</tr>
			<tr>
				<td id="qnaView"> ${qnaView.content}</td>
			</tr>
		</table>
		<div class="paginate">
			<input type="button" value="목록" onclick="qna/qna">
		</div>
	</div>

<%@ include file="../footer.jsp" %>
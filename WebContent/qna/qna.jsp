<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

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
		<h4>[${loginInfo.id }]님의 문의 내역 입니다.</h4>
	<table class="qnaList">
		<tr>
			<th width=60%>글제목</th>
			<th width=15%>처리상태</th>
			<th width=25%>등록일</th>
		</tr>
		<c:forEach var="qna" items="${qnaList}">
			<tr>
				<td id=subject><a href=/qna/qnaView&${qna.no}>${qna.subject}</a></td>
				<c:if test="${qna.repyn==1}">
					<td>처리완료</td>
				</c:if>
				<c:if test="${qna.repyn==2}">
					<td>처리중</td>
				</c:if>
				<td><fmt:formatDate value="${qna.cre_date}" type="date" /></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<div class="paginate">
		<input type="button" value="<<"> <input type="button"
			value="<"> <input type="button" value="1"> <input
			type="button" value=">"> <input type="button" value=">>">
	</div>
</div>

<%@ include file="../footer.jsp"%>
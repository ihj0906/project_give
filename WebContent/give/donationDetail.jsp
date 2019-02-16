<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link href="/css/give.css" rel="stylesheet" type="text/css" />

<!-- 메인 시작 -->
<article>

	<div class="search">
		<div class="search_container">
			<input type="text" placeholder="검색어를 입력해주세요"  />
			<input type="button" value="검색" />
		</div>
	</div>
	
	<div class="giveMenu">
		<ul>
		<a href="#"><li>언어</li></a>
		<a href="#"><li>예술</li></a>
		<a href="#"><li>스포츠</li></a>
		<a href="#"><li>컴퓨터</li></a>
		<a href="#"><li>그 외</li></a>
		</ul>
	</div>
	
	<div class="giveDetail">
	<div class="giveDetail_container">
		<table class="giveDetail_table" width="50%">
		<tr>
			<th>기부 재능</th><td>${donationDetail.talent1}&ensp;/&ensp;${donationDetail.talent2}</td>
			<th>모집인원</th><td>0&ensp;/&ensp;${donationDetail.people}</td>
		</tr>
		<tr>
			<th>작성자</th><td colspan=3><a href="/message/write&${donationDetail.id}">${donationDetail.id}</a></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan=3>${donationDetail.subject}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan=3>${donationDetail.content}</textarea></td>
		</tr>
		<tr>
			<th>위치</th>	<td>${donationDetail.location}</td>
			<th>마감일</th><td>${donationDetail.closing_date}&ensp;<span id=dday>D-6</span></td>
		</tr>
		<tr>
			<th>스크랩</th><td colspan=3><input type="checkbox" id="clip"></td>
		</tr>
		</table>
		<input type="button" id="request" value="신청하기">
		<input type="button" id="back" value="목록" onclick="go_back()">
	</div>
	</div>
	
	<div class="clear"></div>
</article>
<!-- 메인 끝 -->

<%@ include file="../footer.jsp" %>
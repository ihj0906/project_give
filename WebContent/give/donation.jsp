<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link href="/css/give.css" rel="stylesheet" type="text/css" />

<!-- 메인 시작 -->
<article>
	<div class="search">
		<div class="search_container">
			<input type="text" placeholder="검색어를 입력해주세요" />
			<input type="button" value="검색" />
		</div>
	</div>

	<div class="giveMenu">
		<ul>
			<li><a href="javascript:void(0);" onclick="menu_list('2')">언어</a></li>
			<li><a href="javascript:void(0);" onclick="menu_list('3')">예술</a></li>
			<li><a href="javascript:void(0);" onclick="menu_list('4')">스포츠</a></li>
			<li><a href="javascript:void(0);" onclick="menu_list('5')">컴퓨터</a></li>
			<li><a href="javascript:void(0);" onclick="menu_list('6')">그외</a></li>
		</ul>
	</div>

	<div class="giveList">
		<div class="giveList_container" width="80%">
			<c:if test="${empty keyword}">
				<p id="search_category">◎ 검색결과 : 전체</p>
			</c:if>
			<c:if test="${!empty keyword}">
				<p id="search_category">◎ 검색결과 : ${keyword}</p>
			</c:if>
			<input type="button" id="giveReg" value="새 클래스 등록" onclick="newDonationClass('${loginInfo.id}')">
			<table class="giveList_table" width="100%">
				<thead>
					<tr>
						<td>기부 재능</td>
						<td>모집 인원</td>
						<td>작성자</td>
						<td>제목</td>
						<td>내용</td>
						<td>위치</td>
						<td>마감일</td>
						<td>스크랩</td>
					</tr>
				</thead>
				<c:forEach var="donation" items="${donationList}">
					<tr>
						<td>${donation.talent1}&ensp;/&ensp;${donation.talent2}</td>
						<td>0&ensp;/&ensp;${donation.people}</td>
						<td><a href="/message/write&${donation.id}">${donation.id}</a></td>
						<td><a href="/give/donationDetail&${donation.no}">${donation.subject}</a></td>
						<td><a href="/give/donationDetail&${donation.no}">${donation.content}</a></td>
						<td>${donation.location}</td>
						<td>${donation.closing_date}&ensp;<span id=dday>D-6</span></td>
						<td><input type="checkbox" id="clip"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="clear"></div>
</article>
<!-- 메인 끝 -->

<%@ include file="../footer.jsp"%>
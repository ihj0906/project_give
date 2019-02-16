<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link href="/css/give.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<!-- 메인 시작 -->
<article>
	<form action="/regDonationClass" method="post">
	<div class="search">
		<div class="search_container">
			<input type="text" placeholder="검색어를 입력해주세요"  />
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
	
	<div class="giveWrite">
	<div class="giveWrite_container">
		<table class="giveWrite_table" width="50%">
		<%-- <tr><th>작성자</th><td colspan=3>${loginInfo.id}</td></tr> --%>
		<input type=hidden name="id" value="${loginInfo.id}">
		<tr>
			<th>기부 재능</th>
			<td>
				<select id="talent1" name="talent1">
					<option value="">선택</option>
					<option value="언어">언어</option>
					<option value="예술">예술</option>
					<option value="스포츠">스포츠</option>
					<option value="컴퓨터">컴퓨터</option>
					<option value="그 외">그 외</option>
				</select>
				<input type="text" id="talent2" name="talent2" size="10" maxlength="10">
			</td>
			<th>모집인원</th>
			<td>
				<input type="text" id="people" name="people" size="3" maxlength="2">&nbsp;명
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan=3><input type="text" id="subject" name="subject" maxlength="20" onKeyUp="count()">&nbsp;
			<span id="count">0</span>/<span id="max-count">20</span></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan=3><textarea id="content" name="content" rows="10" placeholder="(200자 이내)"></textarea><br>
			&nbsp;<span id="count">0</span>/<span id="max-count">200</span></td>
		</tr>
		<tr>
			<th>위치</th>
			<td>
				<input type="text" id="location" name="location" size="10">
				<input type="button" id="location_search" value="찾기">
			</td>
			<th>마감일</th>
			<td>
				<input type="text" id="closing_date" name="closing_date" size="10">
				<input type="button" id="datepicker" value="날짜 선택">
			</td>
		</tr>
		</table>
		<input type="submit" id="giveReg_ok" value="등록">
		<input type="button" id="giveReg_calcel" value="취소" onclick="go_back()">
	</div>
	</div>
	
	<div class="clear"></div>
	</form>
</article>
<!-- 메인 끝 -->

<%@ include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sidemenu.jsp"%>

<div class="note_area">
	<h4>쪽지 쓰기</h4>
	<!-- 기부 / 교환 글 카테고리 출력 -->
	<!-- <p>
			<button class="j_category">기부</button>
			글제목이 들어갈 장소입니다.
		</p> -->
	<form action="sendResult" method="post">
		<table class="noteDetail">
			<tr>
				<th>받는사람</th>
				<td><input type=hidden name="toId" value="${toId}">${toId}</td>
				<td><input type=hidden name="fromId" value="${loginInfo.id}"></td>
			</tr>
		</table>

		<textarea rows="30" cols="auto" name="content" class="note_text"
			placeholder="메세지를 작성해주세요" onclick="counttext()"></textarea>
		<br> <span id="counter">(0 / 최대
			1000자)</span> <br> <input type="button" value="취소"> <input
			type="submit" value="보내기">
	</form>
</div>


<%@ include file="../footer.jsp"%>
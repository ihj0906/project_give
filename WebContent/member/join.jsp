<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link href="/css/member.css" rel="stylesheet" type="text/css" />

<section class="top_section"></section>

<article>

	<div id="pagetitle">
		<h1>
			<span>회 원 가 입</span>
		</h1>
	</div>

	<div id=member>
		<form id="signUpForm" name="formm" action="welcome" method="post" >
			<table id="join_table">

				<tr>
					<td style="width: 110px;">아이디 <img src="/images/required.png" alt="필수">
					</td>
					<td style="width: 100px;"><input type="text" name="id" id="id" maxlength="10"></td>
					<td><p class="idCheckResult">
							<input class="board_submit_btn" style="width:85px;" type="button" name="checkidbtn" value="중복체크" onclick="idCheck()"> 
							<span class="msg" id="id"></span>
						</p></td>
					<td><input type="hidden" name="checkid" id="checkid"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2">(영문소문자/숫자, 최대 10자)</td>
				</tr>
				<tr>
					<td>비밀번호 <img src="/images/required.png" alt="필수">
					</td>
					<td><input type="password" name="password" id="password" maxlength="15"/></td>
					<td>(영문 대소문자/숫자, 최대15자)<span class="msg" id="msgPassword"></span></td>
				</tr>
				<tr>
					<td>비밀번호 확인 <img src="/images/required.png" alt="필수">
					</td>
					<td><input type="password" name="confirmPassword" id="confirmPassword" maxlength="15"/><span class="msg" id="msgConfirmPassword"></span></td>
				</tr>
				<tr>
					<td>이름 <img src="/images/required.png" alt="필수">
					</td>
					<td><input type="text" name="name" id="name" maxlength="10"/><span class="msg" id="msgName"></span></td>
				</tr>
				<tr>
					<td>휴대전화 <img src="/images/required.png" alt="필수">
					</td>
					<td><input type="text" name="phone" id="phone" maxlength="11"/><span class="msg" id="msgPhone"></span></td>
				</tr>
				<tr>
					<td>이메일 <img src="/images/required.png" alt="필수">
					</td>
					<td><input type="text" name="email" id="email" maxlength="50"/><span class="msg" id="msgEmail"></span></td>
				</tr>
			</table>
			<br>
			<input class="boardDetail_delete_btn" type="button" value="취소" onclick="cancelJoin()" /> 
			<input class="board_list_btn" type="button" value="회원가입" onclick="join()" />
		</form>
		<br> <br>
	</div>

</article>

<%@ include file="../footer.jsp"%>
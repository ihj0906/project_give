<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link href="/css/member.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(
			function() {
				$(".idCheck").click(
						function() {
							var query = $('#id').val(); //
							if (!query) {
								$(".idCheckResult .msg").text("아이디를 입력해주세요");
								$(".idCheckResult .msg").attr("style",
										"color:#f00");
								$('#id').focus();
							} else {
								$.ajax({
									url : "/join/idCheck",
									type : "post",
									data : {
										"id" : query
									},
									success : function(data) {
										if (data == 1) {
											$(".idCheckResult .msg").text(
													query+"는 이미 사용중인 아이디 입니다.");
											$(".idCheckResult .msg").attr(
													"style", "color:#f00");
											$('#id').val('');
											$('#id').focus();
										} else {
											$(".idCheckResult .msg").text(
													query+"는 사용 가능한 아이디입니다.");
											$(".idCheckResult .msg").attr(
													"style", "color:#00f");
											$('#checkid').value=query;
										}
									}
								}); // ajax 끝
							}
						});
			});
</script>
<article>

	<div id="pagetitle">
		<h1>
			<span>회 원 가 입</span>
		</h1>
	</div>

	<div id=member>
		<form id="signUpForm" id="formm" name="formm" action="welcome"
			method="post" onsubmit="return check()">
			<table id=join_table style="padding-left: 350px;">

				<tr>
					<td style="width: 110px;">아이디 <img src="/images/required.png"
						alt="필수">
					</td>
					<td style="width: 100px"><input type="text" name="id" id="id" maxlength="10"></td>
					<td><p class="idCheckResult">
							<input type="button" name="checkidbtn" class="idCheck" value="아이디중복체크"> <span
								class="msg">아이디를 확인해주세요</span>
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
					<td><input type="password" name="password" maxlength="15"/></td>
					<td>(영문 대소문자/숫자, 최대15자)</td>
				</tr>
				<tr>
					<td>비밀번호 확인 <img src="/images/required.png" alt="필수">
					</td>
					<td><input type="password" name="confirmPassword" maxlength="15"/></td>
				</tr>
				<tr>
					<td>이름 <img src="/images/required.png" alt="필수">
					</td>
					<td><input type="text" name="name" maxlength="10"/></td>
				</tr>
				<tr>
					<td>휴대전화 <img src="/images/required.png" alt="필수">
					</td>
					<td><input type="text" name="phone" maxlength="11"/></td>
				</tr>
				<tr>
					<td>이메일 <img src="/images/required.png" alt="필수">
					</td>
					<td><input type="text" name="email" maxlength="50"/></td>
				</tr>
			</table>
			<input type="button" value="취소" /> <input type="button" value="회원가입"
				onclick="join()" />
		</form>
	</div>

</article>

<%@ include file="../footer.jsp"%>
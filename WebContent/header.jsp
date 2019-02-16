<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jaeneung Give</title>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript" src="/js/message.js"></script>
<script type="text/javascript" src="/js/member.js"></script>
<script type="text/javascript" src="/js/give.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/css/index.css" rel="stylesheet" type="text/css" />
<!-- <link href="/css/member.css" rel="stylesheet" type="text/css" />
<link href="/css/message.css" rel="stylesheet" type="text/css" />
<link href="/css/report.css" rel="stylesheet" type="text/css" /> -->

<!-- <script type="text/javascript" src="js/jaeneung.js"></script> -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

	<div id="wrap">

		<!-- 헤더 시작 -->
		<header>
				<div class="top_container">
					<div id="logo">
						<a href="/index"> <img src="/images/logo3.jpg" alt="logo" />
						</a>
					</div>


					<form name=frmm action="/give/search_give" method=post>
						<input type="hidden" name="category"> <input type="hidden"
							name="key">
						<nav class="header_menu">
							<div class="header_menu_container">
								<ul>
									<li><a href="#">&emsp;사이트소개&emsp;∨</a>
										<ul>
											<li><a href="#">재능기부란?</a></li>
											<li><a href="#">이용방법</a></li>
										</ul>
										</li>
									<li>
										<!-- <a href="give/search_give" id="기부">&emsp;재능기부&emsp;∨</a> -->
										<a href="javascript:void(0);" onclick="menu_list('1')">&emsp;재능기부&emsp;∨</a>
										<ul>
											<li><a href="javascript:void(0);"
												onclick="menu_list('2')">언어</a></li>
											<li><a href="javascript:void(0);"
												onclick="menu_list('3')">예술</a></li>
											<li><a href="javascript:void(0);"
												onclick="menu_list('4')">스포츠</a></li>
											<li><a href="javascript:void(0);"
												onclick="menu_list('5')">컴퓨터</a></li>
											<li><a href="javascript:void(0);"
												onclick="menu_list('6')">그외</a></li>
										</ul>
									</li>
									<!-- 						<li><a href="/give/exchange.jsp">&emsp;재능교환&emsp;∨</a> -->
									<li><a href="javascript:void(0);" onclick="menu_list('7')">&emsp;재능교환&emsp;∨</a>
										<ul>
											<li><a href="javascript:void(0);"
												onclick="menu_list('8')">언어</a></li>
											<li><a href="javascript:void(0);"
												onclick="menu_list('9')">예술</a></li>
											<li><a href="javascript:void(0);"
												onclick="menu_list('10')">스포츠</a></li>
											<li><a href="javascript:void(0);"
												onclick="menu_list('11')">컴퓨터</a></li>
											<li><a href="javascript:void(0);"
												onclick="menu_list('12')">그외</a></li>
										</ul></li>

									<c:if test="${!empty loginInfo}">
										<li><a href="/mypage/memberinfo">&emsp;마이페이지&emsp;∨</a>
											<ul>
												<li><a href="/mypage/memberinfo">회원정보</a></li>
												<li><a href="/mypage/infoyourgive.jsp">재능기부내역</a></li>
												<li><a href="/mypage/mywrite.jsp">재능교환내역</a></li>
												<li><a href="/mypage/donation.jsp">스크랩</a></li>
												<!-- <li><a href="#">재능판매내역</a></li>-->
											</ul></li>
									</c:if>
									<li><a href="/qna/qna">&emsp;고객센터&emsp;∨</a>
										<ul>
											<li><a href="/qna/qna">Q&amp;A</a></li>
											<li><a href="/qna/faq">FAQ</a></li>
										</ul></li>
								</ul>
								<nav id="logo_menu">
									<ul>
										<c:if test="${empty loginInfo }">
											<li><a href="/login">로그인</a></li>
											<li>&emsp; |</li>
											<li>&emsp;<a href="/join/terms">회원가입</a></li>
										</c:if>
										<c:if test="${!empty loginInfo}">
											<!-- 알람종 동기화가 됨-->
											<li>
												<!-- <div style="cursor:pointer" onclick="window.location.href='http://www.naver.com/';"> -->
												<iframe class="alarm1"
													src="http://192.168.0.44:3750?id=${loginInfo.id}"
													width="80" height="30" frameborder="0" scrolling="no">메시지함</iframe>
											</li>
											<li><a href="/mypage/memberinfo">'${loginInfo.name}'</a>
												님 환영합니다.</li>
											<!-- 	
								<li>&emsp;<a href="/message/inbox"> <img
										src="/images/bell.gif">(1)
								</a></li>
								 -->

											<li>&emsp; |</li>
											<li>&emsp;<a href="/logout">로그아웃</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</nav>
					</form>

				</div>


			<div class="clear"></div>
		</header>
		<!-- 헤더 끝 -->
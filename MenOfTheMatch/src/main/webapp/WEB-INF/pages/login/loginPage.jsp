<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../frame/header.jsp" %>
<script type="text/javascript" src="/resources/js/login/login.js"></script>
<link rel="stylesheet" href="/resources/css/login/login.css" />
<form action="/login" method="post" id="loginForm">
<div class="ma">
	<div class="ma mt50 tac">
		<img alt="error" src="/resources/img/logo/pitch.png" width="120" height="120">
	</div>
	<div class="ma tac">
		<h4 class="color-darkblue fs-20pt">M.O.M 로그인</h4>
	</div>
	<div class="inputContainer">
	    <label for="username" class="basicLabel color-gray">ID(아이디)</label>
		<input type="text" id="id" name="id"  placeholder="ID">
	    <label for="password" class="basicLabel color-gray">Password(패스워드)</label>
    	<input type="password" name="password" id="password" placeholder="Password">
	</div>
	<div class="optionContainer df fd-row">
		<div class="va-m tal w50p">
			<label for="rememberId" class="color-gray fs-9pt fw-b va-m">아이디 기억하기</label>
			<input type="checkbox" class="va-m" id="rememberId" onclick="saveIdChk(event);">
		</div>
		<div class="tar w50p">
			<span class="fs-9pt text-d-ul color-darkblue cursor-p" onclick="location.href='/member/join'" >회원가입</span>
			<span class="fs-9pt color-darkblue">|</span>
			<span class="fs-9pt text-d-ul color-darkblue cursor-p" >아이디/PW찾기</span>
		</div>
	</div>
		<div class="errorDiv" id="errorDiv">
			<c:if test="${not empty loginErrorMsg}">
				<p class="fs-9pt color-fire fw-b">${loginErrorMsg}</p>
			</c:if>
		</div>	
	<div class="btnContainer tac">
		<button type="button" class="login-button" onclick="connectLogin();">로그인</button>		
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</div>
</form>
<%@ include file="../frame/footer.jsp" %>
</html>
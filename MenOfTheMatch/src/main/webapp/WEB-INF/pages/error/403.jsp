<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../frame/header.jsp" %>
<div>
	<div class="ma mt100 tac">
		<img alt="error" src="/resources/img/error/error.png" width="250" height="250">
		<br>
		<p class="basicFont fw-b fs-25pt color-red">403 Error가 발생하였습니다.</p>
	</div>
	<div class="ma mt50 mb100 tac">
		<button class="basicButton danger" onclick="location.href='/main'">메인페이지로 이동</button>
	</div>
</div>
<%@ include file="../frame/footer.jsp" %>
</html>
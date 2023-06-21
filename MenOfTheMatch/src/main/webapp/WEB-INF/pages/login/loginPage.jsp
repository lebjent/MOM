<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../frame/header.jsp" %>
<style>
	.basicLabel {
		display: block;
		font-weight: bold;
		margin-bottom: 5px;
		text-align: left; /* 추가 */
	}

	.inputContainer {
		margin: auto;
		width: 400px; /* 입력 폼의 너비 조정 */
	}
	
	.optionContainer{
		margin: auto;
		width: 400px; /* 입력 폼의 너비 조정 */
	}
	
	input[type="text"],
	input[type="password"] {
		padding: 8px;
		margin-bottom: 10px;
		border: 1px solid #ccc;
		border-radius: 3px;
		width: 100%; /* 입력 폼의 너비를 100%로 설정하여 div 내에 가득 차도록 함 */
	}
	
	.btnContainer{
		margin: 0 auto;
		width: 400p;
		margin-top: 50px;
	}
	
	.login-button {
	  display: inline-block;
	  padding: 12px 24px;
	  font-size: 16px;
	  font-weight: bold;
	  text-align: center;
	  text-decoration: none;
	  color: #ffffff;
	  background-color: #4CAF50;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	  transition: background-color 0.3s ease;
	  width: 400px;
	}
	
	.login-button:hover {
	  background-color: #45a049;
	}
	
	.errorDiv{
		width: 400px;
		margin: 0 auto;
	}
	
</style>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded",function(){
		getSaveId();
	})
	
	//아이디 저장여부 체크
	function getSaveId(){
		let savedId = localStorage.getItem("savedId");
		if(savedId != null){
			document.getElementById("id").value = savedId;
			document.getElementById("rememberId").checked = true;
		}
	}
	
	//localStorage에 아이디 저장
	function saveIdChk(event){
		let id = document.getElementById("id").value;
		if(event.target.checked){
			if(id != ''){
				localStorage.setItem("savedId",id);
			}
		}else{
			localStorage.removeItem("savedId");	
		}
	}
	
	//로그인
	function connectLogin(){
		let loginForm = document.getElementById("loginForm");
		let id = document.getElementById("id");
		let pw = document.getElementById("password");
		
		loginForm.submit();
		
	}
	
	
</script>
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
			<span class="fs-9pt text-d-ul color-darkblue cursor-p" >아이디/PW찾기</span>
		</div>
	</div>
	<c:if test="${not empty loginErrorMsg}">
		<div class="errorDiv">
			<p class="fs-9pt color-fire fw-b">${loginErrorMsg}</p>
		</div>	
	</c:if>
	<div class="btnContainer tac">
		<button type="button" class="login-button" onclick="connectLogin();">로그인</button>		
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</div>
</form>
<%@ include file="../frame/footer.jsp" %>
</html>
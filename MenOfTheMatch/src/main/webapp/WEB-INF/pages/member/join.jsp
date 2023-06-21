<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MenOfTheMatch - 회원가입 페이지</title>
<%@ include file="../../modal/basicModal.jsp" %>
<link rel="stylesheet" href="/resources/css/common/common.css">
<link rel="stylesheet" href="/resources/css/member/join.css">
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/member/join.js"></script>
<script type="text/javascript">
	
		
	function joinProcess(){
		let joinForm = document.getElementById("joinForm");
		let idChk = document.getElementById("idChk").value;
		let pwChk = document.getElementById("pwChk").value;
		let nameChk = document.getElementById("nameChk").value;
		let phone2 = document.getElementById("phone2").value;
		let phone3 = document.getElementById("phone3").value;
		let year = document.getElementById("year").value;
		let month = document.getElementById("month").value;
		let day = document.getElementById("day").value;
		let position = document.getElementById("position").value;
		let height = document.getElementById("height").value;
		let weight = document.getElementById("weight").value;
		let noTeamChk = document.getElementById("noteam").checked;
		let team_name = document.getElementById("team_name").value;
		
		if(nameChk != "Y"){
			modalAlert('',"이름을 확인해주세요.");	
			return false;
		}
		if(idChk != "Y"){
			modalAlert('','아이디를 확인해주세요.');
			return false;
		}
		if(pwChk != "Y"){
			modalAlert('','비밀번호를 확인해주세요.');
			return false;
		}
		if(phone2 == '' || phone3 == ''){
			modalAlert('','휴대폰 번호를 확인해주세요.');
			return false;
		}else{
			document.getElementById("phone").value = "010-" + phone2 + "-" + phone3;
		}
		
		document.getElementById("birthday").value = year + "-" + month + "-" + day;
		
		if(position == "NO"){
			modalAlert('','포지션을 선택해주세요.');
			return false;
		}
		
		if(height == ''){
			modalAlert('','키를 입력해주세요.');
			return false;	
		}
		
		if(weight == ''){
			modalAlert('','몸무게를 입력해주세요.');
			return false;
		}
		
		if(!noTeamChk){
			if(team_name == ''){
				modalAlert('','팀이름을 입력해주세요.');
				return false;
			}
		}
		
		joinForm.submit();
		
	}	
	
  	function submitForm(event) {
    	event.preventDefault(); // 폼 제출의 기본 동작을 막습니다.
  	}
	
</script>

</head>
<body>
	<div class="joinMain">
		<div class="imgDiv">
			<img src="/resources/img/logo/pitch.png" width="150" height="150">
		</div>
		<h2>Men Of The Match 회원가입</h2>
		<form id="joinForm" method="post" onsubmit="submitForm(event)" action="/member/memberJoin">
		<div class="formDiv">
		    <div class="input-container" id="nameDiv">
		        <label for="username">이름(Name)</label>
		        <input type="text"  class="w100p" onkeyup="nameCheck(event)" onkeydown="allowOnlyKorean(event)" id="name" name="name" placeholder="이름을 입력하세요.">
		    	<input type="hidden" id="nameChk" value="N">
		    </div>
		    <div class="input-container" id="idDiv">
		        <label for="id">아이디(ID)</label>
		        <input type="text"  class="w100p" name="id" id="id" onkeyup="restrictId(event)" placeholder="아이디를 입력하세요.">
		    	<input type="hidden" id="idChk" value="N">
		    </div>
	     	<div class="input-container" id="pwDiv">
		        <label for="password">비밀번호(Password)</label>
		        <input type="password"  class="w100p" onkeyup="pwChk1(event)" name="password" id="password" placeholder="비밀번호를 입력하세요.">
		    </div>
		    <div class="input-container" id="pwChkDiv">
		        <label for="passworChk">비밀번호 확인(PasswordCheck)</label>
		        <input type="password" class="w100p" onkeyup="pwChk2(event)" id="passwordChk" name="passworChk" placeholder="비밀번호를 확인해주세요." >
		    	<input type="hidden" id="pwChk" value="N">
		    </div>
     		<div class="input-container">
		        <label>성별(Gender)</label>
		        <select class="w100" name="gender">
		        	<option value="M">남성</option>
		        	<option value="F">여성</option>
		        </select>
		    </div>
		    <div class="input-container">
		        <label for="passworChk">전화번호(Phone)</label>
		        <input type="text" class="w80 tac" id="phone1" value="010" readonly>
		        <span>-</span>
		        <input type="text" class="w80 tac" onkeydown="limitToFourDigits(event)" id="phone2">
		        <span>-</span>
		        <input type="text" class="w80 tac" onkeydown="limitToFourDigits(event)" id="phone3">
		        <input type="hidden" id="phone" name="phone">
		    </div>
  			    <div class="input-container">
		        <label>생년월일(Date of Birth)</label>
		        <select class="w100" id="year" name="year"></select>
		        <span>년</span>
		        <select class="w80" id="month" name="month"></select>
		        <span>월</span>
    			<select class="w80" id="day" name="day"></select>
		        <span>일</span>
		        <input type="hidden" id="birthday" name="birthday" >
		    </div>
   			<div class="input-container" id="positionDiv">
		        <label>포지션(Position)</label>
		        <select class="w100" id="position" name="position">
		        	<option value="NO">선택</option>
		        	<option value="FW">공격수</option>
		        	<option value="MF">미드필더</option>
		        	<option value="DF">수비수</option>
		        	<option value="GK">골키퍼</option>
		        </select>
		    </div>
		    <div class="input-container">
		        <label>키/몸무게</label>
				<input type="number" class="w80" name="height" id="height"><span>CM</span>
				<input type="number" class="w80" name="weight" id="weight"><span>KG</span>
		    </div>
  			<div class="input-container">
    			<label>팀이름(TeamName)</label>
				<input type="text" class="w130" name="team_name" id="team_name">
				<button class="basicButton success" id="find_team">팀 찾기</button>
				<br>
				<span>팀 없음</span><input type="checkbox" id="noteam">
				<br>
		    </div>
	    	<div class="btnDiv mt50">
				<button type="button" class="basicButton danger" onclick="location.href='/main'">취소</button>		    
				<button type="button" class="basicButton primary" id="join" onclick="joinProcess()">가입</button>		    
	    	</div>
		</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MenOfTheMatch - 회원가입 페이지</title>
<link rel="stylesheet" href="/resources/css/common/common.css">
<style type="text/css">
	*{
		background-color: #4c5b6a;
	}
	
	.joinMain{
		margin: 0 auto;
	}
	
	.imgDiv{
		margin:"0 auto";
		text-align: center;
	}
	
	h2{
		color: white;
		text-align: center;
	}
	
        /* CSS 스타일 적용 */
        
        .formDiv{
        	margin: 0 auto;
        	margin-top: 90px;
        	width: 30%;
        }
        
        .input-container {
            margin-bottom: 20px;
        }
        
        .input-container input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
        }
        
        .input-container input:focus {
            outline: none;
            border-color: #2196F3;
            box-shadow: 0 0 5px #2196F3;
        }
        
         .input-container select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
        }
        
        .input-container select:focus {
            outline: none;
            border-color: #2196F3;
            box-shadow: 0 0 5px #2196F3;
        }
        
        .input-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: white;
        }
		
        .input-container span {
            font-weight: bold;
            color: white;
        }
		
		.btnDiv{
			text-align: right;
			margin: 0 auto;
			margin-bottom: 50px;
		}
		
		option{
			background-color: white;
		}
</style>

<script type="text/javascript">

	/* 바닐라 JS로 타이틀 클릭시  이동 */
	window.onload = function() {
		makeDateOfBirth();
		
		document.getElementById("year").addEventListener("change", exactlyDate);//년도 변경시발생
		document.getElementById("month").addEventListener("change", exactlyDate);//월 변경시발생
		document.getElementById("mainPosition").addEventListener("change", insertPosition);//메인 포지션 변경시 발생
		document.getElementById("noteam").addEventListener("click", teamNameDisable);//메인 포지션 변경시 발생
		
	};
	
	/*
		역할: 년/월/일을 날짜에 맞게 넣어주는 함수
	*/
	function makeDateOfBirth(){
		
			let year = document.getElementById("year");
			let month = document.getElementById("month");
			let day = document.getElementById("day");
			
			let currentYear = new Date().getFullYear();
			
			//년도 생성
		    for (let i = currentYear; i >= currentYear - 80; i--) {
		        let option = document.createElement("option");
		        option.value = i;
		        option.text = i;
		        year.add(option);
		    }
			//년도 생성
		    for (let i = 1; i <= 12; i++) {
		        let option = document.createElement("option");
		        option.value = i;
		        option.text = i;
		        month.add(option);
		    }
			
			//일 생성
		    for (let i = 1; i <= 31; i++) {
		        let option = document.createElement("option");
		        option.value = i;
		        option.text = i;
		        day.add(option);
		    }
			
	}
	
	
	/*년도와 월 선택시 해당 년/월에 맞는 일 옵션을 넣어주기*/
	function exactlyDate(){
		
		let year = document.getElementById("year").value;
		let month = document.getElementById("month").value;
		
		let daysInMonth = new Date(year, month, 0).getDate();
		
		let day = document.getElementById("day");
		
		day.innerHTML = "";
		
		for(let i=1; i<=daysInMonth; i++){
	        let option = document.createElement("option");
	        option.value = i;
	        option.text = i;
	        day.add(option);
		}
		
	}
	
	/*포지션에 맞는 세부 포지션 넣어주기*/	
	function insertPosition(){
		
		let positionDiv = document.getElementById("positionDiv");
		
		let mainPositionValue = document.getElementById("mainPosition").value;
		
		let detailPositionElement = document.getElementById("detailPosition");
		
		if(detailPositionElement) detailPositionElement.remove();
		
		
		let detailPosition = document.createElement("select");
		
		detailPosition.name = "detailPosition";
		detailPosition.id = "detailPosition";
		detailPosition.classList.add("w50");
		
		if(mainPositionValue =="NO"){
			alert("포지션을 선택해주세요.");
			return false;
		}else if(mainPositionValue == "FW"){
			positionDiv.appendChild(detailPosition);
			let html = "<option  value='ST'>ST</option>";
			html += "<option  value='CF'>CF</option>";
			html += "<option  value='LF'>LF</option>";
			html += "<option  value='RF'>RF</option>";
			html += "<option  value='SS'>SS</option>";
			html += "<option  value='LW'>LW</option>";
			html += "<option  value='RW'>RW</option>";
			detailPosition.innerHTML=html;
		}else if(mainPositionValue == "MF"){
			positionDiv.appendChild(detailPosition);
			let html = "<option  value='CM'>CM</option>";
			html += "<option  value='LM'>LM</option>";
			html += "<option  value='RM'>RM</option>";
			html += "<option  value='CAM'>CAM</option>";
			html += "<option  value='CDM'>CDM</option>";
			detailPosition.innerHTML=html;
		}else if(mainPositionValue == "DF"){
			positionDiv.appendChild(detailPosition);
			let html = "<option  value='CB'>CB</option>";
			html += "<option  value='LB'>LB</option>";
			html += "<option  value='RB'>RB</option>";
			html += "<option  value='LWB'>LWB</option>";
			html += "<option  value='RWB'>RWB</option>";
			detailPosition.innerHTML=html;
		}else if(mainPositionValue == "GK"){
			positionDiv.appendChild(detailPosition);
			let html = "<option  value='GK'>GK</option>";
			detailPosition.innerHTML=html;
		}
		
	}
	//팀없음을 클릭시
	function teamNameDisable(){
		let noTeamChkYN = document.getElementById('noteam');
		let noTeam = document.getElementById('team_name');
		
		if(noTeamChkYN.checked){
			noTeam.disabled = true;
			noTeam.innerHTML="";
		}else{
			noTeam.disabled = false;
		}
	}
	
</script>

</head>
<body>
	<div class="joinMain">
			<div class="imgDiv">
				<img src="/resources/img/join/pitch.png" width="150" height="150">
			</div>
			<h2>Men Of The Match 회원가입</h2>
			<div class="formDiv">
			    <div class="input-container">
			        <label for="username">이름(Name)</label>
			        <input type="text"  class="w100p" name="name" placeholder="이름을 입력하세요.">
			    </div>
			    <div class="input-container">
			        <label for="username">아이디(ID)</label>
			        <input type="text"  class="w100p" name="name" placeholder="아이디를 입력하세요.">
			    </div>
			     <div class="input-container">
			        <label for="password">비밀번호(Password)</label>
			        <input type="password"  class="w100p" name="password" >
			    </div>
			   <div class="input-container">
			        <label for="passworChk">비밀번호 확인(PasswordCheck)</label>
			        <input type="password" class="w100p" name="passworChk" >
			    </div>
   			    <div class="input-container">
			        <label>생년월일(Date of Birth)</label>
			        <select class="w100" id="year" name="year"></select>
			        <span>년</span>
			        <select class="w50" id="month" name="month"></select>
			        <span>월</span>
     			    <select class="w50" id="day" name="day"></select>
			        <span>일</span>
			    </div>
    			<div class="input-container" id="positionDiv">
			        <label>포지션(Position)</label>
			        <select class="w100" id="mainPosition" name="mainPosition">
			        	<option value="NO">선택</option>
			        	<option value="FW">공격수</option>
			        	<option value="MF">미드필더</option>
			        	<option value="DF">수비수</option>
			        	<option value="GK">골키퍼</option>
			        </select>
			    </div>
			    <div class="input-container">
			        <label>키/몸무게</label>
					<input type="number" class="w50" name="height"><span>CM</span>
					<input type="number" class="w50" name="weight"><span>KG</span>
			    </div>
       			<div class="input-container">
       				<label>팀이름(TeamName)</label>
					<input type="text" class="w50" name="team_name" id="team_name">
					<button class="basicButton success" id="find_team">팀 찾기</button>
					<br>
					<span>팀 없음</span><input type="checkbox" id="noteam">
					<br>
			    </div>
		    	<div class="btnDiv mt50">
					<button type="button" class="basicButton danger">취소</button>		    
					<button type="button" class="basicButton primary">가입</button>		    
		    	</div>
			</div>
	</div>
</body>
</html>
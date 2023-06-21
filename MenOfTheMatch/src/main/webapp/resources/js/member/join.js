	/* 바닐라 JS로 타이틀 클릭시  이동 */
	document.addEventListener('DOMContentLoaded', function() {
		
		makeDateOfBirth();
		
		document.getElementById("year").addEventListener("change", exactlyDate);//년도 변경시발생
		document.getElementById("month").addEventListener("change", exactlyDate);//월 변경시발생
		document.getElementById("position").addEventListener("change", insertPosition);//메인 포지션 변경시 발생
		document.getElementById("noteam").addEventListener("click", teamNameDisable);//팀없음 클릭시
		document.getElementById("find_team").addEventListener("click", dupChk);//팀없음 클릭시
		
	});
	

	
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
		
		let positionValue = document.getElementById("position").value;
		
		let subpositionElement = document.getElementById("subposition");
		
		if(subpositionElement) subpositionElement.remove();
		
		
		let subposition = document.createElement("select");
		
		subposition.name = "subposition";
		subposition.id = "subposition";
		subposition.classList.add("w80");
		
		if(positionValue =="NO"){
			alert("포지션을 선택해주세요.");
			return false;
		}else if(positionValue == "FW"){
			positionDiv.appendChild(subposition);
			let html = "<option  value='ST'>ST</option>";
			html += "<option  value='CF'>CF</option>";
			html += "<option  value='LF'>LF</option>";
			html += "<option  value='RF'>RF</option>";
			html += "<option  value='SS'>SS</option>";
			html += "<option  value='LW'>LW</option>";
			html += "<option  value='RW'>RW</option>";
			subposition.innerHTML=html;
		}else if(positionValue == "MF"){
			positionDiv.appendChild(subposition);
			let html = "<option  value='CM'>CM</option>";
			html += "<option  value='LM'>LM</option>";
			html += "<option  value='RM'>RM</option>";
			html += "<option  value='CAM'>CAM</option>";
			html += "<option  value='CDM'>CDM</option>";
			subposition.innerHTML=html;
		}else if(positionValue == "DF"){
			positionDiv.appendChild(subposition);
			let html = "<option  value='CB'>CB</option>";
			html += "<option  value='LB'>LB</option>";
			html += "<option  value='RB'>RB</option>";
			html += "<option  value='LWB'>LWB</option>";
			html += "<option  value='RWB'>RWB</option>";
			subposition.innerHTML=html;
		}else if(positionValue == "GK"){
			positionDiv.appendChild(subposition);
			let html = "<option  value='GK'>GK</option>";
			subposition.innerHTML=html;
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
	
	//숫자 4자리만 입력가능하게 하는 함수
    function limitToFourDigits(event) {
        const input = event.target.value;
        
        // Tab 키를 눌렀을 때는 동작하지 않도록 처리
    	if (event.key === "Tab") {
	    	return;
	  	}
        
        // 입력값이 4자리 숫자가 아니면 잘라냄
        const sanitizedInput = input.replace(/[^0-9]/g, '').slice(0, 3);
        
        // 입력값 업데이트
        event.target.value = sanitizedInput;
    }
	
	//한글만 입력 가능하게 하는 함수
    function allowOnlyKorean(event) {
        const keyCode = event.keyCode || event.which;
        const keyValue = String.fromCharCode(keyCode);
        
        // ㄱ ~ ㅎ, 가 ~ 힣, space, backspace, delete 허용
        const allowedKeys = /^[ㄱ-ㅎ가-힣\s\b]+$/;
        
        if (!allowedKeys.test(keyValue)) {
          event.preventDefault();
        }
        
    }
	
	//이름 유효성검사
	function nameCheck(event){
		errorBoxInit("errorBox1");
		let name = event.target.value;
		console.log(name)
		if(name.length > 5 || name =='' || name.length == 1){
			drawErrorBox("nameDiv","이름을 제대로 입력해주세요.","errorBox1");
			document.getElementById("nameChk").value = "N";
			return false;
		}else{
			nameDiv.style.marginBottom = "10px";
			document.getElementById("nameChk").value = "Y";
		}
	}
	
	//아이디 유효성 = 영어+숫자
    function restrictId(event) {
        let inputValue = event.target.value;
        let alphanumericRegex = /^[a-zA-Z0-9]*$/;
        
        if (!alphanumericRegex.test(inputValue)) {
          event.target.value = '';
        }
        
        errorBoxInit("errorBox2");
		let idDiv = document.getElementById("idDiv");
		
        if(4>inputValue.length || inputValue.length >=13){
			drawErrorBox("idDiv","아이디는 4자이상 13자이하로 기입하여주세요.","errorBox2");
			document.getElementById("idChk").value = "N";
			return false;
        }else{
        	idDiv.style.marginBottom = "10px";
        }
       
  	   let data = {
  		    id: inputValue
  	   }; 
  	   fetchData("/member/dupChk",'POST',data)  
	  	 .then(data => {
		    if(data.status == "SUCCESS"){
		    	if(data.result > 0 ){
		    		errorBoxInit("errorBox2");
		    		drawErrorBox("idDiv","중복된 아이디입니다.","errorBox2");
		    		document.getElementById("idChk").value = "N";
		    	}else{
		    		errorBoxInit("errorBox2");
		    		drawErrorBox("idDiv","사용이 가능한 아이디입니다.","errorBox2");
		    		document.getElementById("idChk").value = "Y";
		    	}
		    }else{
		    	alert('아이디 중복체크중 에러가 발생하였습니다.');
		    }
	   });
        
    }
	
	//비밀번호 체크
	function pwChk1(event){
		errorBoxInit("errorBox3");
		let pwValue = event.target.value;
		let pwChkValue = document.getElementById("passwordChk").value;
		if(pwChkValue != ''){
			if(pwValue == pwChkValue){
				drawErrorBox("pwChkDiv","비밀번호가 일치합니다.","errorBox3");
				document.getElementById("pwChk").value = "Y";
			}else{
				drawErrorBox("pwChkDiv","비밀번호가 일치하지 않습니다.","errorBox3");
				document.getElementById("pwChk").value = "N";
			}
		}
	}
	
	function pwChk2(event){
		errorBoxInit("errorBox3");
		let pwValue = document.getElementById("password").value;
		let pwChkValue = event.target.value;
		if(pwValue == pwChkValue){
			drawErrorBox("pwChkDiv","비밀번호가 일치합니다.","errorBox3");
			document.getElementById("pwChk").value = "Y";
		}else{
			drawErrorBox("pwChkDiv","비밀번호가 일치하지 않습니다.","errorBox3");
			document.getElementById("pwChk").value = "N";
		}
	}
	
	//에러박스의 내용 그려주기
	function drawErrorBox(beforeTagId,msg,drawTagId){
		let beforeDiv = document.getElementById(beforeTagId);
		let errorBox = document.createElement("div");
		errorBox.innerHTML = msg;
		errorBox.setAttribute("id",drawTagId);
		errorBox.style.fontSize = "9pt";
		errorBox.style.fontWeight = "bold";
		errorBox.style.marginBottom = "10px";
		errorBox.style.color = "#e7bf34";
		
		beforeDiv.style.marginBottom = "0px";
		beforeDiv.insertAdjacentElement("afterend",errorBox);
		
	}
	
	//에러박스 초기화
	function errorBoxInit(tagId){
		let init = document.getElementById(tagId);
		if(init)init.remove();
	}
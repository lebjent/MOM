//로그인 관련 JS

	document.addEventListener("DOMContentLoaded",function(){
		getSaveId();//아이디 저장여부 체크
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
	function saveIdChk(){
		let id = document.getElementById("id").value;
		let rememberId = document.getElementById("rememberId");
		if(rememberId.checked){
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
		let id = document.getElementById("id").value;
		let pw = document.getElementById("password").value;
		
		
		if(id == ''){
			createErrorMsg("M.O.M 회원 아이디를 입력해주세요.");
			return false;
		}
		
		if(pw == ''){
			createErrorMsg("비밀번호를 입력해주세요.");
			return false;
		}
		
		saveIdChk();
		
		loginForm.submit();
		
	}
	
	//ErrorDiv안 요소 넣어주기
	function createErrorMsg(msg){
		let errorDiv = document.getElementById("errorDiv");
		errorDiv.innerHTML="";
		errorDiv.innerHTML="<p class='fs-9pt color-fire fw-b'>"+msg+"</p>"
	}

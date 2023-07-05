<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/team/modal/teamCreate.css">
<script>

	document.addEventListener('DOMContentLoaded', function() {

		let modal = document.getElementById("teamModal");
		let closeBtn = document.getElementsByClassName("close")[0];
		let closeBtn2 = document.getElementsByClassName("close_btn")[0];
		
		closeBtn.addEventListener("click", function() {
			modalClear();
		});
		
		closeBtn2.addEventListener("click", function() {
			modalClear();
		});
		
		window.addEventListener("click", function(event) {
		  if (event.target == modal) {
			  modalClear();
		  }
		});
	});
	
	/* 팀 등록창 오픈 */
	function teamCreateShowModal(){
		let modal = document.getElementById("teamModal");
		modal.style.display = "block";
	}
	
	/* 이미지 미리보기 함수 */
	function previewImg(input) {
	  if (input.files && input.files[0]) {
	    let reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById("preview").src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  }
	  let fileValue = input.value.split("\\").pop();
	}
	
	// 팀등록 버튼 클릭시
	function teamCreate() {
	  
	  let fileInput = document.getElementById('fileInput');
	  if (!fileInput.files.length > 0) {
		  modalAlert('알림','팀로고 이미지를 등록해주세요.');
		  return false;
	  }
	  let tname = document.getElementById("tname").value;
	  if(tname == ''){
		  modalAlert('알림','팀이름을 입력해주세요.');
		  return false;
	  }
	  
	  let tregion = document.getElementById("tregion").value;
	  if(tregion == 'NO'){
		  modalAlert('알림','팀의 활동지역을 선택해주세요.');
		  return false;
	  }
	  
	  let taverageAge = document.getElementById("taverageAge").value;
	  if(taverageAge == 'NO'){
		  modalAlert('알림','팀의 평균 연령대를 선택해주세요.');
		  return false;
	  }
	  
	  let tintroduce = document.getElementById("tintroduce").value;
	  if(tintroduce == ''){
		  modalAlert('알림','팀소개를 입력해주세요.');
		  return false;
	  }	  
	  let formElement = document.getElementById('teamForm');
	  let formData = new FormData(formElement);
	  formData.enctype = 'multipart/form-data';
	  
	  let xhr = new XMLHttpRequest();
	  let token = document.getElementById("token").value;
	  xhr.open('POST', '/teamCreate');
	  //xhr.setRequestHeader('Content-type', 'application/json');
	  xhr.setRequestHeader('X-CSRF-Token', token);
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === XMLHttpRequest.DONE) {
	      if (xhr.status === 200) {
	        // 등록 성공 시 처리할 코드
	        modalAlert('','팀이 등록되었습니다.',function(){
		        modalClear();
		        location.reload();
	        });
	      } else {
	        // 등록 실패 시 처리할 코드
	        modalAlert('','팀 등록에 실패하였습니다. 다시 시도해주세요.');
	      }
	    }
	  };
	  xhr.send(formData);
	}
	
	/*팀 등록시 모달창 닫고 모달 초기화*/
	function modalClear(){
		let preview = document.getElementById("preview");
		preview.src = "";
		let fileInput = document.getElementById("fileInput");
		fileInput.value = "";
		let tname = document.getElementById("tname");
		tname.value = "";
		let tregion = document.getElementById("tregion");
		tregion.value = "NO";
		let taverageAge = document.getElementById("taverageAge");
		taverageAge.value = "NO";
		let tsince = document.getElementById("tsince");
		tsince.value = "NO";
		let tintroduce = document.getElementById("tintroduce");
		tintroduce.value = "";
		
		let modal = document.getElementById("teamModal");
		modal.style.display = "none";
	}
	
</script>
<html>
 <body>
  <div id="teamModal" class="modal">
  	<form id="teamForm" method="post">
    <div class="teamReg-content">
	      <div class="modal-header">
	        <h4 id="teamTitle">My팀 생성</h4>
	        <span class="close">&times;</span>
	      </div>
	      <div class="modal-body">
			<div class="teamForm">
				<div class="teamLogoReg">
					<img alt=".s" id="preview">
				</div>
				<label>My팀 엠블럼 등록</label>
				<input type="file" accept="image/jpeg, image/png" name="fileInput" id="fileInput" onchange="previewImg(this)">
				<label>팀 이름</label>
				<input type="text" name="tname" id="tname" class="w200">
				<label>활동지역</label>
				<select class="w200" id="tregion" name="tregion">
					<option value="NO">선택</option>
					<option value="서울">서울</option>
					<option value="경기남부">경기남부</option>
					<option value="경기북부">경기북부</option>
					<option value="부산">부산</option>
					<option value="대구">대구</option>
					<option value="광주">광주</option>
					<option value="대전">대전</option>
					<option value="울산">울산</option>
					<option value="세종">세종</option>
					<option value="강원">강원</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
					<option value="제주">제주</option>
				</select>
				<label>팀 평균연령</label>
				<select class="w200" id="taverageAge" name="taverageAge">
					<option value="NO">선택</option>
					<option value="10">10대</option>
					<option value="20A">20대초반</option>
					<option value="20B">20대중반</option>
					<option value="20C">20대후반</option>
					<option value="30A">30대초반</option>
					<option value="30B">30대중반</option>
					<option value="30C">30대후반</option>
					<option value="40A">40대초반</option>
					<option value="40B">40대중반</option>
					<option value="40C">40대후반</option>
					<option value="50A">50대초반</option>
					<option value="50B">50대중반</option>
					<option value="50C">50대후반</option>
					<option value="60A">60대초반</option>
					<option value="60B">60대중반</option>
					<option value="60C">60대후반</option>
				</select>
				<label>팀 창단년도</label>
				<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy" var="currentYear" />
				<select name="tsince" id="tsince">
				  <option value="NO">선택</option>
				  <c:forEach begin="1950" end="${currentYear}" var="year">
				    <option value="${year}">${year}년도</option>
				  </c:forEach>
				</select>
				<label>팀소개</label>
				<textarea rows="5" cols="64" id="tintroduce" name="tintroduce"></textarea>
				<input type="hidden" name="treaderNo" value="${loginInfo.mno}">
			</div>        	
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="reg_btn" onclick="teamCreate()">등록</button>
	        <button type="button" class="close_btn">닫기</button>
   		  </div>
          <input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}" />
      </div>
    </form>
    </div>
 </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/main/loginBox.css" />
<link rel="stylesheet" href="/resources/css/main/slide.css" />
<script src="/resources/js/main/main.js"></script>
<style>
    .main1 {
        display: flex;
        height: 600px;
    }
	
	.content{
		width: 80%;
		margin-top: 20px;
	}
</style>
<script>	
	document.addEventListener('DOMContentLoaded', function() {
			
        let teamCreateElement = document.getElementById("teamCreate");
        if (teamCreateElement) {
            teamCreateElement.addEventListener('click', function() {
                teamCreateShowModal();
            });
        }	
	
	});
	
</script>
	<%@ include file="../frame/header.jsp" %>
	<main class="main1">
		<div class="content">
			<!-- 슬라이드 쇼의 전체 컨테이너 -->
			<div class="slide-container">
			<!-- 이미지를 담을 각각의 슬라이드 div태그 생성 -->
				<div class="mySlides fade">
					<div class="numbertext">1 / 3</div>
					<img src="/resources/img/main/mainEvent/mainEvent1.jpg" alt="Event1">
				</div>
				<div class="mySlides fade">
					<div class="numbertext">2 / 3</div>
					<img src="/resources/img/main/mainEvent/mainEvent2.jpg" alt="Event2">
				</div>
				<div class="mySlides fade">
					<div class="numbertext">3 / 3</div>
					<img src="/resources/img/main/mainEvent/mainEvent3.jpg" alt="Event3">
				</div>
				<!-- 슬라이드 쇼 좌/우 버튼 -->
				<a class="prev" onclick="moveSlides(-1)">&#10094;</a>
		      	<a class="next" onclick="moveSlides(1)">&#10095;</a>
			</div>
			
			<!-- 맨하단 써클 버튼 -->
			<div class="tac">
		      	<span class="dot" onclick="currentSlide(0)"></span>
		      	<span class="dot" onclick="currentSlide(1)"></span>
		      	<span class="dot" onclick="currentSlide(2)"></span>
		    </div>
		</div>
        <div class="login-container">
          <!-- 로그인한 상태가 아닐시 -->
		  <sec:authorize access="!isAuthenticated()">
		  	<div class="login-box">
			    <div class="form-group">
				    <div class="login-btn-box">
				      <button type="button" onclick="location.href='/loginPage'" class="login-btn">로그인</button>
				      <div class="user-service">
				      	<a href="/member/join" class="link">회원가입</a>
				      	<span>/</span>
				      	<a href="" class="link">아이디/비밀번호찾기</a>
				      </div>
				    </div>
			  	</div>
        	</div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
	        <div class="loginInfo-box">
	        	<form method="post" action="/logout">
	        		<div class="ma df fd-row ai-c">
	        			<div class="teamLogo">
		        			<c:if test="${!tnoChk}">
		        				<img alt="noTeam" src="/resources/img/main/noTeam.png" width="100%" height="100%">
		        			</c:if>
		        			<c:if test="${tnoChk}">
		        				<img alt="team" src="${teamInfo.tfilePath}" width="100%" height="100%">
		        			</c:if>
	        			</div>
	        			<div class="p20p fs-10pt">
	        				<div>
	    						<span>${loginInfo.username}님</span>
		        				<span>|</span>
		        				<c:if test="${!tnoChk}">
		        					<span>팀없음</span>
		        					<br>
		        					<span class="teamReg" id="teamReg">팀 등록하기</span>
		        					<span>|</span>
		        					<span class="teamCreate" id="teamCreate">팀 생성</span>
		        				</c:if>
		        				<c:if test="${tnoChk}">
		        					<span>${teamInfo.tname}</span>
		        				</c:if>
	        				</div>
	        				<div>
						        <span>포지션:</span>
		        				<span class="position ${loginInfo.position}">${loginInfo.position}</span>
		        				<span>|</span>
		        				<span class="position ${loginInfo.position}">${loginInfo.subPosition}</span>
	        				</div>
	        			</div>
	        		</div>
	        		<div class="ma tac">
	        			<button class="logout-btn" type="submit">로그아웃</button>
	        		</div>
	        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        	</form>
	        </div>	
        </sec:authorize>
       </div> 
	</main>
	<%@ include file="../team/modal/teamCreate.jsp" %>
	<%@ include file="../frame/footer.jsp" %>

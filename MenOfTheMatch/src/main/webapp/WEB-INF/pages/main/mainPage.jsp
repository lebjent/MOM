<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
        .main1 {
            display: flex;
            height: 600px;
        }
		
		.content{
			border: 2px black solid; 
			width: 80%;
		}
		
        .login-container {
        	width: 20%;
        }


         .login-box {
		      max-width: 400px;
		      height:150px;
		      margin: 0 auto;
		      margin-top: 20px;
		      padding: 20px;
		      background-color: #fff;
		      border-radius: 5px;
		      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	    }
        
        .login-btn-box{
        	margin: auto;
        	padding-top: 40px;
        	text-align: center;
        }
        
        .login-btn-box .login-btn{
            background-color: #00a0ff;
            width:200px;
            height:40px;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .login-btn-box .login-btn:hover{
	    	background-color: #7b7672;
	    }
        	
          .login-box .logout-btn {
            background-color: #ff5555;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .user-service{
        	margin-top: 20px;
        }
        
        .link{
        	color: #75787e;
        	font-size: 10pt;
        }
        
</style>
<body>
	<%@ include file="../frame/header.jsp" %>
	<main class="main1">
		<div class="content">
		
		</div>
        <div class="login-container">
			  <div class="login-box">
			    <div class="form-group">
				    <div class="login-btn-box">
				      <button type="submit" class="login-btn">로그인</button>
				      <div class="user-service">
				      	<a href="/member/join" class="link">회원가입</a>
				      	<span>/</span>
				      	<a href="" class="link">아이디/비밀번호찾기</a>
				      </div>
				    </div>
			  </div>
        </div>
	</main>
	<%@ include file="../frame/footer.jsp" %>
</body>
</html>
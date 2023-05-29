<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/index/index.css">
<link rel="stylesheet" href="/resources/css/common/common.css">

<script type="text/javascript">
	
/* 바닐라 JS로 타이틀 클릭시  이동 */
window.onload = function() {
	  let title = document.getElementsByClassName("title")[0];
	  
	  title.addEventListener("click", function() {
	    location.href='/main';
	  });
};
		

</script>

<meta charset="UTF-8">
<title>대한민국 축구인들을 위한 웹사이트-MOM</title>
</head>
<body>
<div class="ma tac pt300">
	<img class="tac" alt="logo" src="/resources/img/logo/logo.png" width="120" height="80">
	<p class="title">Men Of The Match</p>
</div>
</body>
</html>
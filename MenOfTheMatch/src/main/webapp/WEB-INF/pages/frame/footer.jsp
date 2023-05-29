<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	/* Container styles */
.container {
  background-color: #F8F9FA;
  padding: 40px 0;
  margin-top: 50px;
}

/* Column styles */
.col-md-6,
.col-md-3 {
  text-align: center;
}

.col-md-6 h3 {
  color: #333333;
  font-weight: bold;
  margin-bottom: 20px;
}

.col-md-6 p {
  color: #666666;
  font-size: 16px;
  line-height: 24px;
}

.col-md-3 h3 {
  color: #333333;
  font-weight: bold;
  margin-bottom: 20px;
}

.col-md-3 ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.col-md-3 li {
  margin-bottom: 10px;
}

.col-md-3 a {
  color: #666666;
  font-size: 16px;
  text-decoration: none;
}

.col-md-3 a:hover {
  color: #333333;
}

/* Social icon styles */
.social {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 20px;
}

.social li {
  margin-right: 20px;
}

.social a {
  color: #666666;
  font-size: 20px;
  text-decoration: none;
  transition: all 0.3s ease-in-out;
}

.social a:hover {
  color: #333333;
  transform: scale(1.2);
}
</style>
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <h3>About Us</h3>
        <p>Men Of The Match is a platform for football enthusiasts.</p>
      </div>
      <div class="col-md-3">
        <h3>Quick Links</h3>
        <ul>
          <li><a href="#">서비스 소개</a></li>
          <li><a href="#">나의 팀</a></li>
          <li><a href="#">매칭정보</a></li>
          <li><a href="#">자유게시판</a></li>
          <li><a href="#">축구용품 정보</a></li>
        </ul>
      </div>
      <div class="col-md-3">
        <h3>Follow Us</h3>
        <ul class="social">
          <li><a href="#"><img src="/resources/img/logo/kakao.png" width="40" height="40"></a></li>
          <li><a href="#"><img src="/resources/img/logo/facebook.png" width="40" height="40"></a></li>
          <li><a href="#"><img src="/resources/img/logo/instagram.png" width="40" height="40"></a></li>
        </ul>
      </div>
    </div>
  </div>
</footer>
</html>
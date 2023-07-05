<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/modal/modal.css">
<script>

	document.addEventListener('DOMContentLoaded', function() {

		let modal = document.getElementById("myModal");
		let closeBtn = document.getElementsByClassName("close")[0];
		let closeBtn2 = document.getElementsByClassName("button")[0];
		
		
		closeBtn.addEventListener("click", function() {
		  modal.style.display = "none";
		});
		
		closeBtn2.addEventListener("click", function() {
			  modal.style.display = "none";
		});
		
		window.addEventListener("click", function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		});
	});
	
	function modalAlert(title, msg, callback) {
		let modal = document.getElementById("myModal");
		let titleBox = document.getElementById("title");
		let msgBox = document.getElementById("msg");
		modal.style.display = "block";
		if (title == "") {
			titleBox.innerHTML = "알림";
		} else {
			titleBox.innerHTML = title;
		}
		msgBox.innerHTML = msg;

		let closeButton = document.getElementsByClassName("button")[0];
		closeButton.addEventListener("click", function() {
			modal.style.display = "none";
			if (typeof callback === "function") {
				callback();
			}
		});
	}
</script>
<html>
 <body>
  <div id="myModal" class="modal">
    <div class="modal-content">
      <div class="modal-header">
        <h4 id="title"></h4>
        <span class="close">&times;</span>
      </div>
      <div class="modal-body">
        <p id="msg"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="button">닫기</button>
      </div>
    </div>
  </div>
 </body>
</html>
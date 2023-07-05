/**
 * 메인 스크립트 소스
 */
 
 
 //초기 화면 기본설정 값
let slideIndex = 0; //slide index
let intervalId; // setInterval의 ID

document.addEventListener('DOMContentLoaded', function() {
	
	//slideIndex값에 맞는 슬라이드 쇼를 보여주는것
	showSlides(slideIndex);

	let sec = 5000;//시간초 설정
	// 설정한 시간에 따라 슬라이드쇼 이동 
	intervalId = setInterval(function(){
		//자동으로 인덱스 값 증가
			slideIndex++;
			showSlides(slideIndex);
	}, sec);
	
});

//좌우 버튼을 클릭하면 실행
function moveSlides(n) {
	 slideIndex = slideIndex + n
	 showSlides(slideIndex);
	 resetInterval();
}
//써클 버튼을 클릭하면 실행
function currentSlide(n) {
	  slideIndex = n;
	  showSlides(slideIndex);
	  resetInterval();
}

//전체적인 이미지를 보여주는 메인 함수
function showSlides(n) {
	  
	  //보여줄 이미지의 className을 지정
	  let slides = document.getElementsByClassName("mySlides");
	  //보여줄 이미지에 맞는 써클을 지정
	  let dots = document.getElementsByClassName("dot");
	  //보여줄 이미지 총 개수를 가져오기
	  let size = slides.length;
	  
	  //만약 보여주려하는 index값이 이미지 총 index크기보다 크면 초기화
	  if ((n+1) > size) {
	    slideIndex = 0; n = 0;
	  }else if (n < 0) {
	    slideIndex = (size-1);
	    n = (size-1);
	  }
	  
	  //자동으로 display를 none 시켜준다.
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  //자동으로 변경되는 써클의 색을 바꾸기 위하여 해당되는 순서에 active라는 클래스 명을 없애준다. 
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  //해당되는 슬라이드 쇼를 보여준다.
	  slides[n].style.display = "block";
	  //해당되는 슬라이드 쇼써클에 active 클래스 명을 추가하여 색을 띄게 한다. 
	  dots[n].className += " active";
	}
	
//setInterval을 리셋하는 함수
function resetInterval() {
  clearInterval(intervalId); // 이전의 setInterval 제거
  let sec = 5000; // 시간초 설정
  intervalId = setInterval(function() {
    slideIndex++;
    showSlides(slideIndex);
  }, sec);
}
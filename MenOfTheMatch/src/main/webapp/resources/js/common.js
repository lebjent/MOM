	//자바스크립트 공통함수

	//공통AJAX post방식
	function fetchData(url, method, data) {
	  var options = {
	    method: method,
	    headers: {
	      'Content-Type': 'application/json' // Request header setting
	    }
	  };
	
	  if (method === 'POST') {
	    options.body = JSON.stringify(data); // Setting POST request body data
	  }
	
	  return fetch(url, options)
	    .then(response => {
	      if (response.ok) {
	        return response.json();
	      }
	      throw new Error('Request error');
	    })
	    .catch(error => {
	      console.error(error);
	    });
	}
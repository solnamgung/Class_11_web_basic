<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Speech to Text test</title>
</head>

	<body>
		<button id ="start">시작</button>
		<button id ="stop">종료</button>
	</body>
	
	<script>
		 	<!-- API call -->
		
		if(!("webkitSpeechRecognition" in window)) {
			alert("지원이 되지 않습니다. 크롬으로 가세요~!");
		} else {
			const speech = new webkitSpeechRecognition;
			
			document.getElementById("start").addEventListener("click", () => {
				speech.start();
			})
			
			document.getElementById("stop").addEventListener("click", () => {
				speech.stop();
			})
			
			speech.addEventListener("result", (event) => {
				const {transcript} = event["results"][0][0];
				console.log(transcript);
			})
		}
				
	</script>
</html>
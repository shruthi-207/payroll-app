<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="admin.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.send-button{
	border:0;
	width:9%;
	color:white;
	padding:8px;
	background:rgb(0 127 255);
	font-size:18px;
	position:absolute;
	margin:8px;	
}

</style>
</head>
<body>
<center>
<textarea id="text" rows="23" cols="150"></textarea><br>
<input id="har" id="typing-box" type="text" size="110">
<input type="submit" value="send" onclick="fun()">
</center>
</body>

<script>
	var soc = new WebSocket("ws://localhost:8080/payroll/serv");
	
	soc.onopen = function(){
		console.log("opened!!!!!!!");
	};
	soc.onmessage = function(str){
		var st = JSON.parse(str.data);
		text.value+=st.text+"\n";
	};
	
	function fun(){
		if(har.value!=""){
			var obj = {
				text:har.value	
			};
			var json = JSON.stringify(obj);
			soc.send(json);
			har.value="";
		}
	}

</script>
</body>
</html>
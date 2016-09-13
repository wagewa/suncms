<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<a class="addUser">新增用户</a> |
	<a class="getList">获取用户列表</a>
</body>
<script
	src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".addUser").click(function() {
			alert("aaa"); 
			$.ajax({
				type : 'POST',
				url : 'addUser',
				data : 'userName=user1&password=123456&email=user1@qq.com',
				success : function(msg) {
					alert(msg);
				}
			});
		});
		$(".getList").click(function() {
			$.ajax({
				type : 'POST',
				url : 'getList',/*async: false,*/
				data : 'page=1&pageSize=10',
				success : function(msg) {
					alert(msg);
				}
			});
		});
	});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<script src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){  
	$("#userList").datagrid({ 
		url:'${pageContext.request.contextPath}/users/getList',
		iconCls : 'icon-save',
		pagination : true,
		pageSize : 10,
		idField : 'id',
		sortName : 'id',
		sortOrder : 'asc',
		pageList : [10,20,30,40],
		fitColumns : true,
		columns:[[    
	          {field:'id',title:'编号',width:100,sortable:true},    
	          {field:'userName',title:'用户名',width:100,sortable:true},    
	          {field:'email',title:'邮箱',width:100,sortable:true},
	          {field:'sex',title:'性别',width:100,sortable:true}
	      ]]    
	});
});
</script>
<body>
<table id="userList">   
    
</table>  
</body>

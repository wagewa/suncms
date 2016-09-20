<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/skUtils.js"></script>

<script type="text/javascript">

</script>

<div class="easyui-layout" fit="true" border="false">
	<div data-options="region:'center'">
		<table id="modelList"></table>  
	</div>
</div>

<div id="modelMenu" class="easyui-menu" style="width:150px;">
	<div id="um-tabupdate" class="icon-edit">修改</div>
	<div id="um-tabdel" class="icon-remove">删除</div>
</div>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/skUtils.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/omnipotent/index.js"></script>
<style>
	#win table tr{ line-height: 30px;} 
</style>
<div class="easyui-layout" fit="true" border="false">
	<div data-options="region:'center'"> 
		<table id="list"></table>  
	</div>
</div>
<div id="win" class="easyui-window"  style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,minimizable:false">   
    <form method="post" id="omnipotentform">
    	<table style="width: 550px; margin-left: 30px;">
	    	<input type="hidden" name="modelId" value="${modelId}" />
	    	<input type="hidden" name="keys" value="" />
	    	<c:forEach var="l" items="${lists }">
	    		<tr>
		    		<td style="text-align: right;">${l.alias}:</td>
		    		<td style="text-align: left;"><input name="${l.name}" type="text"class="easyui-validatebox" data-options="required:true" /></td>
		    	</tr>
	    	</c:forEach>
	    	<tr style="text-align: center;">
	    		<td colspan="2"><a href="javascript:void(0)" style="width: 50px;" onclick="sk.admin.omnipotent.save();" class="easyui-linkbutton">确定</a> <a style="width: 50px;" href="javascript:void(0)" class="easyui-linkbutton">清空</a></td>
	    	</tr>
    	</table>
    </form>
</div>
 
<div id="menu" class="easyui-menu" style="width:150px;">
	<div id="um-tabupdate" class="icon-edit">修改</div>
	<div id="um-tabdel" class="icon-remove" onclick="sk.admin.field.del();">删除</div>
</div>
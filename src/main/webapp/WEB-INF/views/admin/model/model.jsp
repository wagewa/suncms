<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/skUtils.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/model/model.js"></script>
<style>
	#win table tr{ line-height: 30px;} 
</style>
<script type="text/javascript">
<!--

//-->

</script>
<div class="easyui-layout" fit="true" border="false">
	<div data-options="region:'center'">
		<table id="modelList"></table>  
	</div>
</div>

<div id="win" class="easyui-window"  style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,minimizable:false">   
    <form method="post" id="modelForm">
    	<table style="width: 550px; margin-left: 30px;">
	    	<tr>
	    		<td style="text-align: right;">模型名称:</td>
	    		<td style="text-align: left;"><input name="name" type="text" class="easyui-validatebox" data-options="required:true" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">模型表名:</td>
	    		<td style="text-align: left;"><input name="tableName" type="text"class="easyui-validatebox" data-options="required:true" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">列表显示字段:</td>
	    		<td style="text-align: left;"><input name="listFields" type="text" class="easyui-validatebox" data-options="required:true"   /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">模型介绍:</td>
	    		<td style="text-align: left;"><textarea name="introduce" class="easyui-validatebox" rows="" cols=""></textarea></td>
	    	</tr>
	    	<tr style="text-align: center;">
	    		<td colspan="2"><a href="javascript:void(0)" style="width: 50px;" onclick="sk.admin.model.save();" class="easyui-linkbutton">确定</a> <a style="width: 50px;" href="javascript:void(0)" class="easyui-linkbutton">清空</a></td>
	    	</tr>
    	</table>
    </form>
</div>
 
<div id="modelMenu" class="easyui-menu" style="width:150px;">
	<div id="um-tabfield" class="icon-edit" onclick="sk.admin.model.fieldUpdate();">字段</div>
	<div id="um-tabupdate" class="icon-edit">修改</div>
	<div id="um-tabdel" class="icon-remove" onclick="sk.admin.model.delModel();">删除</div>
</div>
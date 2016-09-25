<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/skUtils.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/model/feild.js"></script>
<style>
	#win table tr{ line-height: 30px;} 
</style>
<div class="easyui-layout" fit="true" border="false">
	<div data-options="region:'center'">
		<table id="fieldList"></table>  
	</div>
</div>

<div id="win" class="easyui-window"  style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,minimizable:false">   
    <form method="post" id="fieldForm">
    	<table style="width: 550px; margin-left: 30px;">
	    	<tr>
	    		<td style="text-align: right;">类型:</td>
	    		<td style="text-align: left;">
	    			<select name="type">
	    				<option value="text" value="text">单行文本</option>
	    				<option value="textarea" value="textarea">多行文本</option>
	    			</select>
	    			<input type="hidden" name="modelId" value="${modelId }" />
	    		</td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">字段名:</td>
	    		<td style="text-align: left;"><input name="name" type="text"class="easyui-validatebox" data-options="required:true" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">别名:</td>
	    		<td style="text-align: left;"><input name="alias" type="text" class="easyui-validatebox" data-options="required:true"   /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">是否必填:</td>
	    		<td style="text-align: left;">
	    			<input type="radio" name="isRequired" value="1" /> 是 <input type="radio" name="isRequired" value="0" /> 否
	    		</td>
	    	</tr>
	    	<tr style="text-align: center;">
	    		<td colspan="2"><a href="javascript:void(0)" style="width: 50px;" onclick="sk.admin.field.save();" class="easyui-linkbutton">确定</a> <a style="width: 50px;" href="javascript:void(0)" class="easyui-linkbutton">清空</a></td>
	    	</tr>
    	</table>
    </form>
</div>
 
<div id="fieldMenu" class="easyui-menu" style="width:150px;">
	<div id="um-tabupdate" class="icon-edit">修改</div>
	<div id="um-tabdel" class="icon-remove" onclick="sk.admin.field.del();">删除</div>
</div>
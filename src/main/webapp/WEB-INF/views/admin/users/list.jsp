<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<script src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.5/skUtils.js"></script>
<style>
	.searchForm{}
	.searchForm th{text-align: right; font-size: 12px;}
	.searchForm td input{width:150px;: left;}
	
</style>
<script type="text/javascript">
	var userList;
$(function(){
	userList = $("#userList").datagrid({ 
		url:'${pageContext.request.contextPath}/users/getList',
		iconCls : 'icon-save',
		title : '用户列表',
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
	      ]],
	      toolbar:[{
	    	  text : '新增',
	    	  iconCls : 'icon-add',
	    	  handler : function(){
	    		  
	    	  }
	      },'-',{
	    	  text : '修改',
	    	  iconCls : 'icon-edit',
	    	  handler : function(){
	    		  
	    	  }
	      },'-',{
	    	  text : '删除',
	    	  iconCls : 'icon-remove',
	    	  handler : function(){
	    		  
	    	  }
	      }],
	      onRowContextMenu : function(e,rowIndex,rowData){
	    	  $('#userMenu').menu('show', {
	  			left : e.pageX,
	  			top: e.pageY
	  		});
	    	var rows = userList.datagrid("getSelections");
	    	var urows = new Array();
	    	//console.info(rows);
	    	if(rows.length>0){
	    		$(rows).each(function(i,e){ 
	    			 var urow = userList.datagrid("getRowIndex",rows[i]);
	    			 urows[i] = urow;
	    		});
	    		for(var a=0;a<urows.length;a++){
	    			userList.datagrid("unselectRow",urows[a]);   
	    		}
	    	}
	    	userList.datagrid("selectRow",rowIndex); 
	  	    e.preventDefault();
	      }
	});
});

function searchForm(){
	userList.datagrid('load',{
		userName : $("#admin_user_searchForm").find("input[name='userName']").val()
	});
}

function clearForm(){
	$("#admin_user_searchForm").find("input[name='userName']").val('');
	userList.datagrid('load',{}); 
}
</script> 
<div class="easyui-layout" fit="true" border="false">
	<div data-options="region:'north',title:'搜 索'" style="height: 110px;overflow: hidden;">
		<form id="admin_user_searchForm">
			<table class="searchForm datagrid-toolbar" style="width:100%;height:100%;">
				 <tr>
				 	<th>用户名</th>
				 	<td><input name="userName"></td>
				 </tr>
				 <tr>
				 	<th>注册时间</th>
				 	<td><input name="regTime" class="easyui-datetimebox" editable="false" style="width: 155px;"> 至 <input class="easyui-datetimebox" style="width: 155px;" editable="false">
				 	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="searchForm()">查询</a>
				 	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm();">清空</a>
				 	</td>
				 </tr>
			</table>
		</form> 
	</div>
	<div data-options="region:'center'">
		<table id="userList"></table>  
	</div>
</div>

<div id="userMenu" class="easyui-menu" style="width:150px;">
	<div id="um-tabinsert" class="icon-add">新增</div>
	<div id="um-tabupdate" class="icon-edit">修改</div>
	<div id="um-tabdel" class="icon-remove">删除</div>
</div>

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
	#win table tr{ line-height: 30px;}
</style>
<script type="text/javascript">
	var userList;
$(function(){
	openUserForm();
	openUserEditForm(); 
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
	          {field:'id',title:'编号',width:100,sortable:true,checkbox:true}, 
	          {field:'userName',title:'用户名',width:100,sortable:true},    
	          {field:'email',title:'邮箱',width:100,sortable:true},
	          {
	        	  field:'sex',
	        	  title:'性别',
	        	  width:100,
	        	  sortable:true,
	        	  formatter : function(value,row,index){
	        		  switch (value) {
						case 1:
							return "男";
						case 2:
							return "女";
						default:
							return "保密";
							break;
					  }
	        	  }
	           },
	          {field:'birthday',title:'生日',width:100,sortable:true,formatter : function(value,row,index){
	        	  if(value!=null){
	        		  return sk.timeStamp2StringDate(value); 
	        	  }else{
	        		  return "";
	        	  }
	          }}
	      ]],
	      toolbar:[{
	    	  text : '新增',
	    	  iconCls : 'icon-add',
	    	  handler : function(){
	    		  $("#win").window("open");
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
	    		  delUsers();
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
	$("#um-tabupdate").click(function(){
		edit();
	});
	$("#um-tabdel").click(function(){ 
		delUsers();
	});
});

function searchForm(){
	userList.datagrid('load',{
		userName : $("#admin_user_searchForm").find("input[name='userName']").val()
	});
}

function openUserForm(){
	 $("#win").window({
		 title: '新增用户',
	     modal: true,
	     shadow: true,
	     closed: true,
	     resizable:false
	 });
}

function openUserEditForm(){
	 $("#winEdit").window({
		 title: '编辑用户',
	     modal: true,
	     shadow: true,
	     closed: true,
	     resizable:false
	 });
}

function clearForm(){
	$("#admin_user_searchForm").find("input[name='userName']").val('');
	userList.datagrid('load',{}); 
}

function edit(){
	var rows = userList.datagrid("getSelections");
	if(rows.length==0){
		$.messager.alert("警告","请选择需要修改的记录!");
		return false;
	}else if(rows.length>1){
		$.messager.alert("警告","只能修改一条数据!");
	}
	$("#userEditForm").find("input[name='userName']").val(rows[0].userName);
	$("#userEditForm").find("input[name='email']").val(rows[0].email);
	$("#editBirthday").datebox('setValue', sk.timeStamp2StringDate(rows[0].birthday));
	$("#userEditForm").find("input[name='id']").val(rows[0].id);
	$("#userEditForm").find("select[name='sex']").find("option[value='"+rows[0].sex+"']").attr("selected",true);
	$("#userEditForm").find("input[name='isValidated']").each(function(i,e){
		if($(e).val() == rows[0].isValidated){
			$(e).attr("checked","checked"); 
		}
	});
	$("#winEdit").window("open"); 
}

function saveUser(){
	if($("#userForm").form("validate")){ 
		$("#userForm").form('submit', {    
		    url:"${pageContext.request.contextPath}/users/addUser",    
		    onSubmit: function(param){    
		        if($("#userForm").find("input[name='password']").val()!=$("#userForm").find("input[name='rpassword']").val()){
		        	$.messager.alert("警告","两次密码不一致");
		        	return false;
		        }
		    },    
		    success:function(data){    
		        if(data>0){
		        	$.messager.alert("提示","新增用户成功!");
		        	$("#win").window("close");
		        	userList.datagrid('load',{});
		        }else{
		        	$.messager.alert("警告","系统忙，请稍后再试!");
		        }
		    }    
		});  
	}
}

function editUser(){
	if($("#userEditForm").form("validate")){ 
		$("#userEditForm").form('submit', {    
		    url:"${pageContext.request.contextPath}/users/addUser",    
		    onSubmit: function(){    
		        if($("#userEditForm").find("input[name='password']").val()!=$("#userEditForm").find("input[name='rpassword']").val()){
		        	$.messager.alert("警告","两次密码不一致");
		        	return false;
		        }
		    },    
		    success:function(data){    
		        if(data>0){
		        	$.messager.alert("提示","修改用户成功!");
		        	$("#win").window("close");
		        	userList.datagrid('load',{});
		        }else{
		        	$.messager.alert("警告","系统忙，请稍后再试!");
		        }
		    }    
		});  
	}
}

function delUsers(){
	var rows = userList.datagrid("getSelections");
	if(rows.length>0){
		$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		    if (r){    
		        var row = new Array();
		        $(rows).each(function(i,e){
		        	row[i] = rows[i].id;
		        });
		        //console.info(row.join(","));
		        $.ajax({
		        	type:'POST',
		        	url:'${pageContext.request.contextPath}/users/delUsers',
		        	data:'ids='+row.join(","),
		        	success:function(msg){
		        		if(msg > 0){
		        			$.messager.alert("提示","删除成功!");
		        			userList.datagrid("load");
		        		}else{
		        			$.messager.alert("错误","系统忙，请稍后再试!");
		        		}
		        	}});
		    }
		});  
	}else{
		$.messager.alert("警告","请选择需要删除的记录!");
	}
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
					 	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="searchForm();">查询</a>
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
	<div id="um-tabupdate" class="icon-edit">修改</div>
	<div id="um-tabdel" class="icon-remove">删除</div>
</div>

<div id="win" class="easyui-window"  style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,minimizable:false">   
    <form method="post" id="userForm">
    	<table style="width: 550px; margin-left: 30px;">
	    	<tr>
	    		<td style="text-align: right;">用户名:</td>
	    		<td style="text-align: left;"><input name="userName" type="text" class="easyui-validatebox" data-options="required:true" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">密 码:</td>
	    		<td style="text-align: left;"><input name="password" type="password" id="password" class="easyui-validatebox" data-options="required:true" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">确认密码:</td>
	    		<td style="text-align: left;"><input name="rpassword" type="password" class="easyui-validatebox" data-options="required:true" validType="equals['#password']"  /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">邮 箱:</td>
	    		<td style="text-align: left;"><input name="email" type="text" class="easyui-validatebox" data-options="required:true,validType:'email'" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">性别:</td>
	    		<td style="text-align: left;"><select name="sex"><option value="0">保密</option><option value="1">男</option><option value="2">女</option></select></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">生日:</td>
	    		<td style="text-align: left;"><input type="text" editable="false" name="birthday" class="easyui-datebox" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">是否生效:</td>
	    		<td style="text-align: left;"><input type="radio" name="isValidated" value="1" checked="checked" />是 <input type="radio" name="isValidated" value="0" />否</td>
	    	</tr>
	    	<tr style="text-align: center;">
	    		<td colspan="2"><a href="javascript:void(0)" style="width: 50px;" onclick="saveUser();" class="easyui-linkbutton">确定</a> <a style="width: 50px;" href="javascript:void(0)" class="easyui-linkbutton">清空</a></td>
	    	</tr>
    	</table>
    </form>
</div> 


<div id="winEdit" class="easyui-window"  style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,minimizable:false">   
    <form method="post" id="userEditForm">
    	<table style="width: 550px; margin-left: 30px;">
	    	<tr>
	    		<td style="text-align: right;">用户名:</td>
	    		<td style="text-align: left;"><input name="userName" type="text" class="easyui-validatebox" data-options="required:true" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">密 码:</td>
	    		<td style="text-align: left;"><input name="password" type="password" id="password" class="easyui-validatebox"  /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">确认密码:</td>
	    		<td style="text-align: left;"><input name="rpassword" type="password" class="easyui-validatebox"  /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">邮 箱:</td>
	    		<td style="text-align: left;"><input name="email" type="text" class="easyui-validatebox" data-options="required:true,validType:'email'" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">性别:</td>
	    		<td style="text-align: left;"><select name="sex"><option value="0">保密</option><option value="1">男</option><option value="2">女</option></select></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">生日:</td>
	    		<td style="text-align: left;"><input type="text" editable="false" id="editBirthday" name="birthday" class="easyui-datebox" /></td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">是否生效:</td>
	    		<td style="text-align: left;"><input type="radio" name="isValidated" value="1" checked="checked" />是 <input type="radio" name="isValidated" value="0" />否</td>
	    	</tr>
	    	<tr style="text-align: center;">
	    		<td colspan="2"> 
	    			<input type="hidden" name="id" value="" />
	    			<a href="javascript:void(0)" style="width: 50px;" onclick="editUser();" class="easyui-linkbutton">确定</a> <a style="width: 50px;" href="javascript:void(0)" class="easyui-linkbutton">清空</a>
	    		</td>
	    	</tr>
    	</table>
    </form>
</div> 

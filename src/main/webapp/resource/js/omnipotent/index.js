$(function() {
	sk.ns("sk.admin.omnipotent");
	sk.admin.omnipotent.getField = function(){
		$.ajax({
        	type:'POST',
        	url:sk.getRootPath()+'/field/getFeildList',
        	data:'page=1&rows=100&sort=id&order=asc&modelId='+sk.admin.omnipotent.modelId,
        	async: false, 
        	success:function(msg){
        		var list = msg.rows;
        		//$("#form").find("tr").remove();
        		var keys = "";
        		for(var i=0;i<list.length;i++){
        			var column={};
        			sortable : true,
        			column['field'] = list[i].name;
        			column['title'] = list[i].alias;
        			column['width'] = 100;
        			column['sortable'] = true;
        			sk.admin.omnipotent.columns.push(column);
        			/*var tr = $("<tr></tr>");
        			var td1 = $("<td style='text-align: right;'>"+list[i].alias+":</td>");
        			var td2 = $("<td style='text-align: left;'><input type='"+list[i].type+"' name='"+list[i].name+"' /></td>");
        			tr.append(td1).append(td2);
        			$("#omnipotentform").before(tr); */
        			if(i == list.length-1){
        				keys += list[i].name;
        			}else{
        				keys += list[i].name+",";
        			}
        		}
        		$("#omnipotentform").find("input[name='keys']").val(keys); 
        		/*var tr1 = "<tr style='text-align: center;'><td colspan='2'><a href='javascript:void(0)' style='width: 50px;' onclick='sk.admin.field.save();' class='easyui-linkbutton'>确定</a> <a style='width: 50px;' href='javascript:void(0)' class='easyui-linkbutton'>清空</a></td></tr>";
        		$("#form").append(tr1);*/  
        	}});
	}
	sk.admin.omnipotent.modelId = $("input[name='modelId']").val();
	sk.admin.omnipotent.columns=new Array();
	var co = {};
	co['field'] = 'id';
	co['title'] = '编号';
	co['width'] = 100;
	co['sortable'] = true;
	co['checkbox'] = true;
	sk.admin.omnipotent.columns.push(co);
	sk.admin.omnipotent.getField(); 
	$("#win").window({  
		 title: '字段信息',
	     modal: true,
	     shadow: true,
	     closed: true,
	     resizable:false
	 });
	sk.admin.omnipotent.list = $("#list").datagrid({
		url : sk.getRootPath()+'/omnipotent/getList',
		iconCls : 'icon-save',
		title : '字段列表',
		pagination : true,
		pageSize : 10,
		idField : 'id',
		sortName : 'id',
		sortOrder : 'asc',
		pageList : [ 10, 20, 30, 40 ],
		fitColumns : true,
		columns : [ sk.admin.omnipotent.columns],
		toolbar : [ {
			text : '新增',
			iconCls : 'icon-add',
			handler : function() {
				$("#win").window("open");
			}
		}, '-', {
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {
	
			}
		}, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {
				sk.admin.field.del();
			}
		} ],
		onRowContextMenu : function(e, rowIndex, rowData) {
			$('#menu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
			var rows = sk.admin.omnipotent.list.datagrid("getSelections");
			var urows = new Array();
			// console.info(rows);
			if (rows.length > 0) {
				$(rows).each(function(i, e) {
					var urow = sk.admin.omnipotent.list.datagrid("getRowIndex", rows[i]);
					urows[i] = urow;
				});
				for (var a = 0; a < urows.length; a++) {
					sk.admin.omnipotent.list.datagrid("unselectRow", urows[a]);
				}
			}
			sk.admin.omnipotent.list.datagrid("selectRow", rowIndex);
			e.preventDefault();
		}
	});
	
	sk.admin.omnipotent.save = function(){
		if($("#omnipotentform").form("validate")){ 
			$("#omnipotentform").form('submit', {
			    url:sk.getRootPath()+"/omnipotent/save",
			    onSubmit: function(param){    
			    },    
			    success:function(data){    
			        if(data>0){
			        	$.messager.alert("提示","新字段成功!");
			        	$("#omnipotentform").form("clear"); 
			        	$("#win").window("close");
			        	sk.admin.omnipotent.list.datagrid('load',{});
			        }else{
			        	$.messager.alert("警告","系统忙，请稍后再试!");
			        }
			    }    
			});  
		}
	}
	
	sk.admin.omnipotent.del = function(){
		var rows = sk.admin.omnipotent.list.datagrid("getSelections");
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
			        	url:sk.getRootPath()+'/omnipotent/del',
			        	data:'ids='+row.join(","),
			        	success:function(msg){
			        		if(msg > 0){
			        			$.messager.alert("提示","删除成功!");
			        			sk.admin.omnipotent.list.datagrid("load");
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
	
	
});
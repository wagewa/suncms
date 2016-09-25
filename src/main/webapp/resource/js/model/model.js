$(function(){
	sk.ns("sk.admin.model"); 
	$("#win").window({
		 title: '模型信息',
	     modal: true,
	     shadow: true,
	     closed: true,
	     resizable:false
	 });
	sk.admin.model.modelList = $("#modelList").datagrid({
		url : sk.getRootPath()+'/modelManage/getModelList',
		iconCls : 'icon-save',
		title : '模型列表',
		pagination : true,
		pageSize : 10,
		idField : 'id',
		sortName : 'id',
		sortOrder : 'asc',
		pageList : [ 10, 20, 30, 40 ],
		fitColumns : true,
		columns : [ [ {
			field : 'id',
			title : '编号',
			width : 100,
			sortable : true,
			checkbox : true
		}, {
			field : 'name',
			title : '模型名',
			width : 100,
			sortable : true
		}, {
			field : 'tableName',
			title : '模型表明',
			width : 100,
			sortable : true
		}, {
			field : 'listFields',
			title : '列表调用字段',
			width : 100,
			sortable : true
		}, {
			field : 'introduce',
			title : '模型介绍',
			width : 100
		} ] ],
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
				sk.admin.model.delModel();
			}
		} ],
		onRowContextMenu : function(e, rowIndex, rowData) {
			$('#modelMenu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
			var rows = sk.admin.model.modelList.datagrid("getSelections");
			var urows = new Array();
			// console.info(rows);
			if (rows.length > 0) {
				$(rows).each(function(i, e) {
					var urow = sk.admin.model.modelList.datagrid("getRowIndex", rows[i]);
					urows[i] = urow;
				});
				for (var a = 0; a < urows.length; a++) {
					sk.admin.model.modelList.datagrid("unselectRow", urows[a]);
				}
			}
			sk.admin.model.modelList.datagrid("selectRow", rowIndex);
			e.preventDefault();
		}
	});
	
	
	
	/**
	 * 保存
	 */
	sk.admin.model.save = function(){
		if($("#modelForm").form("validate")){ 
			$("#modelForm").form('submit', {
			    url:sk.getRootPath()+"/modelManage/saveModel",    
			    onSubmit: function(param){    
			    },    
			    success:function(data){    
			        if(data>0){
			        	$.messager.alert("提示","新增模型成功!");
			        	$("#modelForm").form("clear"); 
			        	$("#win").window("close");
			        	sk.admin.model.modelList.datagrid('load',{});
			        }else{
			        	$.messager.alert("警告","系统忙，请稍后再试!");
			        }
			    }    
			});  
		}
	}
	
	/**
	 * 删除
	 */
	sk.admin.model.delModel = function(){
		var rows = sk.admin.model.modelList.datagrid("getSelections");
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
			        	url:sk.getRootPath()+'/modelManage/delModel',
			        	data:'ids='+row.join(","),
			        	success:function(msg){
			        		if(msg > 0){
			        			$.messager.alert("提示","删除成功!");
			        			sk.admin.model.modelList.datagrid("load");
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
	
	sk.admin.model.fieldUpdate = function(){
		// alert(rows[0].id);
		var rows = sk.admin.model.modelList.datagrid("getSelections"); 
		$('#modelMenu').menu('hide'); 
		window.parent.addTab(rows[0].name,"/suncms/field/index?modelId="+rows[0].id,'icon icon-seticon-role'); 
	}
	
	sk.admin.model.createFrame = function(url)
	{
		var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
		return s;
	}
});

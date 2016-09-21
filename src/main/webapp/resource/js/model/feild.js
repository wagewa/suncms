$(function() {
	sk.ns("sk.admin.field");
	$("#win").window({
		 title: '字段信息',
	     modal: true,
	     shadow: true,
	     closed: true,
	     resizable:false
	 });
	sk.admin.field.fieldList = $("#fieldList").datagrid({
		url : sk.getRootPath()+'/field/getFeildList',
		iconCls : 'icon-save',
		title : '字段列表',
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
			title : '字段名',
			width : 100,
			sortable : true
		}, {
			field : 'alias',
			title : '别名',
			width : 100,
			sortable : true
		}, {
			field : 'type',
			title : '字段类型',
			width : 100,
			sortable : true
		}, {
			field : 'isRequired',
			title : '是否别填',
			width : 100,
			sortable : true,
			formatter : function(value,row,index){
				if(value==0)
					return "否";
				else
					return "是";
			}
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
				sk.admin.field.delfield();
			}
		} ],
		onRowContextMenu : function(e, rowIndex, rowData) {
			$('#fieldMenu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
			var rows = sk.admin.field.fieldList.datagrid("getSelections");
			var urows = new Array();
			// console.info(rows);
			if (rows.length > 0) {
				$(rows).each(function(i, e) {
					var urow = sk.admin.field.fieldList.datagrid("getRowIndex", rows[i]);
					urows[i] = urow;
				});
				for (var a = 0; a < urows.length; a++) {
					sk.admin.field.fieldList.datagrid("unselectRow", urows[a]);
				}
			}
			sk.admin.field.fieldList.datagrid("selectRow", rowIndex);
			e.preventDefault();
		}
	});
});
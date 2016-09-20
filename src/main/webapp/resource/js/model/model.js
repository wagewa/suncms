sk.admin.modelList = $("#modelList").datagrid({
	url : sk.getRootPath+'/users/getList',
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
		field : 'modelName',
		title : '用户名',
		width : 100,
		sortable : true
	}, {
		field : 'email',
		title : '邮箱',
		width : 100,
		sortable : true
	}, {
		field : 'sex',
		title : '性别',
		width : 100,
		sortable : true,
		formatter : function(value, row, index) {
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
	}, {
		field : 'birthday',
		title : '生日',
		width : 100,
		sortable : true,
		formatter : function(value, row, index) {
			if (value != null) {
				return sk.timeStamp2StringDate(value);
			} else {
				return "";
			}
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
			delUsers();
		}
	} ],
	onRowContextMenu : function(e, rowIndex, rowData) {
		$('#modelMenu').menu('show', {
			left : e.pageX,
			top : e.pageY
		});
		var rows = sk.admin.modelList.datagrid("getSelections");
		var urows = new Array();
		// console.info(rows);
		if (rows.length > 0) {
			$(rows).each(function(i, e) {
				var urow = sk.admin.modelList.datagrid("getRowIndex", rows[i]);
				urows[i] = urow;
			});
			for (var a = 0; a < urows.length; a++) {
				sk.admin.modelList.datagrid("unselectRow", urows[a]);
			}
		}
		sk.admin.modelList.datagrid("selectRow", rowIndex);
		e.preventDefault();
	}
});


/*
 * name：jquery.pageUtil-1.0.0.js
 * version:1.0.0
 * auth:sunkun
 * date:2016年7月3日 下午5:39:08
 * 
 */
;(function($) {
	var methods = {
		loadData : function(options) {
			var pageIndexName = options.pagination.params.pageIndex;
			var pageIndex = options.pagination.pageIndex;
			var pageSizeName = options.pagination.params.pageSize;
			var pageSize = options.pagination.pageSize;
			var _this = this;
			var urlData = pageIndexName + "=" + pageIndex + "&" + pageSizeName
					+ "=" + pageSize;
			if (options.params)
				urlData += methods["getParams"].call(this, options.params);
			$.ajax({
				type : options.type,
				url : options.url,
				data : urlData,
				success : function(msg) {
					var obj = JSON.parse(msg);
					methods["showData"].call(_this, options, obj);
				}
			});
		},
		showData : function(options, data) {
			var list = data.list;
			$(options.pagination.obj).find("tr:gt(0)").remove();
			for (var i = 0; i < list.length; i++) {
				var tr = $("<tr></tr>");
				var columns = options.columns[0];
				for (var r = 0; r < columns.length; r++) {
					var content = columns[r].onrender ? columns[r]
							.onrender(list[i][columns[r].field])
							: list[i][columns[r].field];
					var td = $("<td>" + content + "</td>");
					tr.append(td);
				}
				$(options.pagination.obj).append(tr);
			}
			methods["showPage"].call(this, options, data.total,
					options.pagination.pageObj);
		},
		showPage : function(options, total, obj) {
			var pageCount = options.pageCount;
			var page = options.pagination.page;
			$(obj).find("a").remove();
			if (page == 1) {
				$(obj).append("<a href='javascript:void(0);'>首页</a>");
			} else {
				var a = methods["returnPage"].call(this, options, "首页", 1);
				$(obj).append(a);
			}
			if (page > 1) {
				var a = methods["returnPage"].call(this, options, "上一页",
						parseInt(page) - 1);
				$(obj).append(a);
			} else {
				$(obj).append("<a href='javascript:void(0);'>上一页</a>");
			}
			var count = Math.ceil(total / pageCount);
			var a = 0;
			var i1 = page > 1 ? page - 1 : page;
			for (var i = i1; i <= count; i++) {
				if (page == i) {
					$(obj).append(
							"<a href='javascript:void(0);' class='pageOn'>" + i
									+ "</a>");
				} else {
					var a1 = methods["returnPage"].call(this, options, i, i);
					$(obj).append(a1);
				}
				a++;
				if (a == 5) {
					if (i < count) {
						$(obj).append("<a href='javascript:void(0)'>...</a>");
						var a = methods["returnPage"].call(this, options,
								count, count);
						$(obj).append(a);
					}
					break;
				}
			}
			if (page < count) {
				var a = methods["returnPage"].call(this, options, "下一页",
						parseInt(page) + 1);
				$(obj).append(a);
			} else {
				$(obj).append("<a href='javascript:void(0);'>下一页</a>");
			}
			if (page < count) {
				var a = methods["returnPage"].call(this, options, "末页", count);
				$(obj).append(a);
			} else {
				$(obj).append("<a href='javascript:void(0);'>末页</a>");
			}
		},
		returnPage : function(options, msg, currentPage) {
			var a = $("<a href='javascript:void(0);'>" + msg + "</a>");
			a.bind("click", function() {
				options.pagination.page = currentPage;
				$(options.pagination.obj).myPageUtil(options);
			});
			return a;
		},
		getParams : function(params) {
			var str = "";
			for (var i = 0; i < params.length; i++) {
				if (params[i].val != '') {
					str += "&" + params[i].field + "=" + params[i].val;
				} else {
					if (params[i].type == "txt") {
						str += "&" + params[i].field + "="
								+ $(params[i].obj).text();
					} else {
						str += "&" + params[i].field + "="
								+ $(params[i].obj).val();
					}
				}
			}
			return str;
		}
	}

	$.fn.myPageUtil = function(options) {
		var defaults = {}
		var options = $.extend(defaults, options);
		this.each(function() {
			var page = options.pagination.page;
			var pageCount = options.pageCount;
			options.pagination.pageIndex = (page * pageCount - pageCount) + 1;
			options.pagination.pageSize = page * pageCount;
			var id = $(this).attr("id");
			options.pagination.obj = $(id);
			methods["loadData"].call(this, options);
		});
		return this;
	};
})(jQuery)
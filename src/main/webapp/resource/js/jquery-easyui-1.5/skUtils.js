var sk = $.extend({}, sk);

$(function() {
	sk.ceshi = function() {
		alert("aaa");
	}

	// js获取项目根路径，如： http://localhost:8083/uimcardprj
	sk.getRootPath = function() {
		// 获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
		var curWwwPath = window.document.location.href;
		// 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		// 获取主机地址，如： http://localhost:8083
		var localhostPaht = curWwwPath.substring(0, pos);
		// 获取带"/"的项目名，如：/uimcardprj
		var projectName = pathName.substring(0,
				pathName.substr(1).indexOf('/') + 1);
		return (localhostPaht + projectName);
	}

	/**
	 * 增加命名空间功能
	 * 
	 * 使用方法：sk.ns('jQuery.bbb.ccc','jQuery.eee.fff');
	 */
	sk.ns = function() {
		var o = {}, d;
		for (var i = 0; i < arguments.length; i++) {
			d = arguments[i].split(".");
			o = window[d[0]] = window[d[0]] || {};
			for (var k = 0; k < d.slice(1).length; k++) {
				o = o[d[k + 1]] = o[d[k + 1]] || {};
			}
		}
		return o;
	};

	/**
	 * 格式化时间(精确到天)
	 */
	sk.timeStamp2StringDate = function(time) {
		var datetime = new Date();
		datetime.setTime(time);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0"
				+ (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate()
				: datetime.getDate();
		var hour = datetime.getHours() < 10 ? "0" + datetime.getHours()
				: datetime.getHours();
		var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes()
				: datetime.getMinutes();
		var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds()
				: datetime.getSeconds();
		return year + "-" + month + "-" + date;
	}

	/**
	 * 格式化时间(精确到秒)
	 */
	sk.timeStamp2StringSecond = function(time) {
		var datetime = new Date();
		datetime.setTime(time);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0"
				+ (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate()
				: datetime.getDate();
		var hour = datetime.getHours() < 10 ? "0" + datetime.getHours()
				: datetime.getHours();
		var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes()
				: datetime.getMinutes();
		var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds()
				: datetime.getSeconds();
		return year + "-" + month + "-" + date + " " + hour + ":" + minute
				+ ":" + second;
	}
});
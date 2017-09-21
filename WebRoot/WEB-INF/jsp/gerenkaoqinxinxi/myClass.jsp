<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'main.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${ctx}/css/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<style type="text/css">
#header tr th {
	text-align: center;
	width: 90px;
	font-size: 15px;
	font-weight: 600;
	background: #fafafa;
}

#tbodyGeRenPaiBanXinXi tr td {
	height: 80px;
	text-align: center;
}

.showdiv {
	display: none;
}

.divBanZu {
	font-size: 15px;
	font-weight: 600;
}

.BanDuanTiShi {
	z-index: 100;
	background: rgb(52, 154, 184);
	text-align: center;
	max-width: 350px;
	min-width: 200px;
	position: absolute;
	color: white;
	position: absolute;
	position: absolute;
}

.tubiao {
	position: relative;
	width: 0;
	height: 0;
	border-color: rgba(199, 28, 28, 0);
	border-style: solid;
	bottom: 0;
	left: 47%;
	top: 29px;
	margin-left: -5px;
	border-width: 30px 26px 0px 0px;
	border-top-color: rgb(52, 154, 184);
}

.banci {
	padding-top: 20px;
	font-size: 20px;
}
</style>
<SCRIPT type="text/javascript">
	$(function() {
		bangDingNianFen();
		RiQiChange();
	});
	/** 绑定年份下拉框 **/
	function bangDingNianFen() {
		var date = new Date();
		var nianfen = date.getFullYear();
		var yue = date.getMonth();
		var shu = parseInt(nianfen) - 4;
		$("#cboNianFen").empty();
		for ( var i = 0; i < 9; i++) {
			var html = "<option value='" + (shu + i) + "'>" + (shu + i)
					+ "年</option>";
			$("#cboNianFen").append(html);
		}
		;
		/*选上当前年月 */
		$("#cboNianFen").val(nianfen);
		$("#cboYueFen").val(yue + 1);
	}

	/**日期改变时触发**/
	function RiQiChange() {
		var nianfen = $("#cboNianFen").val();
		var yuefen = $("#cboYueFen").val();
		var yuediyitian = nianfen + "-" + yuefen + "-01";
		var yuezuihouyitian = nianfen + "-" + yuefen + "-"
				+ getDaysInOneMonth(nianfen, yuefen);
		var chuyi = new Date(yuediyitian);
		var yuewei = new Date(yuezuihouyitian);
		var diyitianxinqi = chuyi.getDay() == 0 ? 7 : chuyi.getDay();
		var zuihouyitianxinqi = yuewei.getDay();
		var one = addDate(yuediyitian, (1 - diyitianxinqi));
		var tianshu = getDaysInOneMonth(nianfen, yuefen);//获取月份天数
		var tds = $("#tbodyGeRenPaiBanXinXi tr td");
		for ( var i = 0; i < 42; i++) {
			$(tds[i]).empty();
			var riqi = addDate(one, i);
			$(tds[i]).attr("id", riqi);
			$(tds[i]).append(
					"<span style='font-weight: 900;color: #999!important;'>"
							+ riqi + "</span>");
		}
		var data = ajax("${ctx}/PersonAttendance/selectMyClass.do?beginDate="
				+ yuediyitian + "&endDate=" + yuezuihouyitian + "&staffid=${user.staffid}");
		for ( var i = 0; i < data.length; i++) {
			var workdate = data[i].workDate;
			var kaoqinleibie= data[i].dealWithName;
			if ($("#" + data[i].workDate + " div[name='Class']").length == 0) {
				$("#" + workdate).attr("onmouseover",
						"showBanDuanXinXi(event,this)");
				$("#" + workdate).attr("onmouseout",
						"hideBanDuanXinXi(event,this)");
				$("#" + workdate)
						.append(
								"<div name='Class' class='banci'>"
										+ data[i].classesName
										+ "</div><div id='BD"+workdate+"' class='showdiv'></div>");
			}
			if ($("#BD" + workdate + " div[name='Group']").length == 0) {
				$("#BD" + workdate).append(
						"<div name='Group' class='divBanZu'>你被安排在‘"
					+ data[i].groupName + "’中</div>");
			}
			$("#BD" + workdate).append(
					"<div>起始刷卡时间：" +(data[i].startChargeTime.toString().length>0?data[i].startChargeTime.toString().substring(11,16):"----")
							+ "</div><div>考勤班段：" + (data[i].goToWorkTime.toString().length>0?data[i].goToWorkTime.toString().substring(11,16):"----")+ "～"
							+  (data[i].timeFromWork.toString().length>0?data[i].timeFromWork.toString().substring(11,16):"----")
							+"("+data[i].dealWithName+")"+ "</div><div>  终止刷卡时间："
							+(data[i].endChargeTime.toString().length>0?data[i].endChargeTime.toString().substring(11,16):"----") + "</div>");
		}

	}
	/** 显示班段信息* */
	function showBanDuanXinXi(event, td) {
		$("#showAndhide").empty();
		$("#showAndhide").append(
				$(td).find("div[class='showdiv']")[0].innerHTML);
		$("#showAndhide").append("<div class='tubiao'></div>");
		$("#showAndhide")[0].style.left = td.getBoundingClientRect().left
				+ "px";
		$("#showAndhide")[0].style.top = (td.getBoundingClientRect().top
				- $("#showAndhide")[0].offsetHeight - 40)
				+ "px";
	}
	/** 隐藏班段信息 **/
	function hideBanDuanXinXi(event, tb) {
		$("#showAndhide").empty();
	}
	/**获取月份有多少天**/
	function getDaysInOneMonth(year, month) {
		month = parseInt(month, 10);
		var d = new Date(year, month, 0);
		return d.getDate();
	}

	/*日期天数加减 */
	function addDate(date, days) {
		var d = new Date(date);
		d.setDate(d.getDate() + days);
		var month = d.getMonth() + 1;
		var day = d.getDate();
		if (month < 10) {
			month = "0" + month;
		}
		if (day < 10) {
			day = "0" + day;
		}
		var val = d.getFullYear() + "-" + month + "-" + day;
		return val;
	}
	/** 封装的ajax **/
	function ajax(url) {
		var mydata;
		$.ajax({
			async : false,
			type : 'post',
			url : url,
			dataType : "json",
			scriptCharset : "utf-8",
			success : function(data) {
				mydata = data;
			}
		});
		return mydata;
	}
</script>
<body style="text-align: center" onclick="hideMenu()">

	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
			<li><a href="#">我的考勤</a></li>
			<li class="active">我的班次</li>
		</ul>
	</div>
	<div id="showAndhide" class="BanDuanTiShi"></div>
	<div style="overflow-y: scroll;max-height: 550px;">
		<div style="text-align: center;padding-top: 10px;">
			<div style="display: inline-block;">
				<select id="cboNianFen" onchange="RiQiChange()"
					style="width: 100px;font-size: 18px; position: relative;top:4px;">
				</select>
			</div>
			<div style="display: inline-block;">
				<select id="cboYueFen" onchange="RiQiChange()"
					style=" width: 100px;font-size: 18px; position: relative;top:4px;">
					<option value="1">1月</option>
					<option value="2">2月</option>
					<option value="3">3月</option>
					<option value="4">4月</option>
					<option value="5">5月</option>
					<option value="6">6月</option>
					<option value="7">7月</option>
					<option value="8">8月</option>
					<option value="9">9月</option>
					<option value="10">10月</option>
					<option value="11">11月</option>
					<option value="12">12月</option>
				</select>
			</div>
		</div>
		<div style="padding-left: 10px;">
			<table border="1" class="table"
				style=" max-width: 99%;min-width: 99%;" id="tbGudinglunban">
				<thead id="header">
					<tr>
						<th>星期一</th>
						<th>星期二</th>
						<th>星期三</th>
						<th>星期四</th>
						<th>星期五</th>
						<th>星期六</th>
						<th>星期日</th>
					</tr>
				</thead>
				<tbody id="tbodyGeRenPaiBanXinXi" class="tbody">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>


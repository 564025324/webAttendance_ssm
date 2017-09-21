
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ResourceBundle res = ResourceBundle.getBundle("morenkaoqingzhidu");
	request.setAttribute("res", res);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
.thistop {
	padding-left: 15px;
	padding-top: 9px;
}
.tbody tr td {
	text-align: center;
	vertical-align: middle;
}

#tbodyKaoQingLeiBie tr td {
	text-align: center;
	vertical-align: middle;
}

#tbodyKaoqinleibiemingxi tr td {
	text-align: center;
	vertical-align: middle;
}

#tbAdd_eitd tr td {
	text-align: center;
	vertical-align: middle;
}

.table_hover tr:HOVER {
	background-color: rgba(98, 168, 209, 0.11);
}

.trClass {
	background: rgba(98, 168, 209, 0.11);
}

.div-c {
	float: left;
	width: 26%;
	height: 350px;
	top: 7px;
	left: 5px;
}

.div-d {
	background: white;
	height: 350px;
	float: left;
	width: 18%;
	border: 1px solid #e8e3e3;
}

.div-e {
	float: left;
	width: 80%;
}

.div-a {
	background: rgba(243, 243, 243, 0.4);
	float: left;
	width: 70%;
	top: 42px;
	left: 25px;
	position: relative;
	height: 350px;
	border: 1px solid #e8e3e3;
}

.tbStyle tr td {
	padding: 7px;
	font-size: 18px;
}

.tbHide {
	display: none;
}

.header th {
	text-align: center;
}
</style>
<SCRIPT type="text/javascript">
	var systemId;
	$(document).ready(function() {
		selectSystem();
		$("#signUpForm").validate({
			rules : {
				username : "required",
			}
		});
	});
	/**查询所有考勤制度**/
	function selectSystem() {
		var data = ajax("${ctx}/SetSystem/selectSystems.do");
		$("#tbodyZhiDu").empty();
		for ( var i = 0; i < data.length; i++) {
			var html = "<tr onclick='onclickSystemRow(this," + data[i].systemid
					+ ")' >" + "<td><a href='javascript:deleteSystem("
					+ data[i].systemid
					+ ")'>【删除】</a><a href=javascript:updateSystem("
					+ data[i].systemid + ",'" + data[i].systemnumber + "','"
					+ data[i].systemname + "')>【编辑】</a></td>" + "<td>"
					+ data[i].systemnumber + "</td>" + "<td>"
					+ data[i].systemname + "</td></tr>";
			$("#tbodyZhiDu").append(html);
		}

	}
	/** 删除制度 **/
	function deleteSystem(systemId) {
		if (confirm("是否确定删除此考勤制度")) {
			var data = ajax("${ctx}/SetSystem/deleteSystemsAndMx.do?systemid="
					+ systemId);
			if (data == "1") {
				alert("删除成功");
				selectSystem();
				$("#tbodyZhiDuMingXi").empty();
			} else {
				alert("无法删除，因为有"+data+"人正在使用此制度，请确保没人使用此制度才能删除");
			}
		}

	}
	/**修改制度**/
	function updateSystem(systemId, number, name) {
		$("#tladd_editZhiDu")[0].innerHTML = "编辑制度";
		$("#ZhiDuId").val(systemId);
		$("#ZhiDuBianHao").val(number);
		$("#ZhiDuMingChen").val(name);
		$("#myModal").modal("show");
	}
	/**点击行改变样式 **/
	function onclickSystemRow(tr, systemid) {
		systemId = systemid;
		$("#tbodyZhiDu tr").removeClass("trClass");
		$(tr).addClass("trClass");
		$("#tbodyZhiDuMingXi").empty();
		var trs = "<tr onclick=onclickZhiDuMingXi(this,'tbChidaoZaoTui',"
				+ systemid + ")><td>迟到早退制度</td></tr>"
				+ "<tr onclick=onclickZhiDuMingXi(this,'tbJiaBan'," + systemid
				+ ")><td>加班制度</td></tr>"
				+ "<tr onclick=onclickZhiDuMingXi(this,'tbWaiChu'," + systemid
				+ ")><td>外出制度</td></tr>"
				+ "<tr onclick=onclickZhiDuMingXi(this,'tbWuBanCi'," + systemid
				+ ")><td>无班次考勤制度</td></tr>"
				+ "<tr onclick=onclickZhiDuMingXi(this,'tbQiTa'," + systemid
				+ ")><td>其他制度</td></tr>";
		$("#tbodyZhiDuMingXi").append(trs);
		$(".tbHide").hide();
	}
	/**点击制度明细行时触发此事件 **/
	function onclickZhiDuMingXi(tr, tdid, systemid) {
		$("#tbodyZhiDuMingXi tr").removeClass("trClass");
		$(tr).addClass("trClass");
		$(".tbHide").hide();
		$("#" + tdid).show();
		$("#mydiv").show();
		switch (tdid) {
		case "tbChidaoZaoTui":
			var data = ajax("${ctx}/SetSystem/selectLateAndLeaveSys.do?systemid="
					+ systemid);
			$("#ZhiDuMxDiv").empty();
			var html = "<form id='frmChidaoZaoTui'action='${ctx}/SetSystem/updateLateAndLeaveSys.do' method='post' onSubmit='return false;' >"
					+ "<table id='tbChidaoZaoTui' class='tbStyle'>"
					+ "<tr>"
					+ "<td>刷卡时间大于上班时间多少分钟算迟到</td>"
					+ "<td>"
					+ "<input type='number'id='latetime' name='latetime'><input"
					+" id='lateandleaveearlysystemid' type='hidden' name='lateandleaveearlysystemid'/><input type='hidden'name='systemid' value="+systemid+"></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>刷卡时间大于上班时间多少分钟算缺勤</td>"
					+ "<td><input type='number' id='lateabsenteeismtime' name='lateabsenteeismtime'></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>迟到早退时间是否同时计为出勤时间</td>"
					+ "<td><select id='lateandleaveearlyno' style='width: 100px;'"
					+	"name='lateandleaveearlyno'>"
					+ "<option value='0'>否</option>"
					+ "<option value='1'>是</option>"
					+ "</select>"
					+ "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>刷卡时间小于下班时间多少分钟算早退</td>"
					+ "<td><input id='leaveearlytime' type='number'"
					+		"name='leaveearlytime'></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>刷卡时间小于下班时间多少分钟算缺勤</td>"
					+ "<td><input id='leaveearlyabsenteeismtime' type='number'"
					+	"name='leaveearlyabsenteeismtime'></td></tr></table>"
					+ "<div id='mydiv' class='form-actions center'>"
					+ "<button id='btnHuanYuanMoRen' type='button' onclick=HuanYuanMoRenZhi('tbChidaoZaoTui',"
					+ systemid
					+ ","
					+ data[0].lateandleaveearlysystemid
					+ ")"
					+ "	class='btn btn-info btn-sm' style='margin-right: 18px;'>"
					+ "还原默认 <i class='icon-undo icon-on-right bigger-110'></i>"
					+ "</button>"
					+ "<button id='btnsaveMx' type='button' onclick=saveMx('tbChidaoZaoTui') class='btn btn-sm btn-success'>"
					+ "保 存 <i class='icon-check icon-on-right bigger-110'></i>"
					+ "</button></div></form>";
			$("#ZhiDuMxDiv").append(html);
			ChiDaoZaoTui(data[0].latetime, data[0].lateabsenteeismtime,
					data[0].lateandleaveearlyno, data[0].leaveearlytime,
					data[0].leaveearlyabsenteeismtime,
					data[0].lateandleaveearlysystemid);
			break;
		case "tbJiaBan":
			var data = ajax("${ctx}/SetSystem/selectOvertimeSys.do?systemid="
					+ systemid);
			$("#ZhiDuMxDiv").empty();
			var html = "<form id='frmJiaBan'action='${ctx}/SetSystem/updateOvertimeSys.do' method='post' >"
					+ "<table id='tbJiaBan' class='tbStyle'>"
					+ "<tr>"
					+ "<td>加班大于多少分钟有效</td>"
					+ "<td><input type='number' id='overtime' name='overtime'><input"
					+" id='overtimesystemid' type='hidden'name='overtimesystemid'><input type='hidden'name='systemid' value="+systemid+"></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>提前上班计加班</td>"
					+ "<td><select style='width: 100px;' id='earlyworktoovertimeno'name='earlyworktoovertimeno'>"
					+ "<option value='0'>否</option>"
					+ "<option value='1'>是</option>"
					+ "</select>"
					+ "</td>"
					+ "</tr>"
					+ "	<tr>"
					+ "<td>延迟下班计加班</td>"
					+ "	<td><select style='width: 100px;' id='lateworktoovertiemno'name='lateworktoovertiemno'>"
					+ "<option value='0'>否</option>"
					+ "<option value='1'>是</option>"
					+ "</select>"
					+ "	</td>"
					+ "</tr>"
					+ "</table>"
					+ "<div id='mydiv' class='form-actions center'>"
					+ "<button id='btnHuanYuanMoRen' type='button' onclick=HuanYuanMoRenZhi('tbJiaBan',"
					+ systemid
					+ ","
					+ data[0].overtimesystemid
					+ ")"
					+ " class='btn btn-info btn-sm' style='margin-right: 18px;'>"
					+ "还原默认 <i class='icon-undo icon-on-right bigger-110'></i>"
					+ "</button>"
					+ "<button id='btnsaveMx' type='button' onclick=saveMx('tbJiaBan') class='btn btn-sm btn-success'>"
					+ "保 存 <i class='icon-check icon-on-right bigger-110'></i>"
					+ "</button>" + "</div>" + "</form>";
			$("#ZhiDuMxDiv").append(html);
			JiaBanZhiDu(data[0].overtime, data[0].earlyworktoovertimeno,
					data[0].lateworktoovertiemno, data[0].overtimesystemid);
			break;
		case "tbWaiChu":
			var data = ajax("${ctx}/SetSystem/selectGoOutSys.do?systemid="
					+ systemid);
			$("#ZhiDuMxDiv").empty();
			var html = "<form id='frmWaiChu'action='${ctx}/SetSystem/updateGoOutSys.do' method='post' onSubmit='return false;'>"
					+ "<table id='tbWaiChu' class='tbStyle'>"
					+ "<tr>"
					+ "<td>班段中途外出大于多少分钟算外出</td>"
					+ "<td><input type='number' id='goouttime'name='goouttime'><input"
					+"	id='gooutsystemid' type='hidden'name='gooutsystemid'><input type='hidden' name='systemid' value="+systemid+"></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>班段中途外出大于多少分钟算缺勤</td>"
					+ "<td><input type='number' id='gooutabsenteeism'name='gooutabsenteeism'></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>外出是否同时计为出勤时间</td>"
					+ "<td><select style='width: 100px;' id='timeno'name='timeno'>"
					+ "		<option value='0'>否</option>"
					+ "<option value='1'>是</option>"
					+ "</select>"
					+ "</td>"
					+ "	</tr>"
					+ "</table>"
					+ "	<div id='mydiv' class='form-actions center'>"
					+ "	<button id='btnHuanYuanMoRen' type='button' onclick=HuanYuanMoRenZhi('tbWaiChu',"
					+ systemid
					+ ","
					+ data[0].gooutsystemid
					+ ")"
					+ "	class='btn btn-info btn-sm'style='margin-right: 18px;'>"
					+ "	还原默认 <i class='icon-undo icon-on-right bigger-110'></i>"
					+ "</button>"
					+ "<button id='btnsaveMx' type='button'onclick=saveMx('tbWaiChu') class='btn btn-sm btn-success'>"
					+ "保 存 <i class='icon-check icon-on-right bigger-110'></i>"
					+ "	</button>" + "</div>" + "	</form>";
			$("#ZhiDuMxDiv").append(html);
			WaiChuZhiDu(data[0].goouttime, data[0].gooutabsenteeism,
					data[0].timeno, data[0].gooutsystemid);
			break;
		case "tbWuBanCi":
			var data = ajax("${ctx}/SetSystem/selectNotClassesSys.do?systemid="
					+ systemid);

			$("#ZhiDuMxDiv").empty();
			var html = "<form id='frmWuBanCi' >"
					+ "<table id='tbWuBanCi' class='tbStyle'>"
					+ "<tr>"
					+ "<td>满多少分钟计一天</td>"
					+ "<td><input type='number' id='fulldatetime'name='fulldatetime'><input"
					+ "	id='notclassessystemid' type='hidden'name='notclassessystemid'><input type='hidden' name='systemid' value="+systemid+"></td>"
					+ "</tr>"
					+ "<tr>"
					+ "	<td>超过多少分钟计加班</td>"
					+ "	<td><input type='number' id='overtimeforover'name='overtimeforover'></td>"
					+ "</tr>"
					+ "<tr>"
					+ "	<td>单次上下班最长工作时间（分钟）</td>"
					+ "<td><input type='number' id='longworktime'name='longworktime'>"
					+ "	</td>"
					+ "</tr>"
					+ "<tr>"
					+ "	<td>跨零点出勤时零点后的最长工作时间（分钟）</td>"
					+ "	<td><input type='number' id='longworktimetozero'name='longworktimetozero'></td>"
					+ "</tr>"
					+ "</table>"
					+ "<div id='mydiv' class='form-actions center'>"
					+ "<button id='btnHuanYuanMoRen' type='button'onclick=HuanYuanMoRenZhi('tbWuBanCi',"
					+ systemid
					+ ","
					+ data[0].notclassessystemid
					+ ")"
					+ "	 class='btn btn-info btn-sm' style='margin-right: 18px;'>"
					+ "	还原默认 <i class='icon-undo icon-on-right bigger-110'></i>"
					+ "</button>"
					+ "<button id='btnsaveMx' type='button'onclick=saveMx('tbWuBanCi') class='btn btn-sm btn-success'>"
					+ "		保 存 <i class='icon-check icon-on-right bigger-110'></i>"
					+ "	</button>" + "</div>" + "</form>";
			$("#ZhiDuMxDiv").append(html);
			WuBanCiKaoQinZhiDu(data[0].fulldatetime, data[0].overtimeforover,
					data[0].longworktime, data[0].longworktimetozero,
					data[0].notclassessystemid);
			$("#btnHuanYuanMoRen").attr(
					"onclick",
					"HuanYuanMoRenZhi('tbWuBanCi'," + systemid + ","
							+ data[0].notclassessystemid + ")");
			break;
		case "tbQiTa":
			var data = ajax("${ctx}/SetSystem/selectOtherStystemSys.do?systemid="
					+ systemid);
			$("#ZhiDuMxDiv").empty();
			var html = "<form id='frmQiTa'action='${ctx}/SetSystem/updateOtherStystemSys.do' method='post' onSubmit='return false;'>"
					+ "<table id='tbQiTa' class='tbStyle'>"
					+ "<tr>"
					+ "<td>多次刷卡在小于多少分钟只算第一次</td>"
					+ "	<td><input type='number' id='timetoone'name='timetoone'><input"
					+ "	id='otherstystemid' type='hidden'name='otherstystemid'><input type='hidden'name='systemid' value="+systemid+"></td>"
					+ "</tr>"
					+ "<tr>"
					+ "	<td>出差是否同时计为出勤时间</td>"
					+ "	<td><select style='width: 100px;' id='gooutattendanceno'name='gooutattendanceno'>"
					+ "	<option value='1'>是</option>"
					+ "	<option value='0'>否</option>"
					+ "	</select></td>"
					+ "</tr>"
					+ "</table>"
					+ "<div id='mydiv' class='form-actions center'>"
					+ "	<button id='btnHuanYuanMoRen' type='button'onclick=HuanYuanMoRenZhi('tbQiTa',"
					+ systemid
					+ ","
					+ data[0].otherstystemid
					+ ")"
					+ "	class='btn btn-info btn-sm'style='margin-right: 18px;'>"
					+ "	还原默认 <i class='icon-undo icon-on-right bigger-110'></i>"
					+ "</button>"
					+ "	<button id='btnsaveMx' type='button'onclick=saveMx('tbQiTa') class='btn btn-sm btn-success'>"
					+ "	保 存 <i class='icon-check icon-on-right bigger-110'></i>"
					+ "	</button>" + "</div>" + "	</form>";
			$("#ZhiDuMxDiv").append(html);
			QiTaZhiDu(data[0].timetoone, data[0].gooutattendanceno,
					data[0].otherstystemid);
			$("#btnHuanYuanMoRen").attr(
					"onclick",
					"HuanYuanMoRenZhi('tbQiTa'," + systemid + ","
							+ data[0].otherstystemid + ")");
			break;
		}
	}
	function insertSystem() {
		$("#tladd_editZhiDu")[0].innerHTML = "新增制度";
		$("#myModal").modal("show");
	}
	/** 新增考勤制度和明细 **/
	function saveSystems() {
	if($("#formZhiDu").valid()){
		if ($("#tladd_editZhiDu")[0].innerHTML == "新增制度") {
			var data = ajax("${ctx}/SetSystem/insertSystemsAndMx.do?goouttime="
					+ "${res.WaiChuZhiDu_DaYuDuoShaoFenSuanWaiChu}"
					+ "&gooutabsenteeism="
					+ "${res.WaiChuZhiDu_DaYuDuoShaoFenSuanQueQin}"
					+ "&timeno=" + "${res.WaiChuZhiDu_JiChuQinFou}"
					+ "&latetime=" + "${res.ChiDaoZhiDu_SuanChiDao}"
					+ "&lateabsenteeismtime="
					+ "${res.ChiDaoZhiDu_ShangBanQueQin}"
					+ "&lateandleaveearlyno="
					+ "${res.ChiDaoZhiDu_ChiDaoZaoTuiJiFou}"
					+ "&leaveearlytime=" + "${res.ChiDaoZhiDu_XianBanZaoTui}"
					+ "&leaveearlyabsenteeismtime="
					+ "${res.ChiDaoZhiDu_XiaBanQueQin}" + "&fulldatetime="
					+ "${res.WuBanCiZhiDu_DuoShaoFenJiYiTian}"
					+ "&overtimeforover="
					+ "${res.WuBanCiZhiDu_ChaoGouJiJiaBan}" + "&longworktime="
					+ "${res.WuBanCiZhiDu_DanCiZuiChangShiJian}"
					+ "&longworktimetozero="
					+ "${res.WuBanCiZhiDu_KaLingDianShiJian}" + "&overtime="
					+ "${res.JiaBanZhiDu_DuoShaoFenYouXiao}"
					+ "&earlyworktoovertimeno="
					+ "${res.JiaBanZhiDu_TiQianShanBanJiJiaBan}"
					+ "&lateworktoovertiemno="
					+ "${res.JiaBanZhiDu_YanChiXiaBanJiJiaBan}" + "&timetoone="
					+ "${res.QiTaZhiDu_DuoCiShuaKaShiJian}"
					+ "&gooutattendanceno="
					+ "${res.QiTaZhiDu_ChuChaJiChuQinFou}" + "&systemnumber="
					+ $("#ZhiDuBianHao").val() + "&systemname="
					+ $("#ZhiDuMingChen").val());
			if (data == "1") {
				alert("新增成功");
				selectSystem();
				$("#myModal").modal("hide");
				$("#tbodyZhiDuMingXi").empty();
			} else {
				alert("新增失败");
			}
		} else {
			var result = ajax("${ctx}/SetSystem/updateSystems.do?systemid="
					+ $("#ZhiDuId").val() + "&systemnumber="
					+ $("#ZhiDuBianHao").val() + "&systemname="
					+ $("#ZhiDuMingChen").val());
			if (result == "1") {
				alert("修改成功");
				selectSystem();
				$("#myModal").modal("hide");
				$("#tbodyZhiDuMingXi").empty();
			} else {
				alert("修改失败");
			}
		}
		}
	}
	/** 迟到早退制度**/
	function ChiDaoZaoTui(latetime, lateabsenteeismtime, lateandleaveearlyno,
			leaveearlytime, leaveearlyabsenteeismtime,
			lateandleaveearlysystemid) {
		$("#latetime").val(latetime);
		$("#lateabsenteeismtime").val(lateabsenteeismtime);
		$("#lateandleaveearlyno").val(lateandleaveearlyno);
		$("#leaveearlytime").val(leaveearlytime);
		$("#leaveearlyabsenteeismtime").val(leaveearlyabsenteeismtime);
		$("#lateandleaveearlysystemid").val(lateandleaveearlysystemid);
	}
	/**加班制度**/
	function JiaBanZhiDu(overtime, earlyworktoovertimeno, lateworktoovertiemno,
			overtimesystemid) {
		$("#overtime").val(overtime);
		$("#earlyworktoovertimeno").val(earlyworktoovertimeno);
		$("#lateworktoovertiemno").val(lateworktoovertiemno);
		$("#overtimesystemid").val(overtimesystemid);
	}
	/**外出制度**/
	function WaiChuZhiDu(goouttime, gooutabsenteeism, timeno, gooutsystemid) {
		$("#goouttime").val(goouttime);
		$("#gooutabsenteeism").val(gooutabsenteeism);
		$("#timeno").val(timeno);
		$("#gooutsystemid").val(gooutsystemid);
	}
	/**无班次考勤制度**/
	function WuBanCiKaoQinZhiDu(fulldatetime, overtimeforover, longworktime,
			longworktimetozero, notclassessystemid) {
		$("#fulldatetime").val(fulldatetime);
		$("#overtimeforover").val(overtimeforover);
		$("#longworktime").val(longworktime);
		$("#longworktimetozero").val(longworktimetozero);
		$("#notclassessystemid").val(notclassessystemid);
	}
	/** 其他制度 **/
	function QiTaZhiDu(timetoone, gooutattendanceno, otherstystemid) {
		$("#timetoone").val(timetoone);
		$("#gooutattendanceno").val(gooutattendanceno);
		$("#otherstystemid").val(otherstystemid);

	}
	function TiShi(i) {
		if (i == "1") {
			alert("保存成功");
		} else{
		}
		return false;
	}
	/* 保存考勤明细制度 */
	function saveMx(tbid) {
		switch (tbid) {
		case "tbChidaoZaoTui":
			$("#frmChidaoZaoTui").validate({
				rules : {
					latetime : "required",
					lateabsenteeismtime : "required",
					leaveearlytime : "required",
					leaveearlyabsenteeismtime : "required",
				}
			});
			if ($("#frmChidaoZaoTui").valid()) {
				var i = ajax("${ctx}/SetSystem/updateLateAndLeaveSys.do?"
						+ $("#frmChidaoZaoTui").serialize());
				TiShi(i);
			}
			break;
		case "tbJiaBan":
			/**加班制度**/
					$("#frmJiaBan").validate({
				rules : {
					overtime : "required",
				}
			});
				if ($("#frmJiaBan").valid()) {
				var i = ajax("${ctx}/SetSystem/updateOvertimeSys.do?"
						+ $("#frmJiaBan").serialize());
				TiShi(i);
			}
 			break;
		case "tbWaiChu":
			/**外出制度**/
				$("#frmWaiChu").validate({
				rules : {
					goouttime : "required",
					gooutabsenteeism : "required",
				}
			});
				if ($("#frmWaiChu").valid()) {
				var i = ajax("${ctx}/SetSystem/updateGoOutSys.do?"
						+ $("#frmWaiChu").serialize());
				TiShi(i);
			}
			break;
		case "tbWuBanCi":
			/**无班次考勤制度**/
				$("#frmWuBanCi").validate({
				rules : {
					fulldatetime : "required",
					overtimeforover : "required",
					longworktime : "required",
					longworktimetozero : "required",
				}
			});
				if ($("#frmWuBanCi").valid()) {
				var i = ajax("${ctx}/SetSystem/updateNotClassesSys.do?"
						+ $("#frmWuBanCi").serialize());
				TiShi(i);
			}
			break;
		case "tbQiTa":
			/** 其他制度 **/
				$("#frmQiTa").validate({
				rules : {
					timetoone : "required",
				}
			});
				if ($("#frmQiTa").valid()) {
				var i = ajax("${ctx}/SetSystem/updateOtherStystemSys.do?"
						+ $("#frmQiTa").serialize());
				TiShi(i);
			}
			break;
		}
	}
	/**还原默认值 **/
	function HuanYuanMoRenZhi(tbid, systemid, Mxid) {
		switch (tbid) {
		case "tbChidaoZaoTui":
			/** 迟到早退制度**/
			ChiDaoZaoTui("${res.ChiDaoZhiDu_SuanChiDao}",
					"${res.ChiDaoZhiDu_ShangBanQueQin}",
					"${res.ChiDaoZhiDu_ChiDaoZaoTuiJiFou}",
					"${res.ChiDaoZhiDu_XianBanZaoTui}",
					"${res.ChiDaoZhiDu_XiaBanQueQin}", Mxid);
			break;
		case "tbJiaBan":
			/**加班制度**/
			JiaBanZhiDu("${res.JiaBanZhiDu_DuoShaoFenYouXiao}",
					"${res.JiaBanZhiDu_TiQianShanBanJiJiaBan}",
					"${res.JiaBanZhiDu_YanChiXiaBanJiJiaBan}", Mxid);
			break;
		case "tbWaiChu":
			/**外出制度**/
			WaiChuZhiDu("${res.WaiChuZhiDu_DaYuDuoShaoFenSuanWaiChu}",
					"${res.WaiChuZhiDu_DaYuDuoShaoFenSuanQueQin}",
					"${res.WaiChuZhiDu_JiChuQinFou}", Mxid);
			break;
		case "tbWuBanCi":
			/**无班次考勤制度**/
			WuBanCiKaoQinZhiDu("${res.WuBanCiZhiDu_DuoShaoFenJiYiTian}",
					"${res.WuBanCiZhiDu_ChaoGouJiJiaBan}",
					"${res.WuBanCiZhiDu_DanCiZuiChangShiJian}",
					"${res.WuBanCiZhiDu_KaLingDianShiJian}", Mxid);
			break;
		case "tbQiTa":
			/** 其他制度 **/
			QiTaZhiDu("${res.QiTaZhiDu_DuoCiShuaKaShiJian}",
					"${res.QiTaZhiDu_ChuChaJiChuQinFou}", Mxid);
			break;
		}
	}
	/**封装的ajax**/
	function ajax(url) {
		var mydata;
		$.ajax({
			async : false,
			type : 'post',
			url : url,
			contentType : 'application/json',
			dataType : "json",
			scriptCharset : "utf-8",
			success : function(data) {
				mydata = data;
			}
		});
		return mydata;
	}
</SCRIPT>
<body style="text-align: center">
	<div></div>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a>
			</li>
			<li><a href="#">考勤管理</a>
			</li>
			<li class="active">考勤制度设置</li>
		</ul>
	</div>
	<div>
		<div class="table-responsive div-c" style="position:relative;">
			<button id="btndpinsert" type="button" onclick="insertSystem()"
				class="btn btn-info btn-sm" style="font-size:14px">
				添加制度<i class="icon-plus-sign icon-on-right bigger-120"></i>
			</button>
			<table id="sample-table-2" style="border: 2px solid #dddddd;"
				class="table  table-bordered table_hover">
				<thead class="header">
					<tr>
						<th style="width: 110px;">操作</th>
						<th>制度编号</th>
						<th>制度名称</th>
					</tr>
				</thead>
				<tbody id="tbodyZhiDu" class="tbody">
				</tbody>
			</table>
		</div>
		<div class="div-a">
			<div class="div-d">
				<table id="sample-table-2" style="border: 2px solid #dddddd;"
					class="table  table-bordered table_hover">
					<thead class="header">
						<tr>
							<th>制度明细</th>
						</tr>
					</thead>
					<tbody id="tbodyZhiDuMingXi" class="tbody">
					</tbody>
				</table>
			</div>
			<div id="ZhiDuMxDiv" class="div-e"></div>
		</div>
	</div>
	<div class="modal hide fade in" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_editZhiDu" style="text-align:center"
						class="modal-title">新增制度</h4>
				</div>
				<div class="modal-body" style="max-height: 440px;">
					<div style="text-align: center;">
						<form id="formZhiDu" action="" method="post">
							<table id="tbShijianduan" class="table table-bordered"
								style="border: 1px solid #dddddd">
								<tr>
									<td style="background-color: #ebf3fb;">制度编号</td>
									<td><input required="true" id="ZhiDuBianHao" /><input id="ZhiDuId"
										type="hidden" />
									</td>
								</tr>
								<tr>
									<td style="background-color: #ebf3fb;">制度名称</td>
									<td><input required="true" id="ZhiDuMingChen" />
									</td>
								</tr>
							</table>
							<div class="form-actions center">
								<button type="button" onclick="saveSystems()"
									class="btn btn-sm btn-success">
									保 存 <i class="icon-check icon-on-right bigger-110"></i>
								</button>
								<button type="reset" class="btn btn-sm btn-warning"
									onclick="qingkongbiaodan()">
									重置 <i class="icon-undo icon-on-right bigger-110"></i>
								</button>
								<button type="button" class="btn btn-sm btn-info"
									data-dismiss="modal">
									返 回 <i class="icon-reply icon-on-right bigger-110"></i>
								</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>


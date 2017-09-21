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
<style type="text/css">
.thistop {
	padding-left: 15px;
	padding-top: 9px;
}

fieldset {
	padding: .35em .625em .75em;
	margin: 0 2px;
	border: 1px solid silver
}

legend {
	border: 0;
	width: auto
}

.table_hover tr:HOVER {
	background-color: rgba(98, 168, 209, 0.11);
}

.tbody tr td {
	text-align: center;
	vertical-align: middle;
}

#tbodyJigou tr td {
	text-align: center;
	vertical-align: middle;
}

.mytd {
	background: rgba(52, 154, 184, 0.21);
}

.tdstyle {
	font-size: 15px;
	font-weight: 600;
}

#tbGudinglunban tr th {
	text-align: center;
	width: 44px;
}

.trClass {
	background: rgba(98, 168, 209, 0.11);
}

.div-c {
	float: left;
	width: 72%;
	height: 350px;
	border: 1px solid #e8e3e3
}

.div-d {
	float: right;
	width: 27%;
	height: 350px;
	border: 1px solid #e8e3e3
}

.headerstyle {
	text-align: center;
	width: 40px;
	font-size: 15px;
	font-weight: 600;
	background: #fafafa;
}

#header:HOVER {
	cursor: pointer;
}

.btnstyle {
	background: rgb(52, 154, 184);
	color: white;
	font-size: 18px;
	height: 30px;
}

.btnDisabledStyle {
	background: rgba(52, 154, 184, 0.55);
	color: white;
	font-size: 18px;
	height: 30px;
}

.mytdstyle {
	background: rgba(232, 232, 232, 0.55);
}
.myclass {
}
</style>

<SCRIPT type="text/javascript">
	var BeiXuanYuanGong = [];
	/**var XuanZheBanCi = [];
	 **/
	$(document).ready(function() {
		$("#menuContent").hide();
		banzujiazai();
		bangdingDepartment();
		alert("${xtq}")

		submitForm();
	});

	var setting = {
		view : {
			selectedMulti : false
		//是否允许多选
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onClick : onclickinsert
		}
	};
	//点击新增员工工作机构下拉树时触发
	function onclickinsert(e, treeId, treeNode) {
		$("#gouzuojigou").val(treeNode.name);
		$("#txtDepartmentid").val(treeNode.id);
		$("#menuContent").fadeOut("fast");
		submitForm();

	}
	//查询部门绑定下拉树、
	function bangdingDepartment() {
		var zNode = [];
		var data = ajax("${ctx}/staff/selectDepartment.do");
		for ( var i = 0; i < data.length; i++) {
			zNode.push({
				id : data[i].departmentid,
				pId : data[i].fatherid,
				name : data[i].name,
				open : true
			});
		}
		$.fn.zTree.init($("#treeDemo"), setting, zNode);
	}
	//点击机构文本框时触发
	function jigouxuanzhe(event) {
		var cityOffset = $("#gouzuojigou").offset();
		$("#menuContent").css({
			offsetTop : event.offsetTop
		}).slideDown("fast");
	}
	/** 班组加载 **/
	function banzujiazai() {
		var myDate = new Date();
		var yue=(myDate.getMonth() + 1);
		var ri= myDate.getDate();
		var jintian = myDate.getFullYear() + "-" +(yue<10?"0"+yue:yue)
				+ "-" +(ri<10?"0"+ri:ri);
		data = ajax("${ctx}/Scheduling/selectClassGroup.do");
		$("#tbodybanzuxinxi").empty();
		for ( var i = 0; i < data.length; i++) {
			var renshu = data[i].renshu;
			var paibanxinxi = data[i].paibanxinxi;
			var xinxi;
			if (renshu > 0) {
				var a = "<a style='margin-right:13px;'  href=javascript:anPaiBanCi("+data[i].banzuid+")>安排班次</a>";
				if (paibanxinxi == jintian || paibanxinxi == "") {
					xinxi = "<td style='color: red;'>" + "今天有人未排班" + "</td>";
				} else {
					if (paibanxinxi != "") {
						xinxi = "<td style='color: red;'>" + paibanxinxi
								+ "号有人未排班" + "</td>";
					}
				}
			} else {
				var a = "<span style='color:#8c8383;'>安排班次　</span>";
				xinxi = "<td>" + "</td>";
			}
			var style;
			var shanchu;
			var BanZuId = data[i].banzuid;
			if (BanZuId == 22) {
				style = "style='color:#0058ff'";
				shanchu = "<span style='color:#8c8383;'>【删除】</span>";
			} else {
				style = "";
				shanchu = "<a href=javascript:shanchubanzu(" + data[i].banzuid
						+ ")>【删除】</a>";
			}
			var html = "<tr>" + "<td>" + a + "<a href=javascript:editBanZu("
					+ data[i].banzuid + ",'" + data[i].banzu + "')>【编辑】　</a>"
					+ shanchu + "</td>" + "<td "+style+">" + data[i].banzu
					+ "</td>" + "<td>" + renshu + "人</td>" + xinxi + "</tr>";
			$("#tbodybanzuxinxi").append(html);
		}
	}
	/**编辑班组 **/
	function editBanZu(banzuid, banzu) {
		if (banzuid == 22) {
			$("#BanZuMingMheng").attr("readonly", "readonly");
		} else {
			$("#BanZuMingMheng").removeAttr("readonly");
		}
		$("#BanZuMingMheng").val(banzu);
		$("#editBanZuId").val(banzuid);
		/** 绑定修改的员工信息 **/
		BangDingYuanGong(banzuid);
		//隐藏已选择的员工
		YinCangYiXuanYuanGong();
		/** 绑定修改的班次信息 **/
		BangDingBanCi(banzuid);
		$("#tladd_edit")[0].innerHTML = "编辑班组";
		$("#myModal").modal("show");
	}
	/** 绑定修改的员工信息 **/
	function BangDingYuanGong(banzuid) {
		var data = ajax("${ctx}/Scheduling/selectGroupStff.do?groupid="
				+ banzuid);
		$("#tbodyXuanZheYuanGong").empty();
		$("#renshu")[0].innerHTML = data.length;
		$("#YiXuanRenShu")[0].innerHTML = data.length;
		for ( var i = 0; i < data.length; i++) {
			var html = "<tr><td><span style='display:none' name='staffid'>"
					+ data[i].staffid
					+ "</span>("
					+ data[i].staffnumber
					+ ")"
					+ data[i].staffname
					+ "["
					+ data[i].staffPosition.department.name
					+ "]"
					+ "["
					+ data[i].staffPosition.position.name
					+ "]"
					+ "<button type='button' onclick=YiChuYuanGong(this,'YG"
					+ data[i].staffid
					+ "') class='close' aria-hidden='true'>×</button></td></tr>";
			$("#tbodyXuanZheYuanGong").append(html);
		}
	}
	/** 绑定修改的班次信息 **/
	function BangDingBanCi(banzuid) {
		var BanCiData = ajax("${ctx}/Scheduling/selectClassTimes.do?groupid="
				+ banzuid);
		$("#XianShiBanCi").empty();
		for ( var i = 0; i < BanCiData.length; i++) {
			var html = "<span class='tooltip-show' data-toggle='tooltip' title='"+BanCiData[i].positionclasses.banduanxinxi+"' style='margin-left: 15px;'>("
					+ BanCiData[i].positionclasses.classesnumber
					+ ")"
					+ BanCiData[i].positionclasses.classesname
					+ "<input type='hidden' name='BanCiId' value='"+BanCiData[i].positionclassesid+"'>"
					+ "<button type='button' onclick=YiChuBanCi(this,'"
					+ BanCiData[i].positionclassesid
					+ "') style=float:none;font-size:26px;' class='close' aria-hidden='true'>×</button></span>";
			$("#XianShiBanCi").append(html);
		}
		XianShiBanDuan();
	}
	/** 新建班组 **/
	function xinjianbanzu() {
	    $("#BanZuMingMheng").removeAttr("readonly");
		$("#tladd_edit")[0].innerHTML = "添加班组";
		$("#XianShiBanCi").empty();
		$('#tbodyXuanZheYuanGong').empty();
		$("#editBanZuId").val("0");
		$("#BanZuMingMheng").val("");
		$("#YiXuanRenShu")[0].innerHTML = 0;
		$("#renshu")[0].innerHTML = 0;
		$("#myModal").modal("show");
	}

	/** 删除班组信息 **/
	function shanchubanzu(banzuid) {
		if (confirm("是否确定删除，一旦删除，数据无法恢复")) {
			var data = ajax("${ctx}/Scheduling/deleteGroupClass.do?groupid="
					+ banzuid);
			if (data > 0) {
				alert("删除成功");
				banzujiazai();
			} else {
				alert("删除失败");
			}
		}
	}

	/** 选择人员按钮时触发 **/
	function xuanzerenyuan() {
		submitForm();
		$("#ModalRenYuanXuanZhe").modal("show");
	}
	/**   点击行改变样式 **/
	function clickStaffRow(tr) {
		$("#tbodyStaff tr").removeClass("trClass");
		$(tr).addClass("trClass");
	}

	/**模糊查询员工信息 **/
	function submitForm() {
		var formData = $("#formStaff").serialize();
		var data = ajax("${ctx}/Scheduling/selectStaff.do?" + formData);
		$('#tbodyStaff').empty();
		for ( var i = 0; i < data.length; i++) {
			var xingbie = data[i].sex == 0 ? "女" : "男";
			var html = "<tr id='YG" + data[i].staffid
					+ "' ondblclick=ondblclickStaff('YG" + data[i].staffid
					+ "','" + data[i].staffid + "','" + data[i].staffnumber
					+ "','" + data[i].staffname + "','"
					+ data[i].staffPosition.department.name + "','"
					+ data[i].staffPosition.position.name
					+ "') onclick='clickStaffRow(this)'>" + "<td>"
					+ data[i].staffPosition.department.name + "</td>" + "<td>"
					+ data[i].staffPosition.position.name + "</td>" + "<td>"
					+ data[i].staffnumber + "</td>" + "<td>"
					+ data[i].staffname + "</td>" + "<td>" + xingbie + "</td>"
					+ "</tr>";
			$('#tbodyStaff').append(html);
		}
		//隐藏已选择的员工
		YinCangYiXuanYuanGong();
	}
	//隐藏已选择的员工
	function YinCangYiXuanYuanGong() {
		var XuanZheRenYuan = $("#tbodyXuanZheYuanGong tr span[name='staffid']");
		for ( var j = 0; j < XuanZheRenYuan.length; j++) {
			var t = document.getElementById("YG" + XuanZheRenYuan[j].innerHTML);
			if (t != null) {
				t.style.display = "none";
			}

		}
	}
	/**双击staff行事件 **/
	function ondblclickStaff(trid, staffid, number, name, bumen, zhiwu) {
		$("#" + trid)[0].style.display = "none";
		$("#renshu")[0].innerHTML = parseInt($("#renshu")[0].innerHTML) + 1;
		var html = "<tr><td><span style='display:none' name='staffid'>"
				+ staffid + "</span>(" + number + ")" + name + "[" + bumen
				+ "]" + "[" + zhiwu + "]"
				+ "<button type='button' onclick=YiChuYuanGong(this,'" + trid
				+ "') class='close' aria-hidden='true'>×</button></td></tr>";
		$('#tbodyXuanZheYuanGong').append(html);
	}
	function YiChuYuanGong(bt, trid) {
		$("#renshu")[0].innerHTML = parseInt($("#renshu")[0].innerHTML) - 1;
		bt.parentNode.parentNode.remove();
		var t = document.getElementById(trid);
		if (t != null) {
			t.style.display = "";
		}
	}

	/** 记录选择的人员的id **/
	function saveStaff() {
		var a = [];
		var XuanZheRenYuan = $("#tbodyXuanZheYuanGong tr span[name='staffid']");
		for ( var i = 0; i < XuanZheRenYuan.length; i++) {
			a.push(XuanZheRenYuan[i].innerHTML);
		}
		BeiXuanYuanGong = a;
		$("#YiXuanRenShu")[0].innerHTML = $("#renshu")[0].innerHTML;
		$("#ModalRenYuanXuanZhe").modal("hide");

		/**var index = $.inArray(3,a);
		  if(index>=0){
		  a.splice(index,1);
		  } **/
	}
	/** 保存班组和班次和人员信息 **/
	function saveBanZu() {
		/** 记录选择的人员的id **/
		saveStaff();
		$("#myModal").modal("hide");
		var XuanZheBanCi = [];
		var YiXuanBanCi = $("#XianShiBanCi input[name='BanCiId']");
		for ( var i = 0; i < YiXuanBanCi.length; i++) {
			XuanZheBanCi.push(YiXuanBanCi[i].value);
		}
		if ($("#tladd_edit")[0].innerHTML == "编辑班组") {
			editGroupid = $("#editBanZuId").val();
			groupName = $("#BanZuMingMheng").val();
			ajax("${ctx}/Scheduling/editGroupName.do?name=" + groupName
					+ "&attributegatherchildid=" + editGroupid);
			/** 编辑班组时修改班组班次信息**/
			var j1 = ajax("${ctx}/Scheduling/editClassesgroup.do?ClassIds="
					+ XuanZheBanCi + "&groupid=" + editGroupid);
			/** 编辑班组修改员工信息 **/
			var j3 = ajax("${ctx}/Scheduling/editByGroupidAndStaffids.do?staffids="
					+ BeiXuanYuanGong + "&groupid=" + editGroupid);
		} else {
			/**新增班组名称 **/
			var groupid = ajax("${ctx}/Scheduling/insertGroupName.do?name="
					+ $("#BanZuMingMheng").val() + "&attributegatherid=7");
			/**新增班组成员 **/
			var i = ajax("${ctx}/Scheduling/updateStaffGroupId.do?staffids="
					+ BeiXuanYuanGong + "&groupid=" + groupid);
			/**新增班组班次 **/
			var j = ajax("${ctx}/Scheduling/insertClassGroup.do?classIds="
					+ XuanZheBanCi + "&groupId=" + groupid);

		}
		/**班组加载 **/
		banzujiazai();
	}
	/** 加载班次信息 **/
	function bancijiazai() {
		var data = ajax("${ctx}/Scheduling/selectClass.do");
		$('#tbodyBanCi').empty();
		for ( var i = 0; i < data.length; i++) {
			var html = "<tr id='BC"+data[i].positionclassesid+"'><td><input style='width:20px;height:20px;' type='checkbox' value='"+data[i].positionclassesid+"'></td>"
					+ "<td>"
					+ data[i].classesnumber
					+ "</td>"
					+ "<td>"
					+ data[i].classesname
					+ "</td>"
					+ "<td>"
					+ data[i].banduanxinxi + "</td></tr>";
			$('#tbodyBanCi').append(html);
		}

	}

	/** 	选择班次确定时触发 **/
	function queding() {
		if ($("#tladd_edit")[0].innerHTML != "编辑班组") {
			$("#XianShiBanCi").empty();
		}
		var tbodyObj = document.getElementById('tbBanCi');
		$("#tbBanCi :checkbox")
				.each(
						function(key, value) {
							if ($(value).prop("checked")) {
								var classid = $(value)[0].value;
								/** XuanZheBanCi.push(classid); **/
								var number = tbodyObj.rows[key + 1].cells[1].innerHTML;
								var name = tbodyObj.rows[key + 1].cells[2].innerHTML;
								var banduan = tbodyObj.rows[key + 1].cells[3].innerHTML;
								var html = "<span class='tooltip-show' data-toggle='tooltip' title='"+banduan+"' style='margin-left: 15px;'>("
										+ number
										+ ")"
										+ name
										+ "<input name='BanCiId' type='hidden' value='"+classid+"'>"
										+ "<button type='button' onclick=YiChuBanCi(this,'"
										+ classid
										+ "') style=float:none;font-size:26px;' class='close' aria-hidden='true'>×</button></span>";
								$('#XianShiBanCi').append(html);
							}
						});
		$("#ModalBanCi").modal("hide");
		XianShiBanDuan();
	}
	/** 鼠标移动到班次上显示班段信息 **/
	function XianShiBanDuan() {
		$(".tooltip-show").tooltip("show");
		$(".tooltip-show").tooltip("hide");

	}
	/** 移除班次 **/
	function YiChuBanCi(bt, classid) {
		/** var index = $.inArray(classid, XuanZheBanCi);
		if (index >= 0) {
		XuanZheBanCi.splice(index, 1);
		} **/

		bt.parentNode.remove();
		$("div[role='tooltip']")[0].remove();
	}
	/** 点击选择班次时触发 **/
	function onclickBanCi() {
		bancijiazai();
		var YiXuanBanCi = $("#XianShiBanCi input[name='BanCiId']");
		for ( var i = 0; i < YiXuanBanCi.length; i++) {
			$("#BC" + YiXuanBanCi[i].value)[0].hidden = true;
		}

		$("#ModalBanCi").modal("show");
	}

	/** 封装的ajax **/
	function ajax(url) {
		var mydata;
		$.ajax({
			async : false,
			type : 'post',
			url : url,
			contentType:'application/json',
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
	<div id="CBX"></div>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a>首页</a>
			</li>
			<li><a>排班管理</a>
			</li>
			<li class="active">人员排班</li>
		</ul>
	</div>
	<div style="padding-top: 6px;">
		<fieldset style="border: none;">
			<legend style="margin-bottom: 5px;"></legend>
			<button id="btndpinsert" type="button" onclick="xinjianbanzu()"
				class="btn btn-info btn-sm" style="font-size:14px">
				<i class="icon-plus-sign icon-on-right bigger-120"></i>新建班组
			</button>
			<div class="table-responsive" style="position:relative;">
				<table id="table_hover" style="border: 2px solid #dddddd;"
					class="table  table-bordered table_hover">
					<thead>
						<tr>
							<th style="text-align: center;width: 200px;">操作</th>
							<th style="text-align: center;">班组</th>
							<th style="text-align: center;">人员</th>
							<th style="text-align: center;">排班信息</th>
						</tr>
					</thead>
					<tbody id="tbodybanzuxinxi" class="tbody">
					</tbody>
				</table>
			</div>
		</fieldset>
	</div>
	<div class="modal hide fade in" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_edit" style="text-align:center" class="modal-title">添加班组</h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center;">
						<div>
							<table>
								<tr style="height: 50px;">
									<td>班组名称：</td>
									<td colspan="2"><input id="BanZuMingMheng" /><input
										id="editBanZuId" type="hidden" />
									</td>
								</tr>
								<tr>
									<td>班组成员：</td>
									<td><button id="btndpinsert" type="button"
											onclick="xuanzerenyuan()"
											style="    background: rgb(52, 154, 184); color: white;font-size: 15px;">
											<i class="icon-plus-sign icon-on-right bigger-120"></i>选择成员
										</button>
									</td>
									<td><span style="display: inline-block;font-size: 16px;">已选择<a
											id="YiXuanRenShu">0</a>人</span>
									</td>
								</tr>
								<tr style="height: 50px;">
									<td>班次：</td>
									<td><button id="btndpinsert" type="button"
											onclick="onclickBanCi()"
											style="    background: rgb(52, 154, 184); color: white;font-size: 15px;">
											<i class="icon-plus-sign icon-on-right bigger-120"></i>选择班次
										</button></td>
								</tr>
							</table>
							<div id="XianShiBanCi" style="text-align: left;"></div>
						</div>
						<div class="form-actions center">
							<button type="button" onclick="saveBanZu()"
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
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="width:inherit;left: 42%;top: 5%;"
		class="modal hide fade in" id="ModalRenYuanXuanZhe" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">


		<div class="modal-dialog" style="width: 840px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_edit" style="text-align:center" class="modal-title">员工信息</h4>
				</div>
				<div class="modal-body" style=" min-height:450px;padding: 0px;">
					<div class="content_wrap">
						<div
							style="float: right; position: relative;font-size: 18px;top: 27px;right: 30px;">
							已经选择<a id="renshu">0</a>人 <a
								href="javascript:$('#tbodyXuanZheYuanGong').empty();$('#renshu')[0].innerHTML=0;submitForm();">清空</a>
						</div>
						<div class="zTreeDemoBackground left"
							style="margin: 10px; font-size: 15px;">
							<form id="formStaff" action="" method="post">
								<table>
									<tr>
										<td>所属机构:</td>
										<td><input id="gouzuojigou" readonly="readonly"
											type="text" onclick="jigouxuanzhe(this)" style="width:115px"
											class="form-control"> <input type="hidden"
											name="departmentId" id="txtDepartmentid" value="0">
											<div id="menuContent" class="menuContent"
												style="top:40px;displayx: none; position: absolute;z-index: 99;background-color: #f9f9f9;min-height: 150px;">
												<ul id="treeDemo" class="ztree"
													style="margin-top: 0; width: 110px;">
												</ul>
											</div></td>
										<td><input name="number" placeholder="人员编号" type="text"
											style="width: 100px;" class="form-control">
										</td>
										<td><input name="name" placeholder="姓名" type="text"
											style="width: 100px;" class="form-control">
										</td>
										<td>
											<button type="button" onclick="submitForm()"
												class="btn btn-info btn-sm" style="font-size:14px">
												查询 <i class="icon-search icon-on-right bigger-120"></i>
											</button>
										</td>
										<td>
											<button type="button"
												onclick="$('#YiXuanRenShu')[0].innerHTML = $('#renshu')[0].innerHTML;$('#ModalRenYuanXuanZhe').modal('hide');"
												class="btn btn-info btn-sm" style="font-size:14px">
												确定<i class="icon-check icon-on-right bigger-110"></i>
											</button>
										</td>
									</tr>
								</table>
							</form>

						</div>

					</div>



					<div>
						<div class="table-responsive div-c" style="position:relative;">
							<table id="sample-table-2" style="border: 2px solid #dddddd;"
								class="table  table-bordered table_hover">
								<thead>
									<tr>
										<th style="text-align: center;">机构</th>
										<th style="text-align: center;">职务</th>
										<th style="text-align: center;">员工编号</th>
										<th style="text-align: center;">姓名</th>
										<th style="text-align: center;">性别</th>

									</tr>
								</thead>
								<tbody id="tbodyStaff" class="tbody">
								</tbody>
							</table>

						</div>
						<div class="div-d">
							<table id="tbXuanZheYuanGong" style="" class="table table_hover">
								<tbody id="tbodyXuanZheYuanGong" class="tbody">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal hide fade in" id="ModalBanCi" tabindex="-1"
		style="top: 4%;" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_edit" style="text-align:center" class="modal-title">添加班次</h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center;">
						<div style="min-height: 250px; max-height: 280px;">
							<table id="tbBanCi" style="border: 2px solid #dddddd;"
								class="table">
								<thead>
									<tr>
										<th style="text-align: center;width:40px">选择</th>
										<th style="text-align: center;width:100px">班次编号</th>
										<th style="text-align: center;width:100px">班次名称</th>
										<th style="text-align: center;">班段</th>
									</tr>
								</thead>
								<tbody id="tbodyBanCi" class="tbody">
								</tbody>
							</table>
						</div>
						<div class="form-actions center">
							<button type="button" onclick="queding()"
								class="btn btn-sm btn-success">
								确定 <i class="icon-check icon-on-right bigger-110"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal hide fade in" id="ModalPaiBan" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
		style="top: 0%;width:99%;left:5px;min-height: 100%;margin-left: 0px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_edit" style="text-align:center" class="modal-title">班次安排</h4>
				</div>
				<div>
					<button class="btnDisabledStyle" id="btnSelected"
						disabled="disabled" type="button" onclick="tanchubanci()"
						onblur="shiqujiaodian()">
						选择班次<span
							style="top:6px;position: relative;border-top: 4px solid #fbf7f7;"
							class="caret"></span>
					</button>
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
					<div style="display: inline-block;">
						<button class="btnstyle" type="button" onclick="QingChuSuoXuan()">
							清除所选</button>
					</div>
					<div
						style="position: relative;top: 4px;display: inline-block;font-size: 18px;color:red">
						已调整：<span id="yiTiaoZhen">0</span>
					</div>
					<div style="display: inline-block;">
						<button class="btnstyle" type="button" onclick="BaoCunPaiBan()">
							保存</button>
					</div>
					<div style="display: inline-block;">
						<button class="btnstyle" type="button" onclick="FanHui()">
							返回</button>
					</div>
				</div>
				<ul id="ulBanci" style="min-width: 88px;position: relative;"
					class="dropdown-menu" role="menu">
				</ul>
				<div
					style="text-align: center;height: 100%; width:100%;position: absolute;">
					<div style="max-height:85%;min-height: 40%;overflow:auto;">
						<table border="1" id="tbGudinglunban"
							style="min-width:2000px;max-width: 2000px;">
							<thead id="header">
							</thead>
							<tbody id="tbodyPaiBanXinXi" class="tbody">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
  var weekArray = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
  var week;
  var dangQianBanZuId;
    /**点击安排班次时触发 **/
	function anPaiBanCi(banzuid) {
   	  dangQianBanZuId=banzuid;
	  bangDingNianFen();
      RiQiChange();
      bangdingCboBanCi(banzuid);
	  $("#ModalPaiBan").modal("show");
	}
	
	/**绑定班次下拉框**/
	function bangdingCboBanCi(banzuid){
	 var BanCiData = ajax("${ctx}/Scheduling/selectClassTimes.do?groupid="+banzuid);
			$("#ulBanci").empty();
			for ( var i = 0; i < BanCiData.length; i++) {
			var html = "<li style='text-align: center;' role='presentation'> <a href=javascript:xuanShanBanCi("
					+ BanCiData[i].positionclassesid
					+ ",'"
					+ BanCiData[i].positionclasses.classesname
					+ "') role='menuitem' tabindex='-1'>"
					+ BanCiData[i].positionclasses.classesname + "</a></li>";
			$("#ulBanci").append(html);
		}
	}
	
	/** 绑定年份下拉框 **/
	function bangDingNianFen(){
		 var date= new Date();
		 var nianfen=date.getFullYear();
		 var yue=date.getMonth();
		 var shu= parseInt(nianfen)-4;
		  $("#cboNianFen").empty();
		  for(var i=0;i<9;i++){
		  var html="<option value='"+(shu+i)+"'>"+(shu+i)+"年</option>";
		  $("#cboNianFen").append(html);
		  };
		/*选上当前年月 */
		$("#cboNianFen").val(nianfen);
		$("#cboYueFen").val(yue+1);
	}
     /**获取月份有多少天**/
    function getDaysInOneMonth(year, month){  
     month = parseInt(month, 10);  
     var d= new Date(year, month, 0);  
     return d.getDate();  
	}
	
	/**日期改变时触发**/
	function RiQiChange(){
	$("#yiTiaoZhen")[0].innerHTML=0;
	 var nianfen=$("#cboNianFen").val();
	 var yuefen=$("#cboYueFen").val();
	 var dangQianRiQi=new Date();
     var tianshu=getDaysInOneMonth(nianfen,yuefen);//获取月份天数
     $("#header").empty();
     var headertr="";
     var td="";
	 for(var i=1;i<tianshu+1;i++){
	   var ri=(i<10?"0"+i:i);
	   var yueRi=(parseInt(yuefen)<10?"0"+yuefen:yuefen)+"-"+ri;
	   if(panDuanRiQi(dangQianRiQi.getFullYear()+"-"+(dangQianRiQi.getMonth()+1)+"-"+dangQianRiQi.getDate(),nianfen+"-"+yueRi)){
	    headertr=headertr+"<th onclick=onclickHearder(this,"+i+") class='headerstyle'>"
	   +"<div>"+yueRi+"</div><div>"+getWeekday(nianfen+"-"+yueRi)+"</div></th>";
	   td=td+"<td name='PB"+nianfen+"-"+yueRi+"' onclick='gaibiantdyanshi(this)'></td>";
	   }
	   else{
	    td=td+"<td name='PB"+nianfen+"-"+yueRi+"' class='mytdstyle'></td>";
	    headertr=headertr+"<th class='headerstyle'>"
	   +"<div>"+yueRi+"</div><div>"+getWeekday(nianfen+"-"+yueRi)+"</div></th>";
	   }
	}
	$("#header").append("<tr><th style='text-align:center;width:90px;font-size: 15px;font-weight: 600;background:#fafafa;'>班组成员</th>"+headertr+"</tr>");
	/* 查询班组成员 */
	 var data = ajax("${ctx}/Scheduling/selectGroupStff.do?groupid="+ dangQianBanZuId);
      $("#tbodyPaiBanXinXi").empty();
      for(var j=0;j<data.length;j++){
      var tr= tr+"<tr id='YGXX"+data[j].staffid+"'>"+"<td class='tdstyle'>"+"("+data[j].staffnumber+")"+data[j].staffname+"</td>"+td+"</tr>";
      }
      $("#tbodyPaiBanXinXi").append(tr);
      btnDisabled();
      BangDingZhiQianJiLu(nianfen,yuefen,tianshu);
	}
	/**查询班组员工之前的分班记录绑定显示**/
	function BangDingZhiQianJiLu(nianfen,yuefen,tianshu){
	 var LiShiJiLuData = ajax("${ctx}/Scheduling/selectGroupRecord.do?goupid="+dangQianBanZuId+
	 "&bginDate="+nianfen+"-"+yuefen+"-01"
	 +"&endDate="+nianfen+"-"+yuefen+"-"+tianshu);
	 for(var i=0;i<LiShiJiLuData.length;i++){
	 var workdate=LiShiJiLuData[i].workdate;
	 var html= "<div name='Before'><span name='classid' style='display:none'>"+LiShiJiLuData[i].classid+"</span><span name='workdate' style='display:none'>"+LiShiJiLuData[i].workdate+"</span><span name='classesrecordid' style='display:none'>"+LiShiJiLuData[i].classesrecordid+"</span>"+LiShiJiLuData[i].classname+"</div>";
     $("#tbodyPaiBanXinXi tr[id='YGXX"+LiShiJiLuData[i].staffid+"'] td[name='PB"+workdate+"']").append(html);
	 }
	}
   /**判断日期是否小于当前日期**/ 
    function panDuanRiQi(beginDate,endDate){
    var  d1=new Date(beginDate);
    var d2=new Date(endDate);
   if(d1>d2)  
   {
   return false;  
   }
   else{
   return true;  
   }
   }
	function getWeekday(riqi){
      week=new Date(riqi).getDay();
      return weekArray[week];
	}
	 /**选上td时改变样式**/
	 function gaibiantdyanshi(td) {
		if ($(td).hasClass("mytd")) {
			$(td).removeClass("mytd");
		} else {
			$(td).addClass("mytd");
		}
		btnDisabled();
	}
	/**是否让用户使用选择班次按钮**/
	function btnDisabled(){
	if($(".mytd").length>0){
		$("#btnSelected").removeAttr("disabled");
		$("#btnSelected").removeClass("btnDisabledStyle");
		$("#btnSelected").addClass("btnstyle");
		}else{
		$("#btnSelected").attr("disabled","disabled");
		 $("#btnSelected").removeClass("btnstyle");
		 $("#btnSelected").addClass("btnDisabledStyle");
		}
	}
	/** 点击表头时选上一列 **/
	function onclickHearder(th,dijilie){
     var tr= $("#tbodyPaiBanXinXi tr");
 	 if ($(th).hasClass("myclass")) {
 			$(th).removeClass("myclass");
 			 for(var i=0;i<tr.length;i++){
	 $(tr[i].children[dijilie]).removeClass("mytd");
	 }
 		} else {
 			$(th).addClass("myclass");
 		 for(var i=0;i<tr.length;i++){
	   $(tr[i].children[dijilie]).addClass("mytd");
	 }
 		}
	 btnDisabled();
	}

	/**弹出班次供选择 **/
	function tanchubanci(){
	$("#ulBanci").show("fast");
	}
	/**班次按钮失去焦点事件 **/
	function shiqujiaodian() {
	$("#ulBanci").fadeOut("fast"); 
	}
	/**选择班次时触发**/
	function xuanShanBanCi(classid,classname){
	$(".mytd div[name='Before']").hide();
	$(".mytd").each(function(){
	var before= $(this).find("div[name='Before']");
	var workdate=this.attributes[0].nodeValue.substr(2,12);
	if(before.length>0){
	 if(before[0].children[0].innerHTML!=classid){
	  $(this).find("div[name='Update']").remove();
	  $(this).find("div[name='Delete']").remove();
	  var html= "<div name='Update'><span name='classid' style='display:none'>"+classid+"</span><span name='workdate' style='display:none'>"+workdate+"</span><span name='staffid' style='display:none'>"+this.parentNode.id.substr(4)+"</span>"+classname+"</div>";
	  $(this).append(html);
	  }
	  else{
	  $(this).find("div[name='Update']").remove();
	  $(this).find("div[name='Delete']").remove();
	  $(this).find("div[name='Before']").show();
	  }
	}
	else{
	  $(this).find("div[name='Insert']").remove();
	  var html= "<div name='Insert'><span name='classid' style='display:none'>"+classid+"</span><span name='workdate' style='display:none'>"+workdate+"</span><span name='staffid' style='display:none'>"+this.parentNode.id.substr(4)+"</span>"+classname+"</div>";
	  $(this).append(html);
	}
	});
	$(".mytd").removeClass("mytd");
	$(".myclass").removeClass("myclass");
	btnDisabled();
	YiTiaoZhen();
	}
    
	/**清除所选班次**/
	function QingChuSuoXuan(){
	$(".mytd div[name='Before']").hide();
	$(".mytd").each(function(){
	var before= $(this).find("div[name='Before']");
	var workdate=this.attributes[0].nodeValue.substr(2,12);
	if(before.length>0){
	  $(this).find("div[name='Update']").remove();
	  var html= "<div name='Delete'><span name='classesrecordid' style='display:none'>"+before[0].children[2].innerHTML+"</span></div>";
	  $(this).append(html);
	  }
	else{
	$(this).empty();
	}
	});
	$(".mytd").removeClass("mytd");
	$(".myclass").removeClass("myclass");
	btnDisabled();
	YiTiaoZhen();
	}
	/**显示已调整的数据**/
	function YiTiaoZhen(){
	$("#yiTiaoZhen")[0].innerHTML=$("#tbodyPaiBanXinXi td div[name='Insert']").length+$("#tbodyPaiBanXinXi td div[name='Delete']").length+$("#tbodyPaiBanXinXi td div[name='Update']").length;
	}
	/**保存安排的班次**/
 function BaoCunPaiBan(){
 if($("#yiTiaoZhen")[0].innerHTML>0){
  var deleteIds=[];
  $("#tbodyPaiBanXinXi td div[name='Delete']").each(function(){
  var deleteId= $(this).find("span[name='classesrecordid']")[0].innerHTML;
  deleteIds.push(deleteId);
  });
  var updates="";
  $("#tbodyPaiBanXinXi td div[name='Update']").each(function(i,div){
    updates=updates+"listUpdate["+i+"].staffid="+$(this).find("span[name='staffid']")[0].innerHTML
   +"&listUpdate["+i+"].workdate="+$(this).find("span[name='workdate']")[0].innerHTML
   +"&listUpdate["+i+"].classid="+$(this).find("span[name='classid']")[0].innerHTML+"&";
  });
  var inserts="";
   $("#tbodyPaiBanXinXi td div[name='Insert']").each(function(i,div){
    inserts=inserts+"listInsert["+i+"].staffid="+$(this).find("span[name='staffid']")[0].innerHTML
   +"&listInsert["+i+"].workdate="+$(this).find("span[name='workdate']")[0].innerHTML
   +"&listInsert["+i+"].classid="+$(this).find("span[name='classid']")[0].innerHTML
   +"&listInsert["+i+"].groupid="+dangQianBanZuId
   +"&";
  });
 var shulian= ajax("${ctx}/Scheduling/updatePaiBanXinXi.do?"+updates+inserts+"deleteIds="+deleteIds+"&groupid="+dangQianBanZuId); 
   if(shulian>-1){
   /**重新加载班组**/
    banzujiazai();
    if(confirm("保存成功,是否确定继续排班？")){
    RiQiChange();
    }
    else{
     $("#ModalPaiBan").modal("hide");
    }
   }
 }
 else{
 alert("无班次可调整");
 }
 }
 
 /**返回**/
 function FanHui(){
 if(confirm("是否确定放弃本次编辑吗？")){
  $("#ModalPaiBan").modal("hide");
   }
 }
 
 
 
 
 
 
 
/*  function cbx(){
 $.ajax({
            url:"${ctx}/Scheduling/CBX.do",
            type:"post",
            traditional:true,
            data:{"listInsert[0].classid":1,"listInsert[1].classid":2,"deleteIds":[0,1],groupid:0},//将json数据传给后台，供后台处理
            dataType:"json",
            success:function(data){
            }});
 
 } */
 
 
 
 
 
 
 
 
 
 
</script>
</html>


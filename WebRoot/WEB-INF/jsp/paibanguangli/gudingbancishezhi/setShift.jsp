<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML >
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
	border-bottom: 1px solid red;
}

#tbGudinglunban tr th {
	text-align: center;
	width: 44px;
}

.trClass {
	background: rgba(98, 168, 209, 0.11);
}
</style>

<SCRIPT type="text/javascript">
	$(document).ready(function() {
		$("#menuContent").hide();
		bangdingDepartment();
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
		$("#menuContent").fadeOut("fast");
		dianjibangding(treeNode);
	}
	//点击下拉树绑定职务下拉 
	function dianjibangding(treeNode) {
		getChildNodes(treeNode);
		var data = ajax("${ctx}/SetClasses/selectBydepartmentids.do?ids="
				+ departmentNodes);
		$("#tbodyJigou").empty();
		for ( var i = 0; i < data.length; i++) {
			var html = "<tr onclick='onclickmyRow(this,"
					+ data[i].staffpositionid + ")'>" + "<td>"
					+ data[i].department.number + "</td>" + "<td>"
					+ data[i].department.name + "</td>" + "<td>"
					+ data[i].position.name + "</td></tr>";
			$("#tbodyJigou").append(html);
		}
	}
	//点击机构文本框时触发
	function tianchujigou(event) {
		var cityObj = $("#gouzuojigou");
		var cityOffset = $("#gouzuojigou").offset();
		$("#menuContent").css({
			left : cityOffset.left,
			offsetTop : event.offsetTop
		}).slideDown("fast");
	}
	var departmentNodes = [];
	//获取子节点
	function getChildNodes(treeNode) {
		var childNodes = $.fn.zTree.getZTreeObj("treeDemo").transformToArray(
				treeNode);
		var nodes = new Array();
		for (i = 0; i < childNodes.length; i++) {
			nodes[i] = childNodes[i].id;
		}
		departmentNodes = nodes;//.join(",")
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
	/* 点击 添加固定轮班按钮是触发 */
	function insertShift() {
		qingkong();
		$("#tladd_editBanduan")[0].innerHTML = "新增固定轮班";
		$("#myspand").show();
		$("#myModal").modal("show");
	}
	var positionid = -1;
	var positionRow = null;
	/* 点击职务行改变样式 */
	function onclickmyRow(tr, staffPositionid) {
		positionRow = tr;
		positionid = staffPositionid;
		$("#tbodyJigou tr").removeClass("trClass");
		$(tr).addClass("trClass");
		/* 绑定职务班次 */
		var data1 = ajax("${ctx}/SetClasses/selectPositionclasse.do?positionid="
				+ staffPositionid);
		$("#ulBanci").empty();
		$("#tbodyLunbanmingxi").empty();
		for ( var i = 0; i < data1.length; i++) {
			var html = "<li style='text-align: center;' role='presentation'> <a href=javascript:onclickBanci("
					+ data1[i].positionclassesid
					+ ",'"
					+ data1[i].classesname
					+ "') role='menuitem' tabindex='-1'>"
					+ data1[i].classesname + "</a></li>";
			$("#ulBanci").append(html);
		}

		/* 根据职务查询固定轮班 */
		var data = ajax("${ctx}/SetShift/selectShiftByPositionid.do?id="
				+ staffPositionid);
		$("#tbodyLunban").empty();
		for ( var i = 0; i < data.length; i++) {
			var html = "<tr onclick=onclickGudinglunban(this,"
					+ data[i].shiftid
					+ ")><td><a href=javascript:deleteShiftAndChild("
					+ data[i].shiftid + ")>【删除】</a>"
					+ "<a href=javascript:updateShiftAndChild("
					+ data[i].shiftid + ",'" + data[i].shiftnumber + "','"
					+ data[i].shiftname + "')>【编辑】</a></td>" + "<td>"
					+ data[i].shiftnumber + "</td>" + "<td>"
					+ data[i].shiftname + "</td></tr>";
			$("#tbodyLunban").append(html);
		}
	}
	var lunbanmingxiRow;
	/* 点击固定轮班的行时触发,根据固定轮班查询轮班明细*/
	function onclickGudinglunban(tr, shiftid) {
		lunbanmingxiRow = tr;
		gudinglunbanid = shiftid;
		$("#tbodyLunban tr").removeClass("trClass");
		$(tr).addClass("trClass");
		var data = ajax("${ctx}/SetShift/selectShiftChildByShiftid.do?shiftid="
				+ shiftid);
		var length = data.length;
		var quzheng = Math.ceil(length / 10);
		$("#tbodyLunbanmingxi").empty();
		for ( var i = 0; i < quzheng; i++) {
			var html = "";
			for ( var j = 0; j < 10; j++) {
				var n = (i * 10 + j);
				if (n < length) {
					html += "<td style='height: 20px;'> <span name='xianshi'>"
							+ data[n].positionclasses.classesname
							+ "</span><span name='shiftChildId' style='display: none;'>"
							+ data[n].shiftchildid + "</span>"
							+ "<span name='banciid' style='display: none;'>"
							+ data[n].positionclassesid + "</span></td>";
				} else {
					html += "<td style='height: 20px;background:rgba(164, 168, 169, 0.2);'></td>";
				}
			}

			$("#tbodyLunbanmingxi").append(
					"<tr><td>" + (i + 1) + "</td>" + html + "</tr>");
		}
	}
	/* 生成模板 */
	function shengchengmuban() {
		if ($("#txtLunbanzhouqi").val() > 0) {
			var zhouqi = $("#txtLunbanzhouqi").val();
			var quzheng = Math.ceil(zhouqi / 10);
			$("#tbodyMuBan").empty();
			for ( var i = 0; i < quzheng; i++) {
				var html = "";
				for ( var j = 0; j < 10; j++) {
					if ((i * 10 + j) < zhouqi) {
						html += "<td onclick='gaibiantdyanshi(this)' style='height: 20px;'><span name='xianshi'></span><span name='lunbanxunxuid' style='display: none;'><span name='banciid' style='display: none;'></span></td>";
					} else {
						html += "<td style='height: 20px;background:rgba(164, 168, 169, 0.2);'></td>";
					}
				}
				$("#tbodyMuBan").append(
						"<tr><td>" + (i + 1) + "</td>" + html + "</tr>");
			}
		} else {
			alert("请输入轮班周期");
		}
	}
	function gaibiantdyanshi(td) {
		if ($(td).hasClass("mytd")) {
			$(td).removeClass("mytd");
		} else {
			$(td).addClass("mytd");
		}
	}
	/* 选择班次时触发 */
	function onclickBanci(classid, classname) {
		$(".mytd span[name='xianshi']").empty();
		$(".mytd span[name='banciid']").empty();
		$(".mytd span[name='banciid']").append(classid);
		$(".mytd span[name='xianshi']").append(classname);
		$(".mytd").removeClass("mytd");
	}
	/*   班次按钮失去焦点事件 */
	function shiqujiaodian() {
		$("#ulBanci").fadeOut("fast");
	}
	function jiaodian() {
		$("#ulBanci").show();
	}
	var gudinglunbanid = 0;
	/*新增固定轮班和轮班明细 */
	function submitForm() {
		var mynumber = $("#txtnumber").val();
		var myname = $("#txtname").val();
		/*  修改固定轮班 */
		if ($("#tladd_editBanduan")[0].innerHTML == "修改固定轮班") {
			ajax("${ctx}/SetShift/updateShift.do?shiftid=" + gudinglunbanid
					+ "&shiftnumber=" + mynumber + "&shiftname=" + myname);
			var tbshu = $("#tbodyMuBan tr td").length;
			var n = 1;
			$("#tbodyMuBan tr")
					.find("td")
					.each(
							function() {
								n++;
								var childs = $(this).children();
								if (childs.length == 3) {
									ajax("${ctx}/SetShift/updateShiftChild.do?shiftchildid="
											+ childs.eq(1).text()
											+ "&positionclassesid="
											+ childs.eq(2).text());
								}
								if (tbshu == n) {
									alert("修改成功");
									$("#myModal").modal("hide");
									qingkong();
									onclickGudinglunban(lunbanmingxiRow,
											gudinglunbanid);
								}
							});
		}
		/*新增固定轮班 */
		else {
			var Shiftchild = [];
			var child;
			var banci = $("#tbodyMuBan tr td span[name='banciid']");
			var length = banci.length;
			var j = 0;
			for ( var i = 0; i < length; i++) {
				var banciid = banci[i].innerHTML;
				if (banciid != "") {
					child = {
						positionclassesid : banciid,
						rankorder : (j + 1)
					};
					Shiftchild[j] = child;
					j++;
				}
			}
			var Shift = {
				shiftnumber : mynumber,
				shiftname : myname,
				staffpositionid : positionid
			};
			var data = ajax("${ctx}/SetShift/insertShiftAndChild.do?t="
					+ JSON.stringify(Shift) + "&listChild="
					+ JSON.stringify(Shiftchild));
			if (data == "1") {
				alert($("#tladd_editBanduan")[0].innerHTML + "成功");
				$("#myModal").modal("hide");
				qingkong();
				onclickmyRow(positionRow, positionid);
			} else {
				alert($("#tladd_editBanduan")[0].innerHTML + "失败");
			}
		}

	}
	/* 清空新增固定轮班 */
	function qingkong() {
		$("#txtnumber").val("");
		$("#txtname").val("");
		$("#txtLunbanzhouqi").val("");
		$("#tbodyMuBan").empty();
	}
	/* 删除固定轮班和明细 */
	function deleteShiftAndChild(shiftid) {
		if (confirm("是否确定删除，一旦删除无法恢复")) {
			var data = ajax("${ctx}/SetShift/deleteShiftAndChild.do?shiftid="
					+ shiftid);
			if (data == "1") {
				alert("删除成功");
				onclickmyRow(positionRow, positionid);
				$("#tbodyLunbanmingxi").empty();
			} else {
				alert("删除失败");
			}
		}
	}
	/* 修改固定轮班和明细 */
	function updateShiftAndChild(shiftid, nubmer, name) {
		$("#tladd_editBanduan")[0].innerHTML = "修改固定轮班";
		$("#myspand").hide();
		$("#myModal").modal("show");
		$("#txtnumber").val(nubmer);
		$("#txtname").val(name);
		var data = ajax("${ctx}/SetShift/selectShiftChildByShiftid.do?shiftid="
				+ shiftid);
		var length = data.length;
		var quzheng = Math.ceil(length / 10);
		$("#tbodyMuBan").empty();
		for ( var i = 0; i < quzheng; i++) {
			var html = "";
			for ( var j = 0; j < 10; j++) {
				var n = (i * 10 + j);
				if (n < length) {
					html += "<td onclick='gaibiantdyanshi(this)' style='height: 20px;'> <span name='xianshi'>"
							+ data[n].positionclasses.classesname
							+ "</span><span name='shiftChildId' style='display: none;'>"
							+ data[n].shiftchildid
							+ "</span>"
							+ "<span name='banciid' style='display: none;'>"
							+ data[n].positionclassesid + "</span></td>";
				} else {
					html += "<td style='height: 20px;background:rgba(164, 168, 169, 0.2);'></td>";
				}
			}
			$("#tbodyMuBan").append(
					"<tr><td>" + (i + 1) + "</td>" + html + "</tr>");
		}
	}
	/* 封装的ajax */
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
</SCRIPT>
<body style="text-align: center">
	<div></div>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
			<li><a href="#">排班管理</a></li>
			<li class="active">固定轮班设置</li>
		</ul>
	</div>


	<div class="content_wrap">
		<div class="zTreeDemoBackground left"
			style="padding:6px; padding-bottom: 0px;">
			所属机构：<input id="gouzuojigou" style="margin-bottom: 0px;width: 150px;"
				readonly="readonly" onclick="tianchujigou(this)" type="text"
				class="form-control">
		</div>
	</div>
	<div id="menuContent" class="menuContent"
		style="displayx: none; position: absolute;z-index: 99;background-color: #f9f9f9;">
		<ul id="treeDemo" class="ztree" style="margin-top: 0; width: 150px;">
		</ul>
	</div>

	<div style="padding-top: 6px;">
		<fieldset>
			<legend style="margin-bottom: 5px;"></legend>
			<div class="table-responsive"
				style="position:relative;max-height:300px;min-height: 200px">
				<table id="table_hover" style="border: 2px solid #dddddd;"
					class="table  table-bordered table_hover">
					<thead>
						<tr>
							<th style="text-align: center;">机构编号</th>
							<th style="text-align: center;">机构名称</th>
							<th style="text-align: center;">职位名称</th>

						</tr>
					</thead>
					<tbody id="tbodyJigou">
					</tbody>
				</table>
			</div>
		</fieldset>
	</div>
	<div>
		<div style="float:left;margin-right: 10px;">
			<fieldset
				style="border-color:#E2DED6;border-width:1px;border-style:Solid;margin-left:20px;margin-right:20px">
				<legend
					style="color:#333333;font-size:0.8em;font-weight:bold;margin-bottom:0px">固定轮班表</legend>
				<button id="btndpinsert" type="button" onclick="insertShift()"
					class="btn btn-info btn-sm" style="font-size:14px">
					添加轮班<i class="icon-plus-sign icon-on-right bigger-120"></i>
				</button>
				<div class="table-responsive"
					style="position:relative;max-height:300px;min-height: 200px">
					<table style="min-width: 280px;" id="sample-table-3"
						style="border: 2px solid #dddddd;"
						class="table  table-bordered table_hover">
						<thead>
							<tr>
								<th style="text-align: center;">操作</th>
								<th style="text-align: center;">轮班编号</th>
								<th style="text-align: center;">轮班名称</th>
							</tr>
						</thead>
						<tbody id="tbodyLunban" class="tbody">
						</tbody>
					</table>
				</div>
			</fieldset>
		</div>
		<div style="">
			<fieldset
				style="border-color:#E2DED6;border-width:1px;border-style:Solid;margin-left:20px;margin-right:20px">
				<legend
					style="color:#333333;font-size:0.8em;font-weight:bold;margin-bottom:0px">固定轮班模板表</legend>
				<div class="table-responsive"
					style="position:relative;max-height:300px;min-height: 200px">
					<table id="sample-table-3" style="border: 2px solid #dddddd;"
						class="table  table-bordered table_hover">
						<thead>
							<tr>
								<th style="text-align: center;">序号</th>
								<th style="text-align: center;">1</th>
								<th style="text-align: center;">2</th>
								<th style="text-align: center;">3</th>
								<th style="text-align: center;">4</th>
								<th style="text-align: center;">5</th>
								<th style="text-align: center;">6</th>
								<th style="text-align: center;">7</th>
								<th style="text-align: center;">8</th>
								<th style="text-align: center;">9</th>
								<th style="text-align: center;">10</th>
							</tr>
						</thead>
						<tbody id="tbodyLunbanmingxi" class="tbody">
						</tbody>
					</table>
				</div>
			</fieldset>
		</div>
	</div>




	<div style="width:660px" class="modal hide fade in" id="myModal"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_editBanduan" style="text-align:center"
						class="modal-title"></h4>
				</div>
				<div class="modal-body" style=" max-height: 495px;">
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-body">

									<form id="form" enctype="multipart/form-data"
										accept-charset="UTF-8">
										<table class="table table-bordered"
											style="border: 1px solid #dddddd">
											<tr>
												<td style="background-color: #ebf3fb;">固定轮班编号</td>
												<td><input id="txtnumber"></td>
												<td style="background-color: #ebf3fb;">固定轮班名称</td>
												<td><input id="txtname"></td>
											</tr>
										</table>
										<div class="dropdown">
											<button onblur="shiqujiaodian()" onclick="jiaodian()"
												type="button" class="btn btn-info btn-sm dropdown-toggle"
												data-toggle="dropdown">
												选择班次 <span class="caret"></span>
											</button>
											<ul id="ulBanci" style="min-width: 88px;"
												class="dropdown-menu" role="menu">
											</ul>
											<span id="myspand"> <span
												style="font-size: 16px;top: 0px;margin: 4px; position: relative;">轮班周期</span><input
												id="txtLunbanzhouqi" type="number"
												style="font-size: 20px;color: red;width: 49px;"
												placeholder="天">
												<button id="btnShengchengmuban" type="button"
													class="btn btn-info btn-sm" onclick="shengchengmuban()"
													style="font-size:14px">生成模板</button> </span>
										</div>
										<div style="min-height: 150px;">
											<table id="tbGudinglunban" style="border: 2px solid #dddddd;"
												class="table table-bordered ">
												<thead>
													<tr>
														<th style="text-align: center;width: 44px;">序号</th>
														<th>1</th>
														<th>2</th>
														<th>3</th>
														<th>4</th>
														<th>5</th>
														<th>6</th>
														<th>7</th>
														<th>8</th>
														<th>9</th>
														<th>10</th>
													</tr>
												</thead>
												<tbody id="tbodyMuBan" class="tbody">

												</tbody>
											</table>

										</div>

										<div class="form-actions center">
											<button type="button" onclick="submitForm()"
												class="btn btn-sm btn-success">
												保 存 <i class="icon-check icon-on-right bigger-110"></i>
											</button>
											<button type="reset" class="btn btn-sm btn-warning"
												onclick="qingkongbiaodan()">
												重置 <i class="icon-undo icon-on-right bigger-110"></i>
											</button>
											<button
												onclick="containerChange('<%=path%>/employeeController/listPage.do')"
												type="button" class="btn btn-sm btn-info">
												返 回 <i class="icon-reply icon-on-right bigger-110"></i>
											</button>
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>

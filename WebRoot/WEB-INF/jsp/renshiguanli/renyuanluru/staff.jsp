<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
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

.table_hover tr:HOVER {
	background-color: rgba(98, 168, 209, 0.11);
}

.thisdate {
	font-size: 15px;
	width: 130px;
	font-weight: 800;
	height: 11px;
}

.trClass {
	background: rgba(98, 168, 209, 0.11);
}

#tbodyStaff tr td {
	text-align: center;
	vertical-align: middle;
}
</style>
<SCRIPT type="text/javascript">
	var BanZuID;
	var ZhiDuID;
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
			//zTree节点的点击事件
			onClick : onClick
		}
	};
	var setting1 = {
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
			//zTree节点的点击事件
			onClick : onclickinsert
		}
	};

	//点击某个节点 然后将该节点的名称赋值值文本框
	function onClick(e, treeId, treeNode) {
		getChildNodes(treeNode);
		$("#txtDepartmentid").val(treeNode.id);
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		//获得选中的节点
		var nodes = zTree.getSelectedNodes(), v = "";
		//根据id排序
		nodes.sort(function compare(a, b) {
			return a.id - b.id;
		});
		for ( var i = 0, l = nodes.length; i < l; i++) {
			v += nodes[i].name + ",";
		}
		//将选中节点的名称显示在文本框内
		if (v.length > 0)
			v = v.substring(0, v.length - 1);
		var cityObj = $("#Department");
		cityObj.attr("value", v);
		//隐藏zTree
		hideMenu();
		return false;
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
		//查询部门职务
		selectOpsition();
	}

	//显示树
	function showMenu() {
		var cityObj = $("#Department");
		var cityOffset = $("#Department").offset();
		$("#menuContent").css({
			left : cityOffset.left + "px",
			top : "82px"
		}).slideDown("fast");
	}

	//隐藏树
	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		// $("body").unbind("mousedown", onBodyDown);
	}

	$(document)
			.ready(
					function() {
						$("#menuContent").hide();
						/* 身份验证 */
						jQuery.validator.addMethod("isIdCardNo", function(
								value, element) {
							return this.optional(element)
									|| idCardNoUtil.checkIdCardNo(value);
						}, "请正确输入您的身份证号码");
						$("#menuContent1").hide();
						$("#myModal").modal("hide");//隐藏模态框
						bangdingDepartment();//查询部门下拉树
						bangdingOpsitionType();//查询职位状态
						bangdingGroupCbo();
						selectAllStaff();//查询所有员工 
						bangdingSystemCbo();
						fromYanZhen();
						//图片变更
						$("#upimg")
								.change(
										function() {
											var $file = $(this);
											var fileObj = $file[0];
											var windowURL = window.URL
													|| window.webkitURL;
											var dataURL;
											var $img = $("#image-view");//<img>标签
											//当图片名称为空时，照片不显示。
											if (document
													.getElementById('upimg').value
													.trim() == "") {
												//document.getElementById('tr_userpicture').style.display = 'none';
											}
											if (fileObj && fileObj.files
													&& fileObj.files[0]) {
												dataURL = windowURL
														.createObjectURL(fileObj.files[0]);
												//允许上传的图片格式  
												var newPreview = document
														.getElementById("upimg").value;
												var regext = /\.jpg$|\.gif$|\.jpeg$|\.png$|\.bmp$/gi;
												if (!regext.test(newPreview)) {
													newPreview == "";
													alert("选择的照片格式不正确，请重新选择！");
													$(fileObj)
															.after(
																	$(fileObj)
																			.clone(
																					$(fileObj)));
													$(fileObj).remove();
													return false;
												}
												$img.attr("src", dataURL);
											} else {
												dataURL = $file.val();
												var imgObj = document
														.getElementById("image-view");
												imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
												imgObj.filters
														.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
											}
										});

					});
	//点击新增员工按钮是触发
	function insertStaff() {
		qingkongbiaodan();//先清空form数据
		$("label[class='error']").remove();
		$("#thistr").show();
		$("#lizhi").hide();
		$("#myModal").modal("show");
		$("#tladd_edit")[0].innerHTML = "新增员工";
	}
	/** 表单提交验证**/
	function fromYanZhen() {
		$("#form").validate({
			rules : {
				staffname : {
					required : true
				},
				staffnumber : {
					required : true
				},
				password : {
					required : true,
					minlength : 3
				},
				topassword : {
					required : true,
					minlength : 3,
					equalTo : "#topassword"
				},
				loginnumber : {
					required : true
				},
				idcar : {
					required : true
				},
				cardnumber : {
					required : true
				},
				dateofentry : {
					required : true
				},
				username : {
					required : true
				},
				systemid : {
					required : true
				},
				staffpositionid : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				idcar : {
					required : true,
					isIdCardNo : true
				}
			},
			messages : {
				staffname : {
					required : "*请输员工姓名"
				},
				staffnumber : {
					required : "*请输员工编号"
				},
				password : {
					required : "*请输入密码",
					minlength : "*密码不能小于3个字符"
				},
				topassword : {
					required : "*请输入确认密码",
					minlength : "*密码不能小于3个字符",
					equalTo : "*请再次输入相同的值"
				},
				loginnumber : {
					required : "*请输入登记号码"
				},
				idcar : {
					required : "*请输入身份证号码"
				},
				cardnumber : {
					required : "*请输入卡片号码"
				},
				dateofentry : {
					required : "*请选择入职日期"
				},
				username : {
					required : "*请输入用户名"
				},
				systemid : {
					required : "*请选择考勤制度"
				},
				staffpositionid : {
					required : "*请选择员工职务"
				},
				email : {
					required : "*请输入邮箱",
					email : "*请输入正确的邮箱格式"
				}
			}
		});

	}
	//新增员工
	function submitForm() {
		var formData = new FormData($("#form")[0]);
		if ($("#tladd_edit")[0].innerHTML.trim() == "新增员工") {
			if ($("#form").valid()) {
				$.ajax({
					url : "${ctx}/staff/insertStaff.do",
					type : 'POST',
					data : formData,
					async : false,
					cache : false,
					scriptCharset : "utf-8",
					contentType : false,
					processData : false,
					dataType : "json",
					success : function(data) {
						if (data == "1") {
							alert("新增成功");
							selectAllStaff();
							$("#myModal").modal("hide");
						} else {
							alert("新增失败");
						}
					},
					error : function(data) {

					}
				});
			}
		} else {
			if ($("#form").valid()) {
				if ("" + BanZuID != $("#cboGroup").val()) {
					ajax("${ctx}/staff/deleteRecordByStaffid.do?staffid="
							+ $("#staffid").val());
				}
				if(""+ZhiDuID!=$("#cboSystem").val()){
				ajax("${ctx}/staff/updateStaffSystem.do?staffid="+ $("#staffid").val()+"&systemid="+$("#cboSystem").val());
				}
				$.ajax({
					url : "${ctx}/staff/updateStaff.do",
					type : 'POST',
					data : formData,
					async : false,
					cache : false,
					scriptCharset : "utf-8",
					contentType : false,
					processData : false,
					dataType : 'HTML',
					success : function(data) {
						if (data == "1") {
							alert("修改成功");
							selectAllStaff();
							$("#myModal").modal("hide");
						} else {
							alert("修改失败");
						}
					},
					error : function(data) {

					}
				});
			}
		}
	}

	//查询部门绑定下拉树、
	function bangdingDepartment() {
		var zNode = [];
		$.ajax({
			async : false,//同步异步
			type : 'post',
			url : '${ctx}/staff/selectDepartment.do',
			dataType : "json",
			scriptCharset : "utf-8",
			success : function(data) {
				for ( var i = 0; i < data.length; i++) {
					zNode.push({
						id : data[i].departmentid,
						pId : data[i].fatherid,
						name : data[i].name,
						open : true
					});
				}
				$.fn.zTree.init($("#treeDemo"), setting, zNode);
				$.fn.zTree.init($("#Ztree"), setting1, zNode);

			},
		});
	}
	//根据部门id查询部门职务
	function selectOpsition() {
		$.ajax({
			async : false,//同步异步
			type : 'post',
			url : '${ctx}/staff/selectOpsition.do' + "?departmentids="
					+ departmentNodes,
			dataType : "json",
			scriptCharset : "utf-8",
			success : function(data) {
				$("#cboPositonid").empty();
				$("#cboPositonid").append(
						"<option selected='selected' value='0'>全部</option>");
				for ( var i = 0; i < data.length; i++) {
					var html = "<option value='"+data[i].positionid+"'>"
							+ data[i].position.name + "</option>";
					$("#cboPositonid").append(html);
				}
			},
		});
	}
	/** 查询考勤制度绑定下拉框 **/
	function bangdingSystemCbo() {
		var data = ajax("${ctx}/SetSystem/selectSystems.do");
		for ( var i = 0; i < data.length; i++) {
			var html = "<option value='"+data[i].systemid+"'>"
					+ data[i].systemname + "</option>";
			$("#cboSystem").append(html);
		}
	}
	/** 查询班组绑定下拉框 **/
	function bangdingGroupCbo() {
		$("#cboGroupid").append("<option value='0'>所有班组</option>");
		var data = ajax("${ctx}/setDeparment/selectByAttributeGatherId.do?attributeGatherId=7");
		for ( var i = 0; i < data.length; i++) {
			var html = "<option value='"+data[i].attributegatherchildid+"'>"
					+ data[i].name + "</option>";
			$("#cboGroupid").append(html);
			$("#cboGroup").append(html);

		}
	}
	//绑定职位转态下拉框
	function bangdingOpsitionType() {
		$
				.ajax({
					async : false,//同步异步
					type : 'post',
					url : '${ctx}/setDeparment/selectByAttributeGatherId.do'
							+ "?attributeGatherId=1",
					dataType : "json",
					scriptCharset : "utf-8",
					success : function(data) {
						$("#cboPositionTypeid").empty();
						$("#cboPositionTypeid")
								.append(
										"<option selected='selected' value='0'>所有状态</option>");
						for ( var i = 0; i < data.length; i++) {
							var html = "<option value='"+data[i].attributegatherchildid+"'>"
									+ data[i].name + "</option>";
							$("#cboPositionTypeid").append(html);
							$("#updatePositiontypeid").append(html);
						}
					},
				});
	}

	//模糊查询员工信息
	function selectAllStaff() {
		$
				.ajax({
					async : false,//同步异步
					type : 'post',
					url : "${ctx}/staff/selectAllStaff.do?departmentids="
							+ departmentNodes,
					data : {
						positionid : $("#cboPositonid").val() == null ? 0 : $(
								"#cboPositonid").val(),
						typeid : $("#cboPositionTypeid").val() == null ? 0 : $(
								"#cboPositionTypeid").val(),
						number : $("#txtNumber").val(),
						name : $("#txtName").val(),
						groupid : $("#cboGroupid").val(),
					},
					dataType : "json",
					scriptCharset : "utf-8",
					success : function(data) {
						$('#tbodyStaff').empty();
						for ( var i = 0; i < data.length; i++) {
							var xingbie = data[i].sex == 0 ? "女" : "男";
							var html = "<tr onclick='onclickStaffRow(this)'><td><a href='javascript:deleteStaff("
									+ data[i].staffid
									+ ")'>【删除】</a><a href='javascript:updateStaff("
									+ data[i].staffid
									+ ")'>【编辑】</a></td>"
									+ "<td><a><img style='width:50px;height:38px'  src='/pic/"+data[i].headimage+"'></a></td>"
									+ "<td>"
									+ data[i].positiontype.name
									+ "</td>"
									+ "<td>"
									+ data[i].staffPosition.department.name
									+ "</td>"
									+ "<td>"
									+ data[i].staffPosition.position.name
									+ "</td>"
									+ "<td>"
									+ data[i].system.systemname
									+ "</td>"
									+ "<td>"
									+ data[i].groupname.name
									+ "</td>"
									+ "<td>"
									+ data[i].staffname
									+ "</td>"
									+ "<td>"
									+ xingbie
									+ "</td>"
									+ "<td>"
									+ data[i].staffnumber
									+ "</td>"
									+ "<td>"
									+ data[i].loginnumber
									+ "</td>"
									+ "<td>"
									+ data[i].dateofentry
									+ "</td>"
									+ "<td>"
									+ data[i].leavedate
									+ "</td>"
									+ "<td>"
									+ data[i].idcar
									+ "</td>"
									+ "<td>"
									+ data[i].email
									+ "</td>"
									+ "<td>"
									+ data[i].cardnumber
									+ "</td>"
									+ "<td>"
									+ data[i].remark + "</td></tr>";
							$('#tbodyStaff').append(html);
						}
					},
				});
	}
	/*   点击行改变样式 */
	function onclickStaffRow(tr) {
		$("#tbodyStaff tr").removeClass("trClass");
		$(tr).addClass("trClass");
	}
	//新增操作下拉树加载
	function tianchujigou(event) {
		var cityObj = $("#gouzuojigou");
		var cityOffset = $("#gouzuojigou").offset();
		$("#menuContent1").css({
			offsetLeft : event.offsetLeft,
			offsetTop : event.offsetTop
		}).slideDown("fast");
	}
	//点击新增员工工作机构下拉树时触发
	function onclickinsert(e, treeId, treeNode) {
		dianjibangding(treeNode);
	}
	//点击下拉树绑定职务下拉 
	function dianjibangding(treeNode) {
		$("#gouzuojigouid").val(treeNode.id);
		$("#gouzuojigou").val(treeNode.name);
		$("#menuContent1").fadeOut("fast");
		//获取部门职务
		$.ajax({
			async : false,//同步异步
			type : 'post',
			url : '${ctx}/setDeparment/selectOpsition.do' + "?departmentid="
					+ treeNode.id,
			dataType : "json",
			scriptCharset : "utf-8",
			success : function(data) {
				$("#cboStaffpositionid").empty();
				for ( var i = 0; i < data.length; i++) {
					var html = "<option value='"+data[i].staffpositionid+"'>"
							+ data[i].position.name + "</option>";
					$("#cboStaffpositionid").append(html);
				}
			},
		});
	}

	//修改员工信息
	function updateStaff(staffid) {
		$("label[class='error']").remove();
		$.ajax({
			async : false,//同步异步
			type : 'post',
			url : "${ctx}/staff/selectByStaffid.do?staffid=" + staffid,
			dataType : "json",
			scriptCharset : "utf-8",
			success : function(data) {
				qingkongbiaodan();//先清空form数据
				$("#thistr").hide();
				$("#tladd_edit")[0].innerHTML = "修改人员信息";
				$("#myModal").modal("show");
				$("#lizhi").show();
				var tree = $.fn.zTree.getZTreeObj("Ztree");
				var node = tree.getNodeByParam("id",
						data[0].staffPosition.departmentid);
				tree.selectNode(node, true);
				dianjibangding(node);
				$("#staffid").val(data[0].staffid);
				$("#cboStaffpositionid").val(data[0].staffpositionid);
				$("#staffname").val(data[0].staffname);
				$("#staffnumber").val(data[0].staffnumber);
				data[0].sex == 1 ? $("#boy")[0].checked = true
						: $("#girl")[0].checked = true;
				$("#loginnumber").val(data[0].loginnumber);
				$("#idcar").val(data[0].idcar);
				$("#email").val(data[0].email);
				$("#carnumber").val(data[0].cardnumber);
				$("#dateofentry").val(data[0].dateofentry);
				$("#remark").val(data[0].remark);
				$("#image-view")[0].src = "/pic/" + data[0].headimage;
				$("#updatePositiontypeid").val(data[0].positiontypeid);
				$("#leavedate").val(data[0].leavedate);
				$("#cboGroup").val(data[0].groupid);
				BanZuID = data[0].groupid;
				ZhiDuID= data[0].systemid;
				$("#cboSystem").val(data[0].systemid);
			},
		});

	}
	//清空form表单
	function qingkongbiaodan() {
		$("#form")[0].reset();
		$("#cboStaffpositionid").empty();
		$("#image-view")[0].src = "";
	}

	//删除员工信息
	function deleteStaff(staffid) {
		if (confirm("删除之后无法恢复此数据，你确定要删除此数据吗？")) {
			$.ajax({
				async : false,//同步异步
				type : 'post',
				url : "${ctx}/staff/deleteStaff.do?id=" + staffid,
				dataType : "json",
				scriptCharset : "utf-8",
				success : function(data) {
					if (data == "1") {
						alert("删除成功！");
						selectAllStaff();
					} else {
						alert("删除失败！");
					}

				},
			});
		}
	}
	/** 封装的ajax **/
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
			<li><a href="#">人事管理</a>
			</li>
			<li class="active">人员录入</li>
		</ul>
	</div>

	<div class="content_wrap">
		<div class="zTreeDemoBackground left"
			style="margin: 10px; font-size: 15px;">
			<table>
				<tr>
					<td>所属机构:</td>
					<td><input id="Department" readonly="readonly" type="text"
						onblur="hideMenu()" onclick="showMenu()" style="width:115px"
						class="form-control"> <input type="hidden"
						id="txtDepartmentid">
					</td>
					<td>职务:</td>
					<td><select id="cboPositonid" style="width: 95px;">
					</select></td>
					<td>状态:</td>
					<td><select id="cboPositionTypeid" style="width: 95px;">
					</select></td>
					<td>班组:</td>
					<td><select id="cboGroupid" style="width: 95px;"></select></td>
					<td><input id="txtNumber" placeholder="人员编号" type="text"
						style="width: 100px;" class="form-control"></td>
					<td><input id="txtName" placeholder="姓名" type="text"
						style="width: 100px;" class="form-control"></td>
					<td>
						<button type="button" onclick="selectAllStaff()"
							class="btn btn-info btn-sm"
							style="font-size:14px;margin-right: 5px;">
							查询 <i class="icon-search icon-on-right bigger-120"></i>
						</button></td>
					<td>
						<button type="button" onclick="insertStaff()"
							class="btn btn-info btn-sm" style="font-size:14px">
							新 增 <i class="icon-plus-sign icon-on-right bigger-120"></i>
						</button></td>
				</tr>
			</table>

		</div>
	</div>
	<div id="menuContent" class="menuContent"
		style="displayx: none; position: absolute;z-index: 99;background-color: #f9f9f9;min-height: 200px;">
		<ul id="treeDemo" class="ztree" style="margin-top: 0; width: 110px;">
		</ul>
	</div>

	<div>
		<fieldset>
			<legend style="margin-bottom: 5px;"></legend>
			<div class="table-responsive"
				style="position:relative;max-height:500px;min-height: 490px;overflow-x: scroll;max-width: 1158px;">
				<table id="sample-table-2"
					style="border: 2px solid #dddddd;width: 1500px;"
					class="table  table-bordered table_hover">
					<thead>
						<tr>
							<th style="text-align: center; width: 104px;">操作</th>
							<th style="text-align: center;">头像</th>
							<th style="text-align: center;">状态</th>
							<th style="text-align: center;">机构</th>
							<th style="text-align: center;">职务</th>
							<th style="text-align: center;">考勤制度</th>
							<th style="text-align: center;">班组</th>
							<th style="text-align: center;">姓名</th>
							<th style="text-align: center;">性别</th>
							<th style="text-align: center;">员工编号</th>
							<th style="text-align: center;">登记号码</th>
							<th style="text-align: center;">入职日期</th>
							<th style="text-align: center;">离职日期</th>
							<th style="text-align: center;">身份证号码</th>
							<th style="text-align: center;">电子邮件</th>
							<th style="text-align: center;">卡片号码</th>
							<th style="text-align: center;min-width: 145px;">备注</th>

						</tr>
					</thead>
					<tbody id="tbodyStaff">
					</tbody>
				</table>
			</div>
		</fieldset>
	</div>
	<div style="width:inherit;left: 426px;top: 5%;"
		class="modal hide fade in" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_edit" style="text-align:center" class="modal-title">新增人员</h4>
				</div>
				<div class="modal-body" style=" max-height: 495px;">
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-body">
									<%-- 	action="${ctx}/staff/insertStaff.do"  --%>
									<form id="form" enctype="multipart/form-data"
										accept-charset="UTF-8">
										<fieldset>
											<%-- <input type="hidden" name="id" value="${employee.id}"/> --%>
											<table class="table table-bordered"
												style="border: 1px solid #dddddd">
												<tr>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>工作机构</div>
													</td>
													<td><input id="gouzuojigou"
														style="margin-bottom: 0px;" readonly="readonly"
														onclick="tianchujigou(this)" type="text"
														class="form-control"> <input type="hidden"
														id="gouzuojigouid"> <input type="hidden"
														name="staffid" id="staffid">
														<div id="menuContent1" class="menuContent"
															style="displayx: none; position: absolute;z-index: 99;background-color: #f9f9f9;min-height: 200px;">
															<ul id="Ztree" class="ztree"
																style="margin-top: 0; width: 200px;">
															</ul>
														</div></td>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>职务</div></td>
													<td><select name="staffpositionid"
														id="cboStaffpositionid"
														class="col-lg-12 col-xs-12 col-sm-12">
													</select></td>

													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>选择照片</div>
													</td>
													<td>
														<!-- <input type="hidden" name="headImg"/> --> <input
														name="file_img" type="file" id="upimg"
														class="form-control search-query"></td>
												</tr>
												<tr>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>员工姓名</div>
													</td>
													<td><input id="staffname" name="staffname" type="text"
														class="form-control"></td>

													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>员工编号</div>
													</td>
													<td><input id="staffnumber" name="staffnumber"
														type="text" class="form-control"></td>
													<td rowspan="4" style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>照片预览</div>
													</td>
													<td rowspan="4">
														<div id="show">
															<div id="item"
																style="height:216px;width:265px;border:1px solid #bbb;">
																<img name="img" id="image-view"
																	style="height:216px; width:265px" />
															</div>
														</div></td>
												</tr>
												<tr>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>性别</div>
														<div style="font-size: 17px;" align='right'></div></td>
													<td><label> <input id="boy" name="sex"
															type="radio" class="ace" value="1"> <span
															class="lbl">男</span> </label> &nbsp;&nbsp;&nbsp; <label>
															<input id="girl" name="sex" type="radio" class="ace"
															value="0"> <span class="lbl">女</span> </label></td>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>登记号码</div></td>
													<td><input id="loginnumber" name="loginnumber"
														type="text" class="form-control"></td>

												</tr>
												<tr>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>身份证号</div>
													</td>
													<td><input id="idcar" name="idcar" type="text"
														class="form-control"></td>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>电子邮件</div></td>
													<td><input id="email" name="email" type="text"
														class="form-control"></td>
												</tr>
												<tr>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>卡片号码</div>
													</td>
													<td><input id="carnumber" name="cardnumber"
														type="text" class="form-control"></td>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>入职日期</div></td>
													<td><input id="dateofentry" name="dateofentry"
														type="date" class="form-control"></td>
												</tr>
												<tr id="lizhi">
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>状态</div>
													</td>
													<td><select name="positiontypeid"
														id="updatePositiontypeid"
														class="col-lg-12 col-xs-12 col-sm-12">
													</select></td>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>离职日期</div></td>
													<td><input id="leavedate" name="leavedate" type="date"
														class="form-control"></td>
												</tr>

												<tr>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>班组</div>
													</td>
													<td><select name="groupid" id="cboGroup"
														class="col-lg-12 col-xs-12 col-sm-12">
													</select></td>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>考勤制度</div></td>
													<td><select name="systemid" id="cboSystem"
														class="col-lg-12 col-xs-12 col-sm-12">
													</select></td>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>备注</div></td>

													<td colspan=""><input style="width: 258px;"
														id="remark" name="remark" type="text" class="form-control">
													</td>
												</tr>
												<tr id="thistr">
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>账号</div></td>
													<td><input name="username" type="text"
														class="form-control"></td>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>密码</div></td>
													<td><input type="password" name="password"
														class="form-control">
													</td>
													<td style="background-color: #ebf3fb;">
														<div style="font-size: 17px;" align='right'>确认密码</div></td>
													<td><input type="password" name="topassword"
														id="topassword" class="form-control">
													</td>
												</tr>
											</table>

										</fieldset>

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

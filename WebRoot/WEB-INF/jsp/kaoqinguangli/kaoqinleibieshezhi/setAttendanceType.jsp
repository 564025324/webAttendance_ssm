<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <style type="text/css">
    .thistop{
        padding-left: 15px;padding-top: 9px;
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
    </style>
    <SCRIPT type="text/javascript">
 
 	$(document).ready(function() {
 	bangdingkaoqinleibie();
 	 bangdingchulijieguo();
 	 bangdingsherufangshi();
 	});
 		/* 处理结果下拉框绑定 */
 	function bangdingchulijieguo(){
 	$.ajax({
					async : false,/* 同步异步 */
					type : 'post',
					url : '${ctx}/setDeparment/selectByAttributeGatherId.do'
							+ "?attributeGatherId=5",
					dataType : "json",
					scriptCharset : "utf-8",
					success : function(data) {
						$("#cbochulijieguo").empty();
						for ( var i = 0; i < data.length; i++) {
							var html = "<option value='"+data[i].attributegatherchildid+"'>"
									+ data[i].name + "</option>";
							$("#cbochulijieguo").append(html);
						}
					},
				});
 	
 	}
/*  舍入方式下拉框绑定 */
 function bangdingsherufangshi(){
 	$.ajax({
					async : false,/* 同步异步 */
					type : 'post',
					url : '${ctx}/setDeparment/selectByAttributeGatherId.do'
							+ "?attributeGatherId=6",
					dataType : "json",
					scriptCharset : "utf-8",
					success : function(data) {
						$("#cbosherufangshi").empty();
						for ( var i = 0; i < data.length; i++) {
							var html = "<option value='"+data[i].attributegatherchildid+"'>"
									+ data[i].name + "</option>";
							$("#cbosherufangshi").append(html);
						}
					},
				});
 	
 	}
/*   查询考勤类别绑定到考勤类别表 */
 function bangdingkaoqinleibie(){
 $.ajax({
					async : false,/* 同步异步 */
					type : 'post',
					url : '${ctx}/setDeparment/selectByAttributeGatherId.do'
							+ "?attributeGatherId=4",
					dataType : "json",
					scriptCharset : "utf-8",
					success : function(data) {
						$("#tbodyKaoQingLeiBie").empty();
						for ( var i = 0; i < data.length; i++) {
							var html ="<tr onclick='onclickAttendanceRow(this,"+data[i].attributegatherchildid+")'><td>"+data[i].name+"</td></tr>";
							$("#tbodyKaoQingLeiBie").append(html);
						}
					},
				});
 }
 var thistr=null;
 var myKaoqingleibieid;
/*  根据考勤类别id查询考勤类别明细绑定到考勤类别明细表 */
 function onclickAttendanceRow(tr,kaoqinleibieid){
    $("#btndpinsert").removeAttr("disabled"); 
 $("#attendancectypeid").val(kaoqinleibieid);
 thistr=tr;
 myKaoqingleibieid=kaoqinleibieid;
      $("#tbodyKaoQingLeiBie tr").removeClass("trClass");
		$(tr).addClass("trClass");
       $.ajax({
					async : false,/* 同步异步 */
					type : 'post',
					url : "${ctx}/setAttendanceType/selectByaAtendancectypeid.do?id="
							+ kaoqinleibieid,
					dataType : "json",
					scriptCharset : "utf-8",
					success : function(data) {
						$("#tbodyKaoqinleibiemingxi").empty();
						for ( var i = 0; i < data.length; i++) {
							 var html = "<tr><td><a href='javascript:deleteAttendanceChild("+data[i].attendanceclasschildid+")'>【删除】</a>"+
							 "　<a <a href='javascript:editAttendanceChild("+data[i].attendanceclasschildid+")' >【编辑】</a></td>"+
							 "<td >"+data[i].dealwithnumber+"</td>"+
							 "<td >"+data[i].dealwithname+"</td>"+
							 "<td >"+data[i].chulijieguo.name+"</td>"+
							 "<td> "+data[i].sherufangshi.name+"</td>"+
							 "<td>"+data[i].ignorevalue+"</td>"+
							 "<td>"+data[i].kaoqinleibie.name+"</td></tr>";
							$("#tbodyKaoqinleibiemingxi").append(html);
						}
					},
				});
 }
 function insertKaoqinleibiemingxi(){
 $("#formKaoqinmingxi")[0].reset();
 $("#tladd_edit")[0].innerHTML="新增考勤明细";
 $("#myModal").modal("show");
 }
/*  保存考勤类别明细 */
 function submitForm() {


		var formData = new FormData($("#formKaoqinmingxi")[0]);
		 
		if ($("#tladd_edit")[0].innerHTML.trim() == "新增考勤明细") {
			$.ajax({
				url : "${ctx}/setAttendanceType/insertAttendanceclasschild.do",
				type : "POST",
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				dataType : "json",
				success : function(data) {
					if (data == "1") {
						alert("新增成功");
						$("#myModal").modal("hide");
						onclickAttendanceRow(thistr,myKaoqingleibieid);
					} else {
						alert("新增失败");
					}
				},
				error : function(data) {

				}
			});
		} else {
	
			$.ajax({
				url : "${ctx}/setAttendanceType/updateAttendanceclasschild.do?"+$("#formKaoqinmingxi").serialize() ,
				async : false,
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data == "1") {
						alert("修改成功");
						$("#myModal").modal("hide");
						onclickAttendanceRow(thistr,myKaoqingleibieid);
					} else {
						alert("修改失败");
					}
				},
				error : function(data) {

				}
			});

		}
	}
 $.fn.setForm = function(jsonValue) {
		var obj = this;
		$.each(jsonValue, function(name, ival) {
			var $oinput = obj.find("input[name=" + name + "]");
			if ($oinput.attr("type") == "checkbox") {
				if (ival !== null) {
					var checkboxObj = $("[name=" + name + "]");
					checkboxObj[0].checked = ival;
				}
			} else {
				if (ival !== null) {
					obj.find("[name=" + name + "]").val(ival);
				}
			}
		});
	};
  function editAttendanceChild(id){
  $.ajax({
					async : false,/* 同步异步 */
					type : 'post',
					url : "${ctx}/setAttendanceType/selectByChildid.do?id="+id,
					dataType : "json",
					scriptCharset : "utf-8",
					success : function(data) {
					 $("#tladd_edit")[0].innerHTML= "修改考勤明细";
					$("#myModal").modal("show");
					 $("#formKaoqinmingxi").setForm(data[0]);
					 $("#myModal").modal("show");
					 },
				});
  }
     /*删除考勤类别明细 */
function  deleteAttendanceChild(id){
if(confirm("你确定要删除此数据吗？一旦删除无法修复")){
	$.ajax({
					async : false,/* 同步异步 */
					type : 'post',
					url : "${ctx}/setAttendanceType/deleteAttendanceclasschild.do?id="+id,
					dataType : "json",
					scriptCharset : "utf-8",
					success : function(data) {
					if(data=="1"){
					alert("删除成功");
					onclickAttendanceRow(thistr,myKaoqingleibieid);
					}
					else{
					alert("删除失败");}
						 
					 },
				});
				}
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
			<li class="active">考勤类别设置</li>
		</ul>
     </div>
     <div style="float:left;margin-right: 10px;">
			<fieldset>
				<legend style="margin-bottom: 5px;">　　</legend>
				<div class="table-responsive"
					style="position:relative;max-height:300px;min-height: 200px">
					<table id="sample-table-3"
						style="border: 2px solid #dddddd;min-width: 232px;"
						class="table  table-bordered table_hover">
						<thead>
							<tr>
								<th style="text-align: center;">考勤类别</th>
							</tr>
						</thead>
						<tbody id="tbodyKaoQingLeiBie">

						</tbody>
					</table>
				</div>
			</fieldset>
		</div>
	  <div>
    <fieldset>
    <legend style="margin-bottom: 5px;"></legend> 
     <button id="btndpinsert" type="button" disabled="disabled"
										onclick="insertKaoqinleibiemingxi()"
										class="btn btn-info btn-sm" style="font-size:14px">
										添加考勤类别明细<i class="icon-plus-sign icon-on-right bigger-120"></i>
									</button>
						<div class="table-responsive" style="position:relative;max-height:300px;min-height: 200px">
							<table id="sample-table-3" style="border: 2px solid #dddddd;"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
									  <th style="text-align: center;">操作</th>
										<th style="text-align: center;">处理结果编号</th>
										<th style="text-align: center;">处理结果名称</th>
										<th style="text-align: center;">处理结果单位</th>
										<th style="text-align: center;">舍入方式</th>
										<th style="text-align: center;">保留小数点后几位</th>
										<th style="text-align: center;">处理结果类型</th>
									 </tr>
								</thead>
								<tbody id="tbodyKaoqinleibiemingxi">
								</tbody>
							</table>
						</div>
					</fieldset>
    </div>
	 
 
 <!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">加载模态框</button>   -->
<div class="modal hide fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
  <div class="modal-dialog">  
    <div class="modal-content">  
     <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>  
        <h4 id="tladd_edit" style="text-align:center" class="modal-title">新增考勤明细</h4>  
      </div>  
      	<div class="modal-body">
					<div style="text-align: center;">
					<form id="formKaoqinmingxi" action="" method="post">
						<table id="tbAdd_eitd" class="table table-bordered "
							style="border: 1px solid #dddddd">
							<tr>
								<td style="background-color: #ebf3fb;"> 处理结果编号</td>
								<td><input name="dealwithnumber">
								</td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">处理结果名称</td>
								<td><input name="dealwithname" > <input
									 type="hidden">
								</td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">处理结果单位 </td>
								<td><select id="cbochulijieguo"  name="resultid"></select></td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">舍 入 方 式</td>
								<td><select id="cbosherufangshi"  name="wayid"></select></td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">保留小数点后几位</td>
								<td> <select name="ignorevalue">
								<option value='0'>0</option>
								<option value='1'>1</option>
								<option value='2'>2</option>
								</select>
								<input type="hidden"  name="attendanceclasschildid">
								<input type="hidden"  id="attendancectypeid" name="attendancectypeid">
								</td>
							</tr>
						</table>
						<div class="form-actions center">
							<button type="button" onclick="submitForm()" class="btn btn-sm btn-success">
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

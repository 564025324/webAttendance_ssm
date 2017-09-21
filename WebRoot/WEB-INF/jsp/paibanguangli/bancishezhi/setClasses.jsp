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
.thistop {
	padding-left: 15px;
	padding-top: 9px;
}

.thistr {
	background-color: red;
}

#tbodyJigou tr td {
	text-align: center;
	vertical-align: middle;
}

#tbodyClassPeriod tr td {
	text-align: center;
	vertical-align: middle;
}

#tbodybClasses tr td {
	text-align: center;
	vertical-align: middle;
}

.table_hover tr:HOVER {
	background-color: rgba(98, 168, 209, 0.11);
}

.trClass {
	background: rgba(98, 168, 209, 0.11);
}

#tbShijianduan tr td {
	text-align: center;
	vertical-align: middle;
}
/**  $("table tr").removeClass("search") **/
</style>
<SCRIPT type="text/javascript">
 
  
	
	var mytr = null;
	/** 点击职务行改变样式 **/
	function jiazaibanci(){
	 $("#btndpinsert").attr({"disabled":"disabled"});
	var data=ajax("${ctx}/SetClasses/selectPositionclasse.do");
				$("#tbodybClasses").empty();
				for ( var i = 0; i < data.length; i++) {
			      
					var html = "<tr onclick='onclickClassRow(this,"
							+ data[i].positionclassesid + ","+data[i].classtypeid+")'>"
							+ "<td><a href='javascript:deleteClass("
							+ data[i].positionclassesid
							+ ")'>【删除】</a><a href='javascript:updateClass("
							+ data[i].positionclassesid + ")'>【编辑】</a></td>"
							+ "<td>" + data[i].classesnumber + "</td>" + "<td>"
							+ data[i].classesname + "</td>" + "<td>"
							+ data[i].classtype.name + "</td></tr>";
					$("#tbodybClasses").append(html);
				}
     $("#tbodyClassPeriod").empty();
	}
	var classTr = null;
	var selectRowClassid = 0;
	var banduanshuju=null;
	var QJ_classtypeid=0;
	/** 点击班次行改变样式 **/
	function onclickClassRow(tr, Classesid,classtypeid) {
 	    QJ_classtypeid=classtypeid;
	    $("#btndpinsert").removeAttr("disabled"); 
		selectRowClassid = Classesid;
		classTr = tr;
		$("#classid").val(Classesid);
		$("#tbodybClasses tr").removeClass("trClass");
		$(tr).addClass("trClass");
		var data=ajax( "${ctx}/SetClasses/selectClassePeriod.do?Classid="+ Classesid);
		if(data.length>0&&classtypeid==8){
		  $("#btndpinsert").attr("disabled","disabled");
		}
		else{
	     $("#btndpinsert").removeAttr("disabled");
		}
					banduanshuju=data;
						$("#tbodyClassPeriod").empty();
						for ( var i = 0; i < data.length; i++) {
							var shangban = data[i].gotoworktime;
							var xiaban = data[i].timefromwork;
							var qishi = data[i].startchargetime;
							var zhongzhi = data[i].endchargetime;
							var shangbanshijian = shangban != "" ? shangban
									.substring(0, 5) : "----";
							var xiabanshijian = xiaban != "" ? xiaban
									.substring(0, 5) : "----";
							if(shangbanshijian!="----"&&xiabanshijian!="----"){
							if(validTime(xiabanshijian,shangbanshijian)){
						    	xiabanshijian="次日 "+xiabanshijian;
							}
							
						   }
							var qishishuakashijian = qishi != "" ? qishi
									.substring(0, 5) : "----";
							var zhongzhishuakashijian = zhongzhi != "" ? zhongzhi
									.substring(0, 5)
									: "----";
							var shangbanshuaka = data[i].gotoworkchargeno == true ? "是"
									: "否";
							var xiabanshuaka = data[i].timefromworkchargeno == true ? "是"
									: "否";
							var jichidao = data[i].calculateleftearlyno == true ? "是"
									: "否";
							var jizaotui = data[i].calculateabsenceno == true ? "是"
									: "否";
						    var gongzuoyongshi=Math.floor(data[i].workTime/60)+"小时"+(data[i].workTime%60)+"分钟";
						     
							var html = "<tr onclick='onclickPeriodRow(this)'><td><a href='javascript:deleteClassPeriod("
									+ data[i].classperiodid
									+ ")'>【删除】</a><a href='javascript:updateClassPeriod("
									+ data[i].classperiodid
									+ ")'>【编辑】</a></td>"
									+ "<td>"
									+ gongzuoyongshi
									+ "</td>"
									+ "<td>"
									+ qishishuakashijian
									+ "</td>"
									+ "<td>"
									+ shangbanshijian
									+ "</td>"
									+ "<td>"
									+ xiabanshijian
									+ "</td>"
									+ "<td>"
									+ zhongzhishuakashijian
									+ "</td>"
									+ "<td>"
									+ shangbanshuaka
									+ "</td>"
									+ "<td>"
									+ xiabanshuaka
									+ "</td>"
									+ "<td>"
									+ jichidao
									+ "</td>"
									+ "<td>"
									+ jizaotui
									+ "</td>"
									+ "<td>"
									+ data[i].timeType.dealwithname
									+ "</td></tr>";
							$("#tbodyClassPeriod").append(html);
						}
				 

	}
/** 	点击时间段行改变样式 **/
function onclickPeriodRow(tr){
$("#tbodyClassPeriod tr").removeClass("trClass");
		$(tr).addClass("trClass");
}
	$(document).ready(function() {
	fromYanZheng();
	    jiazaibanci();
		bangdingClassType();
		shijianleixingjiazai();
	});
	function insertClass() {
			$("#tladd_edit")[0].innerHTML = "新增班次";
			resetClass();
			 $("#cboClasstype").removeAttr("disabled");
			$("#myModal").modal("show");
	}
	/** 绑定班次类型下拉框的绑定 **/
	function bangdingClassType() {
		var data=ajax( "${ctx}/setDeparment/selectByAttributeGatherId.do?attributeGatherId=3");
						$("#cboClasstype").empty();
						for ( var i = 0; i < data.length; i++) {
							var html = "<option value='"+data[i].attributegatherchildid+"'>"
									+ data[i].name + "</option>";
							$("#cboPositionTypeid").append(html);
							$("#cboClasstype").append(html);
						}
	}
	/** 点击新增班段 **/
	function insertbanduan() {
	$("label[class='error']").remove();
	     qingkongbiaodan();
	     $("#tladd_editBanduan")[0].innerHTML="新增班段";
	     jinyong();
		$("#myModal1").modal("show");
	}
	/** 时间段类型下拉框的加载 **/
	function shijianleixingjiazai() {
		var shuzu = [ 9, 10, 11 ];
		/** 绑定时间段类型下拉框 **/
		var data=ajax( "${ctx}/SetClasses/selectAttendanceByIds.do?ids="+ shuzu);
						$("#cboShijianduanleixing").empty();
						for ( var i = 0; i < data.length; i++) {
							var html = "<option value='"+data[i].attendanceclasschildid+"'>"
									+ data[i].dealwithname + "</option>";
							$("#cboShijianduanleixing").append(html);
						}
	}
	/** 保存班次 **/
	function saveClass() {
		if ($("#tladd_edit")[0].innerHTML == "新增班次") {
			$.ajax({
				async : false,
				type : "post",
				data : {
					classesname : $("#className").val().trim(),
					classesnumber : $("#classNumber").val().trim(),
					classtypeid : $("#cboClasstype").val()
				},
				url : "${ctx}/SetClasses/insertPositionclasses.do",
				dataType : "json",
				scriptCharset : "utf-8",
				success : function(data) {
					if (data == "1") {
						alert("新增成功！");
						$("#myModal").modal("hide");
						jiazaibanci();
					}
				},
			});
		} else {
			$.ajax({
				async : false,/** 同步异步 **/
				type : "post",
				data : {
					positionclassesid : $("#txtClassid").val(),
					classesname : $("#className").val().trim(),
					classesnumber : $("#classNumber").val().trim(),
					classtypeid : $("#cboClasstype").val()
				},
				url : "${ctx}/SetClasses/updateClass.do",
				dataType : "json",
				scriptCharset : "utf-8",
				success : function(data) {
					if (data == "1") {
						alert("修改成功！");
						$("#myModal").modal("hide");
						jiazaibanci();
					}
				},
			});

		}
	}
	/** 删除班次 **/
	function deleteClass(classid) {
	var  data1=ajax("${ctx}/SetClasses/selectClassUseNo.do?positionClassesId=" + classid);
	if(data1>0){
		if(confirm("改班次正在使用,是否确定删除？一但删除无法恢复")){
	   var data=ajax("${ctx}/SetClasses/deleteClass.do?id=" + classid);
				if (data == "1") {
					alert("删除成功");
					jiazaibanci();
				}
				}
	}else{
    ajax("${ctx}/SetClasses/deleteClass.do?id=" + classid);
					alert("删除成功");
					jiazaibanci();
	}
	}
	/** 修改班次 **/
	function updateClass(classid) {
	var data=ajax("${ctx}/SetClasses/selectClassById.do?id=" + classid);
				$("#tladd_edit")[0].innerHTML = "修改班次";
				$("#myModal").modal("show");
				$("#txtClassid").val(classid);
				$("#className").val(data[0].classesname);
				$("#classNumber").val(data[0].classesnumber);
				$("#cboClasstype").val(data[0].classtypeid);
				$("#cboClasstype").attr({
			"disabled" : "disabled"
		});
		
	}
	/** 重置班次 **/
	function resetClass() {
		$("#txtClassid").val("");
		$("#className").val("");
		$("#classNumber").val("");
	}
	/** 验证from表单**/
    function fromYanZheng(){/* 
    $("#formClassPeriod").validate({
			rules : {
				gotoworktime : "required",
				timefromwork : "required",
			}
		}); */
    }   
	/** 新增班段 **/
	function submitForm(){
	$("#formClassPeriod").valid();
	if(qishishuakashijian()){
	 var formData=$("#formClassPeriod").serialize();
		if ($("#tladd_editBanduan")[0].innerHTML.trim() == "新增班段") {
			$.ajax({
				url : "${ctx}/SetClasses/insertClassPeriod.do?"+formData,
				type : 'POST',
				async : false,
				cache : false,
				scriptCharset : "utf-8",
				contentType : false,
				processData : false,
				dataType : "json",
				success : function(data) {
					if (data == "1") {
						alert("新增成功");
						$("#myModal1").modal("hide");
						onclickClassRow(classTr, selectRowClassid,QJ_classtypeid);
					} else {
						alert("新增失败");
					}
				},
				error : function(data) {
				alert("新增失败");

				}
			});
		}else{
			$.ajax({
				url : "${ctx}/SetClasses/updateClassPeriod.do?"+formData,
				type : 'POST',
				async : false,
				cache : false,
				scriptCharset : "utf-8",
				contentType : false,
				processData : false,
				dataType : "json",
				success : function(data) {
					if (data == "1") {
						alert("修改成功");
						$("#myModal1").modal("hide");
						onclickClassRow(classTr, selectRowClassid,QJ_classtypeid);

					} else {
						alert("修改失败");
					}
				},
				error : function(data) {

				}
			});

		}
		}
		else{
		alert("新增失败，班段时间有交叉，请仔细检查");
		}
		}

	/** 	删除班段 **/
	function deleteClassPeriod(ClassPeriodId) {
	if(confirm("你确定要删除此数据吗？一但删除无法恢复")){
	var data=ajax("${ctx}/SetClasses/deleteClassPeriod.do?id=" + ClassPeriodId);
				if (data == "1") {
					alert("删除成功");
					onclickClassRow(classTr, selectRowClassid,QJ_classtypeid);
				}
		}
	}
	function updateClassPeriod(ClassPeriodId) {
	    jinyong();
		$("label[class='error']").remove();
		$("#tladd_editBanduan")[0].innerHTML = "修改班段";
		var data=ajax("${ctx}/SetClasses/selectByClassPeriodId.do?id="+ ClassPeriodId);
				$("#formClassPeriod").setForm(data[0]);
				$("#XiaBanShuaKaFou")[0].checked=data[0].gotoworkchargeno;
				$("#ShangBanShuaKaFou")[0].checked=data[0].timefromworkchargeno;
				  $("#jichidao")[0].checked=data[0].calculateabsenceno;
				$("#jizaotui")[0].checked=data[0].calculateleftearlyno;  
			 	$("#myModal1").modal("show");
	}
   /**根据班次类别禁用文本**/
  function jinyong(){
    if(QJ_classtypeid==8){
      $("#XiaBanShuaKaFou")[0].checked=true;
      $("#ShangBanShuaKaFou")[0].checked=true;
	  $("#ShangBanShuaKaFou").attr("disabled","disabled");
	  $("#XiaBanShuaKaFou").attr("disabled","disabled");
	  $("#startchargetime").attr("disabled","disabled");
	  $("#gotoworktime").attr("disabled","disabled");
      $("#jichidao").attr("disabled","disabled");
      $("#timefromwork").attr("disabled","disabled");
      $("#jizaotui").attr("disabled","disabled");
      $("#endchargetime").attr("disabled","disabled");
	  }
	  else{
	  $("#ShangBanShuaKaFou").removeAttr("disabled");
	  $("#XiaBanShuaKaFou").removeAttr("disabled");
	  $("#startchargetime").removeAttr("disabled");
	  $("#gotoworktime").removeAttr("disabled");
      $("#jichidao").removeAttr("disabled");
	  $("#timefromwork").removeAttr("disabled");
	  $("#jizaotui").removeAttr("disabled");
	  $("#endchargetime").removeAttr("disabled");
	  }}
	/** 重置班段 **/
	function qingkongbiaodan() {
		$("#formClassPeriod")[0].reset();
	}

	/** form插件 **/

	$.fn.setForm = function(jsonValue) {
		var obj = this;
		$.each(jsonValue, function(name, ival) {
			var $oinput = obj.find("input[name=" + name + "]");
			if ($oinput.attr("type") == "checkbox") {
				if (ival !== null) {
					var checkboxObj = $("[name=" + name + "]");
					checkboxObj[0].c = ival;
				}
			} else {
				if (ival !== null) {
					obj.find("[name=" + name + "]").val(ival);
				}
			}
		});
	};
</SCRIPT>
<script type="text/javascript">
 
/**  班段时间段判别 **/
 var time_range = function (beginTime, endTime, nowTime) {
    var strb = beginTime.split (":");
     if (strb.length != 2) {
         return false;
     }
     var stre = endTime.split (":");
     if (stre.length != 2) {
         return false;
     }
     var strn = nowTime.split (":");
     if (stre.length != 2) {
         return false;
     }
     var b = new Date ();
     var e = new Date ();
     var n = new Date ();
     b.setHours (strb[0]);
     b.setMinutes (strb[1]);
     e.setHours (stre[0]);
     e.setMinutes (stre[1]);
     n.setHours (strn[0]);
     n.setMinutes (strn[1]);
     if (n.getTime () - b.getTime () > 0 && n.getTime () - e.getTime () < 0) {
         return true;
     } else {
        /**  alert (beginTime+endTime+nowTime+"当前时间是：" + n.getHours () + ":" + n.getMinutes () + "，不在该时间范围内！");  **/
         return false;
     }
 };
	 
/** 判断刷卡时间上班时间是否冲突，上班时间和下班时间是否冲突，终止刷卡时间和上班时间是否冲突 **/
 function validTime(startTime,endTime){
       var date1=new Date("2016-01-10 "+startTime); 
       var date2=new Date("2016-01-10 "+endTime);
       if(date1.getTime()>date2.getTime()) {                                
               return false;
         }else{
             return true;
         }
}
function shangbanshijian(){
if($("#startchargetime").val()!=""){
$("#gotoworktime").removeAttr("readonly");
}
else{
$("#gotoworktime").attr("readonly","readonly");
alert("请先输入起始刷卡时间");
}

}
/** 新增判断时间段是否冲突**/
function  qishishuakashijian(){
  var beginTime =[];
  var endTime=[];  
    if(validTime($("#gotoworktime").val(),$("#timefromwork").val())){
   beginTime.push("2016-09-09 "+$("#gotoworktime").val());
   endTime.push("2016-09-09 "+$("#timefromwork").val());
 }
   else{
     beginTime.push("2016-09-09 "+$("#gotoworktime").val());
     endTime.push("2016-09-10 "+$("#timefromwork").val());
   }
 for(i=0;i<banduanshuju.length;i++){
 if(""+banduanshuju[i].classperiodid==$("#classperiodid").val()&&$("#tladd_editBanduan")[0].innerHTML== "修改班段"){
 }else{
 var shanbanshijian=banduanshuju[i].gotoworktime.substring(0, 5);
 var xiabanshijian=banduanshuju[i].timefromwork.substring(0, 5);
 if(validTime(shanbanshijian,xiabanshijian)){
   beginTime.push("2016-09-09 "+shanbanshijian);
   endTime.push("2016-09-09 "+xiabanshijian);
 }
   else{
     beginTime.push("2016-09-09 "+shanbanshijian);
   endTime.push("2016-09-10 "+xiabanshijian);
   }
  }
  }
  var   begin=beginTime.sort();
  var   end=endTime.sort();
  for(i=1;i<begin.length;i++){
                if (begin[i] <= end[i-1]){
                    return false;
                }
            }
            return true;
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
	<div></div>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a>
			</li>
			<li><a href="#">排班管理</a>
			</li>
			<li class="active">班次设置</li>
		</ul>
	</div>
	<div>
		<div>
			<fieldset>
				<legend style="margin-bottom: 5px;"></legend>
				<button id="btndpinsert1" type="button" onclick="insertClass()"
					class="btn btn-info btn-sm" style="font-size:14px">
					添加班次<i class="icon-plus-sign icon-on-right bigger-120"></i>
				</button>
				<div class="table-responsive"
					style="position:relative;max-height:300px;min-height: 200px">
					<table id="sample-table-3"
						style="border: 2px solid #dddddd;min-width: 332px;"
						class="table  table-bordered table_hover">
						<thead>
							<tr>
								<th style="text-align: center;width:105px">操作</th>
								<th style="text-align: center;">班次编号</th>
								<th style="text-align: center;">班次名称</th>
								<th style="text-align: center;">类型</th>
							</tr>
						</thead>
						<tbody id="tbodybClasses">

						</tbody>
					</table>
				</div>
			</fieldset>
		</div>
		<div>
			<fieldset>
				<legend style="margin-bottom: 5px;"></legend>
				<button id="btndpinsert" type="button" onclick="insertbanduan()"
					class="btn btn-info btn-sm" style="font-size:14px">
					添加班段<i class="icon-plus-sign icon-on-right bigger-120"></i>
				</button>
				<div class="table-responsive"
					style="position:relative;max-height:300px;min-height: 200px">
					<table id="sample-table-3" style="border: 2px solid #dddddd;"
						class="table  table-bordered table_hover">
						<thead>
							<tr>
								<th style="text-align: center;    width: 105px;">操作</th>
								<th style="text-align: center;">工作用时</th>
								<th style="text-align: center;">起始刷卡时间</th>
								<th style="text-align: center;">上班时间</th>
								<th style="text-align: center;">下班时间</th>
								<th style="text-align: center;">终止刷卡时间</th>
								<th style="text-align: center;">上班需刷卡</th>
								<th style="text-align: center;">下班需刷卡</th>
								<th style="text-align: center;">计迟到</th>
								<th style="text-align: center;">计早退</th>
								<th style="text-align: center;">时间段类型</th>
							</tr>
						</thead>
						<tbody id="tbodyClassPeriod">

						</tbody>
					</table>
				</div>
			</fieldset>
		</div>
	</div>

	<div class="modal hide fade in" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_edit" style="text-align:center" class="modal-title">添加班次</h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center;">
						<table id="tbShijianduan" class="table table-bordered"
							style="border: 1px solid #dddddd">
							<tr>
								<td style="background-color: #ebf3fb;">班次类型</td>
								<td><select id="cboClasstype" name="classtypeid"></select>
								</td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">班次编号</td>
								<td><input name="classesnumber" id="classNumber"> <input
									id="txtClassid" type="hidden">
								</td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">班次名称</td>
								<td><input id="className" name="classesname"></td>
							</tr>
						</table>
						<div class="form-actions center">
							<button type="button" onclick="saveClass()"
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


	<div class="modal hide fade in" id="myModal1" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_editBanduan" style="text-align:center"
						class="modal-title">新增班段</h4>
				</div>
				<div class="modal-body" style="max-height: 440px;">
					<div style="text-align: center;">
						<form id="formClassPeriod" action="" method="post">
							<table id="tbShijianduan" class="table table-bordered"
								style="border: 1px solid #dddddd">
								<tr>
									<td style="background-color: #ebf3fb;">时间段类型</td>
									<td><select id="cboShijianduanleixing"
										name="attendanceclasschildid" style="width:111px"></select></td>
									<td style="padding: 10px;"><input id="ShangBanShuaKaFou"
										name="gotoworkchargeno" style="width: 18px;height: 18px;"
										type="checkbox">上班需刷卡</td>
								</tr>
								<tr>
									<td style="background-color: #ebf3fb;">起始刷卡时间</td>
									<td><input id="startchargetime" name="startchargetime"
										style="width: 100px;" type="time"></td>
									<td style="padding: 10px;"><input id="XiaBanShuaKaFou"
										name="timefromworkchargeno" style="width: 18px;height: 18px;"
										type="checkbox">下班需刷卡</td>
								</tr>
								<tr>
									<td style="background-color: #ebf3fb;">上班时间</td>
									<td><input required="required" id="gotoworktime"
										name="gotoworktime" style="width: 100px;" type="time">
									</td>
									<td style="padding: 10px;"><input id="jichidao"
										name="calculateabsenceno" style="width: 18px;height: 18px;"
										type="checkbox">计算迟到</td>
								</tr>
								<tr>
									<td style="background-color: #ebf3fb;">下班时间</td>
									<td><input required="required" id="timefromwork"
										name="timefromwork" style="width: 100px;" type="time">
									</td>
									<td style="padding: 10px;"><input id="jizaotui"
										name="calculateleftearlyno" style="width: 18px;height: 18px;"
										type="checkbox">计算早退</td>
								</tr>
								<tr>
									<td style="background-color: #ebf3fb;">终止刷卡时间</td>
									<td><input id="endchargetime" name="endchargetime"
										style="width: 100px;" type="time"> <input
										id="classperiodid" name="classperiodid" type="hidden">
									</td>
									<td style="padding: 10px;"><input type="hidden"
										id="classid" name="positionclassesid">
									</td>
								</tr>
								<tr>
									<td style="background-color: #ebf3fb;">上班时间共</td>
									<td><input style="width: 100px;" type="text"></td>
									<td style="padding: 10px;"></td>
								</tr>
							</table>
							<div class="form-actions center">
								<button type="button" onclick="submitForm()"
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


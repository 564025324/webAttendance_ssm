<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="${ctx}/css/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="${ctx}/css/jedate.css" type="text/css"></link>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.jedate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<style type="text/css">
.thistop {
	padding-left: 15px;
	padding-top: 9px;
}

.thisdate {
	font-size: 15px;
	    width: 130px;
	font-weight: 800;
	height: 11px;
}
#tbodybMyAskForLeave tr td{
text-align: center;}
.mytd{
color: #004cff;
}
.mytd1{
color: red;
}
</style>
<SCRIPT type="text/javascript">
$(document).ready(function() {
 
	 bangdinzhuangtai();
	 bangdingdenjileibie();
	 fromYanZhen();
	 selectMyAskForLeave();
	});
	/** 表单提交验证**/
	function fromYanZhen() {
		$("#form").validate({
			rules : {
				startdate : {
					required : true,
					date:true
				},
				enddate : {
					required : true,
					date:true
				} 
			},
			messages : {
				startdate : {
					required : "*请选择起始日期",
					date:"*请选择终止日期"
				},
				enddate : {
					required : "*请选择终止日期",
					date:"*请选择终止日期"
				} 
			}
		});
		$("#formJiaBan").validate({
			rules : {
				startdate : {
					required : true,
					date:true
				},
				enddate : {
					required : true,
					date:true
				} ,
				cboJianBanclass : {
					required : true
				 
				} 
			},
			messages : {
				startdate : {
					required : "*请选择起始日期",
					date:"*请选择终止日期"
				},
				enddate : {
					required : "*请选择终止日期",
					date:"*请选择终止日期"
				} ,
				cboJianBanclass:{
				required : "*班次不能为空"
				}
			}
		});
}	 
	/**绑定处理状态下拉框**/
	function bangdinzhuangtai(){
		var data=ajax("${ctx}/setDeparment/selectByAttributeGatherId.do?attributeGatherId=9");
						$("#cboChuLiZhuangTai").empty();
					    var html="<option value='0'>全部</option>";
						for ( var i = 0; i < data.length; i++) {
							 html=html+ "<option value='"+data[i].attributegatherchildid+"'>"
							  + data[i].name + "</option>";
						}
						$("#cboChuLiZhuangTai").append(html);
						}
	  /**绑定登记类型下拉框**/
	   function bangdingdenjileixin(kaoqinleibieId,id){
	 	 var data=selectByaAtendancectypeid(kaoqinleibieId);
						$("#"+id).empty();
						for ( var i = 0; i < data.length; i++) {
							var  html=html+ "<option value='"+data[i].attendanceclasschildid+"'>"
							  + data[i].dealwithname + "</option>";
						}
						$("#"+id).append(html);
	 }	
	 
	 /**绑定登记类别下拉框**/
	 function bangdingdenjileibie(){
	  var dataQingJia=selectByaAtendancectypeid(12);
	  var dataChuCha=selectByaAtendancectypeid(13);
	  var dataJiaBan=selectByaAtendancectypeid(10);
	  var  html="<option value='0'>全部</option>";
	  $("#cboDenJiLeiBie").empty();
						for ( var i = 0; i < dataQingJia.length; i++) {
							  html=html+ "<option value='"+dataQingJia[i].attendanceclasschildid+"'>"
							  + dataQingJia[i].dealwithname + "</option>";
						}
						for ( var i = 0; i < dataChuCha.length; i++) {
							  html=html+ "<option value='"+dataChuCha[i].attendanceclasschildid+"'>"
							  + dataChuCha[i].dealwithname + "</option>";
						}
						for ( var i = 0; i < dataJiaBan.length; i++) {
							  html=html+ "<option value='"+dataJiaBan[i].attendanceclasschildid+"'>"
							  + dataJiaBan[i].dealwithname + "</option>";
						}
             $("#cboDenJiLeiBie").append(html);
	 }
	 /**根据考勤类别id查询考勤类别明细**/
	 function selectByaAtendancectypeid(atendancectypeid){
	 return ajax("${ctx}/setAttendanceType/selectByaAtendancectypeid.do?id="+atendancectypeid);
	 }		
	 /**提交请假信息**/
	 function saveQingJia(){
	 if ($("#form").valid()){
	   var startdate=$("#dateQiShiShiJian").val();
	  var enddate=$("#dateZhongZhiShiJian").val();
	 if(panduanshijian(startdate,enddate)){
	 var data;
	 if( $("#qingjiaEidt_insert").val()=="1"){
	  data= ajax("${ctx}/PersonAttendance/insertAskForLeave.do?startdate="+startdate+
	 "&enddate="+enddate+
	 "&registrationtypeid="+$("#cboDenJiLeiXin").val()+"&operationstaffid=${user.staffid}"+"&operatingtime="+ huoqudangqianriqi()
	 +"&proposerid=${user.staffid}"+"&remark="+$("#remark").val()+"&groupid=${user.groupid}"+"&workNo=1");
	}
	else{
	 data= ajax("${ctx}/PersonAttendance/updateAskForLeave.do?startdate="+startdate+
	 "&enddate="+enddate+
	 "&registrationtypeid="+$("#cboDenJiLeiXin").val()+"&operationstaffid=${user.staffid}"+"&operatingtime="+ huoqudangqianriqi()
	 +"&proposerid=${user.staffid}"+"&remark="+$("#remark").val()+"&askforleaveid="+qingjiabiaozhujianid);
	
	}
	
	 if(data=="1"){
	  alert("保存成功");
	  $("#myModal").modal("hide");
	  selectMyAskForLeave();
	 }else{
	  alert("保存失败");
	 }
	 }
	 else{
	 alert("终止时间必须大于起始时间，请重新选择时间");
	 }
	 }
	 }
	   /**获取当前日期**/
   function huoqudangqianriqi(){
      var date = new Date();
		var nianfen = date.getFullYear();
		var yue = (date.getMonth() + 1) < 10 ? "0" + (date.getMonth() + 1)
				: (date.getMonth() + 1);
		var ri = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
		var shi=date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
		var fen=date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
		var riqi = nianfen + "-" + yue + "-" + ri+" "+shi+":"+fen;
		return riqi;
  }		
  
  /**多条件查询我的请假、出差、加班信息**/
  function selectMyAskForLeave(){
     var data= ajax("${ctx}/PersonAttendance/selectMyAskForLeave.do?staffid=${user.staffid}"+
	 "&startDate="+$("#qishiriqi").val()+
	 "&endDate="+$("#zhongzhiriqi").val()+
	 "&checkTypeId="+$("#cboChuLiZhuangTai").val()+
	 "&registrationTypeId="+$("#cboDenJiLeiBie").val()
	 );
	  	$("#tbodybMyAskForLeave").empty();
				for ( var i = 0; i < data.length; i++) {
				var startdate=data[i].startdate;
				var enddate=data[i].enddate;
				var remark=data[i].remark;
				var askForLeaveId=data[i].askForLeaveId;
				var registrationTypeId=data[i].registrationTypeId;
				var  positionClassesId=data[i].positionClassesId;
				var  askForLeaveMxId=data[i].askForLeaveMxId;
				var attendanceCTypeId=data[i].attendanceCTypeId;
				var writeBack=data[i].writeBack;
			    	var style=data[i].checkTypeId==31?"class='mytd'":(data[i].checkTypeId==32?"class='mytd1'":"");
					var edit="",chexiao="";
					if(data[i].checkTypeId==33){
					if(positionClassesId!=0){
					chexiao="<a href=\"javascript:shanchuQingJiaJianBan('"+askForLeaveId+"','"+askForLeaveMxId+"')\">【撤销】</a>";
					edit="<a href=\"javascript:bianjiJiaBan('"+startdate+"','"+enddate+"','"+
					remark+"','"+askForLeaveId+"','"+registrationTypeId+"','"
					+positionClassesId+"','"+askForLeaveMxId+"','"+attendanceCTypeId+"')\">【编辑】</a>";
					}else{
					chexiao="<a href=\"javascript:shanchuQingJiaJianBan('"+askForLeaveId+"','0')\">【撤销】</a>";
					edit="<a href=\"javascript:bianji('"+startdate+"','"+enddate+"','"+
					remark+"','"+askForLeaveId+"','"+registrationTypeId+"','"+attendanceCTypeId+"')\">【编辑】</a>";
					}
					}
					var html = "<tr>"+"<td>"+chexiao+edit+"</td>"
					+
					"<td "+style+">"+data[i].checkTypeName+"</td>"
					+
					"<td>"+data[i].operatingtime+"</td>"+
					"<td>"+startdate+"</td>"
					+
					"<td>"+enddate+"</td>"
					+
					"<td>"+data[i].registrationtypeName+"</td>"
					+
					"<td>"+data[i].className+"</td>"
					+
					"<td>"+remark+"</td>"
					+
					"<td>"+writeBack+"</td>"
					+
					"<td>"+data[i].checkmanName+"</td>"
					+
					"<td>"+data[i].checktime+"</td>"
				
					+"</tr>";
					$("#tbodybMyAskForLeave").append(html);
				}
      }
      var qingjiabiaozhujianid=0,jiabanbancizhujianid=0;
      /**删除请假、加班信息**/
      function shanchuQingJiaJianBan(askForLeaveId,askForLeaveMxId){
      var   data= ajax("${ctx}/PersonAttendance/deleteByAskForLeaveMxId.do?askForLeaveId="+askForLeaveId+
	 "&askForLeaveMxId="+askForLeaveMxId);
      if(data=="1"){
      alert("成功撤销");
      selectMyAskForLeave();
      }else{
      alert("撤销失败");
      }
      }
      /**编辑请假、出差**/
      function bianji(startdate,enddate,remark,askForLeaveId,registrationTypeId,attendanceCTypeId){
        $("#qingjiaEidt_insert").val(0);
        qingjiabiaozhujianid=askForLeaveId;
         qiankong();
         $("#dateQiShiShiJian").val(startdate);
	     $("#dateZhongZhiShiJian").val(enddate);
	     $("#remark").val(remark);
	     bangdingdenjileixin(attendanceCTypeId,"cboDenJiLeiXin");
	     $("#cboDenJiLeiXin").val(registrationTypeId);
	     $("#myModal").modal("show");
      }
     /**编辑申请加班**/
     function bianjiJiaBan(startdate,enddate,remark,askForLeaveId,registrationTypeId,positionClassesId,askForLeaveMxId,attendanceCTypeId){
       $("#jiabanEidt_insert").val(0);
      qingjiabiaozhujianid=askForLeaveId;
      jiabanbancizhujianid=askForLeaveMxId;
       $("#JiaBanQiShiShiJian").val(startdate);
       $("#JiaBanZhongZhiShiJian").val(enddate);
       $("#JiaBanremark").val(remark);
       bangdingdenjileixin(attendanceCTypeId,"cboJiaBanLeiXin");
       $("#cboJiaBanLeiXin").val(registrationTypeId);
       onchangeDenJiLeiXin();
       $("#cboClassid").val(positionClassesId);
       $("#myModalJiaBan").modal("show");
      }
     /**点击请假按钮时触发**/
	 function askForLeave(){
	  $("#qingjiaEidt_insert").val(1);
	 $("#tladd_edit")[0].innerHTML="申请请假";
	 $("#myModal").modal("show");
	  qiankong();
	  bangdingdenjileixin(12,"cboDenJiLeiXin");
	 }
	   /**点击出差按钮时触发**/
	 function ChuCai(){
	  $("#qingjiaEidt_insert").val(1);
	 $("#tladd_edit")[0].innerHTML="申请出差";
	 $("#myModal").modal("show");
	  qiankong();
	  bangdingdenjileixin(13,"cboDenJiLeiXin");
	 }
	 function qiankong(){
	 $("#dateQiShiShiJian").val("");
	 $("#dateZhongZhiShiJian").val("");
	 $("#remark").val("");
	 }
	 /**点击加班按钮时触发**/
	 function JiaBan(){
	  $("#jiabanEidt_insert").val(1);
	 $("#myModalJiaBan").modal("show");
	  bangdingdenjileixin(10,"cboJiaBanLeiXin");
	  onchangeDenJiLeiXin();
	
	 }
	 /**保存加班信息**/
	 function saveJiaBan(){
	  if ($("#formJiaBan").valid()){
	  var startdate=$("#JiaBanQiShiShiJian").val();
	  var enddate=$("#JiaBanZhongZhiShiJian").val();
	  if(panduanshijian(startdate,enddate)){
	  var data;
	  if($("#jiabanEidt_insert").val()==1){
	   data= ajax("${ctx}/PersonAttendance/insertAskForLeaveMx.do?startdate="+startdate+
	 "&enddate="+enddate+
	 "&registrationtypeid="+$("#cboJiaBanLeiXin").val()+"&operationstaffid=${user.staffid}"+"&operatingtime="+ huoqudangqianriqi()
	 +"&proposerid=${user.staffid}"+"&remark="+$("#JiaBanremark").val()+"&classid="+$("#cboClassid").val()+"&groupid=27");
	  }
     else{
	 data= ajax("${ctx}/PersonAttendance/updateByAskForLeaveMxId.do?startdate="+startdate+
	 "&enddate="+enddate+
	 "&registrationtypeid="+$("#cboJiaBanLeiXin").val()+"&operationstaffid=${user.staffid}"+"&operatingtime="+ huoqudangqianriqi()
	 +"&proposerid=${user.staffid}"+"&remark="+$("#JiaBanremark").val()+"&positionClassesId="+$("#cboClassid").val()+"&askforleaveid="+qingjiabiaozhujianid+"&askForLeaveMxId="+jiabanbancizhujianid);
	
	}
	if(data=="1"){
	alert("保存成功");
	$("#myModalJiaBan").modal("hide");
	 selectMyAskForLeave();
	}else{
	alert("保存失败");}
	 }else{
	 alert("终止时间必须大于起始时间，请重新选择时间");
	 }
	 }
	 }
	 
	 /**加班登记类型改变时重新加载班次**/
	 function onchangeDenJiLeiXin(){
	  var data= ajax("${ctx}/PersonAttendance/selectClassByAttendanceClassChildId.do?staffId=${user.staffid}"+
	  "&attendanceClassChildId="+$("#cboJiaBanLeiXin").val());
	    $("#cboClassid").empty();
	   					 var html;
						for ( var i = 0; i < data.length; i++) {
						 html=html+ "<option value='"+data[i].positionclassesid+"'>"
						 + data[i].classesname + "</option>";
						}
             $("#cboClassid").append(html);
	 
	 }
	 /**判断起始时间是否大于结束时间**/
	 function panduanshijian(beginDate,endDate){
	 var startDate=new Date(beginDate);
	 var endDate=new Date(endDate);
	 if(endDate.getTime()>=startDate.getTime()){
	 return true;
	 }
	 else{
	 return false;
	 }
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
</SCRIPT>
<body style="text-align: center">
	<div></div>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
			<li><a href="#">我的考勤</a></li>
			<li class="active">我要请假</li>
		</ul>
	</div>
	<div class="content_wrap">
		<div class="zTreeDemoBackground left"
			style="margin: 10px; font-size: 15px;">
			起始时间从<input id="qishiriqi" type="text" class="thisdate">
			<script type="text/javascript">
				$("#qishiriqi").jeDate({
			    isinitVal:false,
			    ishmsVal:false,
			    format:"YYYY-MM-DD",
			    zIndex:3000,
			});		
			</script>
			 至 <input  type="text" id="zhongzhiriqi"
				class="thisdate">  
					<script type="text/javascript">
			$("#zhongzhiriqi").jeDate({
		    isinitVal:false,
		    ishmsVal:false,
		    format:"YYYY-MM-DD",
		    zIndex:3000,
		});		
			</script>
				处理状态<select id="cboChuLiZhuangTai" style="width: 95px;"> </select>
				登记类别<select id="cboDenJiLeiBie" style="width: 95px;"> </select>
		           	<button type="button"
										onclick="selectMyAskForLeave()"
										class="btn btn-info btn-sm" style="font-size:14px">
										查询  <i class="icon-search icon-on-right bigger-120"></i>
									</button>
									<button type="button"
										onclick="askForLeave()"
										class="btn btn-info btn-sm" style="font-size:14px">
										请假 <i class="icon-plus-sign icon-on-right bigger-120"></i>
									</button>
									<button type="button"
										onclick="JiaBan()"
										class="btn btn-info btn-sm" style="font-size:14px">
										加班 <i class="icon-plus-sign icon-on-right bigger-120"></i>
									</button>
									<button type="button"
										onclick="ChuCai()"
										class="btn btn-info btn-sm" style="font-size:14px">
										出差 <i class="icon-plus-sign icon-on-right bigger-120"></i>
									</button>
		</div>
	</div>
	<div>
		<fieldset>
			<legend style="margin-bottom: 5px;"></legend>
			<div class="table-responsive"
				style="position:relative;max-height:300px;min-height: 200px">
				<table id="sample-table-2" style="border: 2px solid #dddddd;"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
						   <th style="text-align: center;width: 112px;">操作</th>
						   <th style="text-align: center;">审核状态</th>
						    <th style="text-align: center;">申请时间</th>
							<th style="text-align: center;">起始时间</th>
							<th style="text-align: center;">终止时间</th>
							<th style="text-align: center;">登记类别</th>
							<th style="text-align: center;">申请班次</th>
							<th style="text-align: center;max-width: 330px;">申请原因</th>
							<th style="text-align: center;">批示</th>
							<th style="text-align: center;">审核人</th>
							<th style="text-align: center;">审核时间</th>
						</tr>
					</thead>
					<tbody id="tbodybMyAskForLeave" class="tbody">
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
					<h4 id="tladd_edit" style="text-align:center" class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center;">
                        <form id="form">
 						<table id="tbShijianduan" class="table table-bordered"
							style="border: 1px solid #dddddd">
							<tr>
								<td style="background-color: #ebf3fb;">起始时间</td>
								<td><input style="width: 150px;" name="startdate" id="dateQiShiShiJian" type="text">
								  <script type="text/javascript">
								$("#dateQiShiShiJian").jeDate({
							    isinitVal:false,
							    ishmsVal:false,
						        minDate: $.nowDate(0),
							    format:"YYYY-MM-DD hh:mm",
							    zIndex:3000,
							 });
							</script>
								</td>
									<td style="background-color: #ebf3fb;">终止时间</td>
								<td colspan="2"><input name="enddate" style="width: 150px;" id="dateZhongZhiShiJian" type="text"> 
									 <script type="text/javascript">
								$("#dateZhongZhiShiJian").jeDate({
							    isinitVal:false,
							    ishmsVal:false,
						        minDate: $.nowDate(0),
							    format:"YYYY-MM-DD hh:mm",
							    zIndex:3000,
							 });
							</script>
						   </td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">登记类别</td>
								<td colspan="3"><select name="registrationtypeid" style="width: 150px;" id="cboDenJiLeiXin"></select>
								</td>
							</tr>
								<tr>
								<td style="background-color: #ebf3fb;">原因</td>
								<td colspan="3"><input style="width: 426px;" id="remark" name="classesname">
								<input id="qingjiaEidt_insert" type="hidden">
								</td>
							</tr>
						</table>
						</form>
						<div class="form-actions center">
							<button type="button" onclick="saveQingJia()"
								class="btn btn-sm btn-success">
								提交<i class="icon-check icon-on-right bigger-110"></i>
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
	<div class="modal hide fade in" id="myModalJiaBan" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 id="tladd_edit" style="text-align:center" class="modal-title">申请加班</h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center;">
                        <form id="formJiaBan">
 						<table id="tbShijianduan" class="table table-bordered"
							style="border: 1px solid #dddddd">
							<tr>
								<td style="background-color: #ebf3fb;">起始时间</td>
								<td><input style="width: 150px;" name="startdate" id="JiaBanQiShiShiJian" type="text">
								  <script type="text/javascript">
								$("#JiaBanQiShiShiJian").jeDate({
							    isinitVal:false,
							    ishmsVal:false,
						        minDate: $.nowDate(1),
							    format:"YYYY-MM-DD",
							    zIndex:3000,
							 });
							</script>
								</td>
									<td style="background-color: #ebf3fb;">终止时间</td>
								<td colspan="2"><input name="enddate" style="width: 150px;" id="JiaBanZhongZhiShiJian" type="text"> 
									 <script type="text/javascript">
								$("#JiaBanZhongZhiShiJian").jeDate({
							    isinitVal:false,
							    ishmsVal:false,
						        minDate: $.nowDate(1),
							    format:"YYYY-MM-DD",
							    zIndex:3000,
							 });
							</script>
						   </td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">登记类别</td>
								<td><select name="registrationtypeid" onchange="onchangeDenJiLeiXin()" style="width: 150px;" id="cboJiaBanLeiXin"></select>
								</td>
								<td style="background-color: #ebf3fb;">加班班次</td>
								<td><select name="cboJianBanclass" id="cboClassid" style="width: 150px;"></select>
								</td>
							</tr>
								<tr>
								<td style="background-color: #ebf3fb;">原因</td>
								<td colspan="3"><input style="width: 426px;" id="JiaBanremark">
								<input id="jiabanEidt_insert" type="hidden">
								</td>
							</tr>
						</table>
						</form>
						<div class="form-actions center">
							<button type="button" onclick="saveJiaBan()"
								class="btn btn-sm btn-success">
								提交<i class="icon-check icon-on-right bigger-110"></i>
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
</body>
</html>

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
<style type="text/css">
#tbodyUnusual tr td {
	text-align: center;
}

#tbodyBuQian tr td {
	text-align: center;
}

.mytd {
	color: #004cff;
}

.mytd1 {
	color: red;
}

.onMybutton {
	olor: white;
	background: #438eb9;
}

.mybuttonColor {
	color: #f7f5f5;
	background: rgb(67, 142, 185);
}

.tbcalss {
	font-size: 16px;
	text-align: center;
	background-color: #ebf3fb;
}
</style>
<SCRIPT type="text/javascript">
	$(document).ready(function() {
		selectUnusual();
		Cbo_KaoQinLeiBieBangDing();
		selectDealwihthRetroative();
		BuQianChuLi();
	});
	/**处理补签异常信息**/
	function ChuLiBuQianXinXi(staffName,signInTime,startChargeTime,endChargeTime,
	staffClassesChildRecordId,staffRetroactiveId,
	toAndFrom,banduan,applyForReason,jichidaofou,jizaotuifou,goToWorkTime,timeFromWork,
	LeaveEarlyAbsenteeismTime,
    LeaveEarlyTime,
    lateAbsenteeismTime,
    lateTime,signIn,signBack) {
	QJ_startChargeTime=startChargeTime;QJ_endChargeTime=endChargeTime;QJ_staffClassesChildRecordId=staffClassesChildRecordId;
    QJ_staffRetroactiveId=staffRetroactiveId;QJ_toAndFrom=toAndFrom,
    QJ_jichidaofou=jichidaofou;QJ_jizaotuifou=jizaotuifou;QJ_goToWorkTime=goToWorkTime;QJ_timeFromWork=timeFromWork;
    QJ_LeaveEarlyAbsenteeismTime=LeaveEarlyAbsenteeismTime,
    QJ_LeaveEarlyTime=LeaveEarlyTime,
    QJ_lateAbsenteeismTime=lateAbsenteeismTime,
    QJ_lateTime=lateTime;
     $("#BuQianXianShi")[0].innerHTML=staffName+(startChargeTime.length>0?startChargeTime.toString().substring(10,16):"")+"(起始刷卡)"+"～"+(endChargeTime.length>0?endChargeTime.toString().substring(10,16):"")+"(终止刷卡)"; 
     $("#applyForReason").val(applyForReason);
     $("#myModal1").modal("show");
     $("#dateQianDaoShiJian").val(signInTime);
     $("#MyBanDuan")[0].innerHTML="班段："+banduan;
     $("#MyQianDaoXinXi")[0].innerHTML="签到信息："+signIn+"～"+signBack;
	}
	/**查询所有补签申请**/
	function selectDealwihthRetroative() {
		var data = ajax("${ctx}/DealwihthRetroative/selectDealwihthRetroative.do?checkStateId="
				+ $("#cboChuLiZhuangTai").val());
		var html = "";
		$("#tbodyBuQian").empty();
		for ( var i = 0; i < data.length; i++) {
			var style = data[i].checkStateId == 31 ? "class='mytd'"
					: (data[i].checkStateId == 32 ? "class='mytd1'" : "");
			var goToWorkTime=data[i].goToWorkTime;
			var timeFromWork=data[i].timeFromWork;
			var banduan = (goToWorkTime.toString().length>0?goToWorkTime.toString().substring(11,16):goToWorkTime) + "～" 
			+(timeFromWork.toString().length>0?timeFromWork.toString().substring(11,16):timeFromWork);
			var chuli="";
			if(data[i].checkStateId ==33){
			chuli= "<a href=\"javascript:ChuLiBuQianXinXi('"+data[i].operationMan+"','"
					+ data[i].signInTime + "','" + data[i].startChargeTime
					+ "','" + data[i].endChargeTime + "','"
					+ data[i].staffClassesChildRecordId + "','"
					+ data[i].staffRetroactiveId + "','" + data[i].toAndFrom
					+ "','"+ banduan + "','"+data[i].applyForReason+"','"+
					data[i].calculateLeftEarlyNo+"','"+data[i].calculateAbsenceNo+"','"
					+goToWorkTime+"','"+timeFromWork+"','"+data[i].leaveEarlyAbsenteeismTime+"','"
					+data[i].leaveEarlyTime+"','"+data[i].lateAbsenteeismTime+"','"
					+data[i].lateTime+"','"+data[i].signIn+"','"+data[i].signBack+"')\">【处理】</a>";
			}else{
			chuli="<div style='color: #ab9d9d;'>已处理</div>";
			}
			html = html + "<tr>"+"<td>"
					+chuli+ "</td>"
					+ "<td "+style+">" + data[i].checkType + "</td>" + "<td>"
					+ data[i].operationMan + "</td>" + "<td>"
					+ data[i].workDate + "</td>" + "<td >" + banduan + "</td>"
					+ "<td>" + data[i].signInTime + "</td>" + "<td>"
					+ (data[i].toAndFrom == 0 ? "上班" : "下班") + "</td>" + "<td>"
					+ data[i].operatingTime + "</td>" + "<td>"
					+ data[i].applyForReason + "</td>" + "<td>"
					+ data[i].checkMan + "</td>" + "<td>" + data[i].checkTime
					+ "</td>" + "<td>" + data[i].remark + "</td>"
					+ "</tr>";
		}
		$("#tbodyBuQian").append(html);

	}
	/**多条件查询我的请假、出差、加班信息**/
	function selectUnusual() {
		var data = ajax("${ctx}/DealwihthRetroative/selectUnusual.do");
		$("#tbodyUnusual").empty();
		var html = "", signInTime = "", signBackTime = "", staffName = "";
		for ( var i = 0; i < data.length; i++) {
			signInTime = data[i].signInTime;
			signBackTime = data[i].signBackTime;
			staffName = data[i].staffName;
			var style = "", style1 = "";
			if (signInTime == "缺签") {
				style = "class='mytd1'";
			}
			if (signBackTime == "缺签") {
				style1 = "class='mytd1'";
			}
			html = html + "<tr>" + "<td>" + "<a href=\"javascript:ChuLi("
					+ data[i].staffClassPeriodSignInRecordId + ",'"
					+ signInTime + "','" + signBackTime + "','" + staffName
					+ "')\">【处理】</a>" + "</td>" + "<td>" + data[i].workDate
					+ "</td>" + "<td>" + staffName + "</td>" + "<td "+style+">"
					+ signInTime + "</td>" + "<td "+style1+">" + signBackTime
					+ "</td>" + "<td>" + data[i].classesName + "</td>" + "<td>"
					+ data[i].dealWithName + "</td>"

					+ "</tr>";
		}
		$("#tbodyUnusual").append(html);
	}
	var RecordId = 0;
	function ChuLi(staffClassPeriodSignInRecordId, signInTime, signBackTime,
			staffName) {
		RecordId = staffClassPeriodSignInRecordId;
		$("#xianshi")[0].innerHTML = staffName + "　签到时间：" + signInTime
				+ "　签退时间：" + signBackTime;
		$("#myModal").modal("show");
	}
	/**考勤类别下拉框绑定**/
	function Cbo_KaoQinLeiBieBangDing() {
		var data = ajax("${ctx}/setAttendanceType/selectByaAtendancectypeid.do?id=15");
		$("#cboKaoQingLeiBie").empty();
		var html = "";
		for ( var i = 0; i < data.length; i++) {
			html = html + "<option value='"+data[i].attendanceclasschildid+"'>"
					+ data[i].dealwithname + "</option>";
		}
		$("#cboKaoQingLeiBie").append(html);
	}

	/**更改考勤类别**/
	function save() {
		var data = ajax("${ctx}/DealwihthRetroative/updateAttendanceType.do?staffClassPeriodSignInRecordId="
				+ RecordId
				+ "&attendanceClassChildId="
				+ $("#cboKaoQingLeiBie").val());
		if (data == 1) {
			alert("处理成功");
			$("#myModal").modal("hide");
			selectUnusual();
		} else {
			alert("处理失败");
		}
	}
	/**点击补签处理按钮时触发**/
	function BuQianChuLi() {
		$("#btnBuQian").attr({
			"class" : "mybuttonColor"
		});
		$("#btnYiChang").removeAttr("class");
		$("#div_BuQianChuLi")[0].style.display = "";
		$("#div_YiChangChuLi")[0].style.display = "none";
	}
	/**点击异常处理按钮时触发**/
	function YiChangChuLi() {
		$("#btnYiChang").attr({
			"class" : "mybuttonColor"
		});
		$("#btnBuQian").removeAttr("class");
		$("#div_YiChangChuLi")[0].style.display = "";
		$("#div_BuQianChuLi")[0].style.display = "none";
	}
	var QJ_startChargeTime="",QJ_endChargeTime="",QJ_staffClassesChildRecordId,
    QJ_staffRetroactiveId,QJ_toAndFrom,QJ_jichidaofou
    ,QJ_jizaotuifou,QJ_goToWorkTime,QJ_timeFromWork,
	QJ_LeaveEarlyAbsenteeismTime,
    QJ_LeaveEarlyTime,
    QJ_lateAbsenteeismTime,
    QJ_lateTime;
	/**保存补签处理时触发**/
	function saveBuQian(){
   var qiandaoshijian=	$("#dateQianDaoShiJian").val();
    var chidao="",queqin="",zaotui="";
	if(QJ_startChargeTime!=""){/**正常班次考勤**/
	if(QJ_toAndFrom==0){/**上班**/
	/**申请条件符合上班申请时间**/
	if($("#cboChuLiJieGuo").val()==32){/**不通过**/
	 BuQianBuTongGuo(32);
	}
	else{/**通过**/
	if(validDateTime(QJ_startChargeTime,qiandaoshijian)&&validDateTime(qiandaoshijian,QJ_timeFromWork)){
	if(QJ_jichidaofou){
	if(jisuanfenzhongshu(qiandaoshijian,QJ_goToWorkTime)>QJ_lateTime){
	if(jisuanfenzhongshu(qiandaoshijian,QJ_goToWorkTime)<QJ_lateAbsenteeismTime){
	chidao="&lateno=1";
	}
	else{
	     queqin="&attendanceclasschildid=13";
	}
	}
	}
	BuQianBuTongGuo(31);
	var data=ajax("${ctx}/PersonAttendance/updateClassperiodsigninrecord.do?signintime="
					+qiandaoshijian+chidao+queqin
					+"&signinwayid=30"
					+"&signinnumber=diannaoqiandao"+"&staffclassperiodsigninrecordid="+
					QJ_staffClassesChildRecordId);
	   if(data=="1"){
	   alert("保存成功");
	   	$("#myModal1").modal("hide");
	   	selectDealwihthRetroative();
	   }
	   else{
	      alert("保存失败");
	   }
	 
	}
	else{
	alert("保存失败，申请时间不符合上班申请时间");
	}
	}
	
	}
	else{/**下班**/
	if($("#cboChuLiJieGuo").val()==32){/**不通过**/
	BuQianBuTongGuo(32);
	}
	else{/**通过**/
	if(validDateTime(QJ_goToWorkTime,$("#dateQianDaoShiJian").val())&&validDateTime($("#dateQianDaoShiJian").val(),QJ_endChargeTime)){
	/**申请条件符合下班申请时间**/
	if(QJ_jizaotuifou){
	if(jisuanfenzhongshu(QJ_timeFromWork,qiandaoshijian)>QJ_LeaveEarlyTime){
	if(jisuanfenzhongshu(QJ_timeFromWork,qiandaoshijian)<QJ_LeaveEarlyAbsenteeismTime){
	zaotui="&leaveearlyno=1";
	}
	else{
	   queqin="&attendanceclasschildid=13&lateno=0";
	}
	}
	}
	BuQianBuTongGuo(31);
	var data=ajax("${ctx}/PersonAttendance/updateClassperiodsigninrecord.do?signbacktime="
					+qiandaoshijian+zaotui+queqin
					+"&signbackwayid=30"
					+"&signbacknumber=diannaoqiandao"+"&staffclassperiodsigninrecordid="+
					QJ_staffClassesChildRecordId);
					 if(data=="1"){
	   alert("保存成功");
	   	$("#myModal1").modal("hide");
	   	selectDealwihthRetroative();
	   }
	   else{
	      alert("保存失败");
	   }
	
	}
	else{
	alert("保存失败，申请时间不符合下班申请时间");
	}
	}
	}
	}
	else{/**无班次考勤**/
	if($("#cboChuLiJieGuo").val()==32){/**不通过**/
	BuQianBuTongGuo();
	}
	else{/**通过**/
	if(QJ_toAndFrom==0){/**上班**/
	BuQianBuTongGuo(31);
	var data=ajax("${ctx}/PersonAttendance/updateClassperiodsigninrecord.do?signintime="
					+qiandaoshijian
					+"&signinwayid=30"
					+"&signinnumber=diannaoqiandao"+"&staffclassperiodsigninrecordid="+
					QJ_staffClassesChildRecordId);
				 if(data=="1"){
	   alert("保存成功");
	   	$("#myModal1").modal("hide");
	   	selectDealwihthRetroative();
	   }
	   else{
	      alert("保存失败");
	   }
	}
	else{/**下班**/
	BuQianBuTongGuo(31);
	var data=ajax("${ctx}/PersonAttendance/updateClassperiodsigninrecord.do?signbacktime="
					+qiandaoshijian
					+"&signbackwayid=30"
					+"&signbacknumber=diannaoqiandao"+"&staffclassperiodsigninrecordid="+
					QJ_staffClassesChildRecordId);
				 if(data=="1"){
	   alert("保存成功");
	   	$("#myModal1").modal("hide");
	   	selectDealwihthRetroative();
	   }
	   else{
	      alert("保存失败");
	   }
	
	}
	}
	
	
	
	}
 
	}
/**补签不通过**/
  function BuQianBuTongGuo(chulizhuangtai_id){
  var data = ajax("${ctx}/DealwihthRetroative/updateStaffretroactive.do?staffretroactiveid="
				+ QJ_staffRetroactiveId
				+ "&remark="
				+ $("#Myreturn").val()+"&checkmanid=${user.staffid}"+"&checktime="+huoqudangqianriqi()+"&checkstateid="+chulizhuangtai_id);
  }
	/**计算分钟数**/
  function jisuanfenzhongshu(date1,date4){
    var  date2= new Date(date1);
    var date3 = date2.getTime() - new Date(date4).getTime();   //时间差的毫秒数        
     //计算出相差分钟数 
     return Math.floor(date3/(60*1000)); 
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
	/**判断签到时间是否大于起始刷卡时间**/
    function validDateTime(startDateTime,endDateTime){
       var date1=new Date(startDateTime); 
       var date2=new Date(endDateTime);
       if(date1.getTime()>date2.getTime()) {                                
               return false;
         }else{
             return true;
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
			<li><a href="#">考勤处理</a></li>
			<li class="active">补签、异常信息处理</li>
		</ul>
	</div>
	<div style="text-align:center;">
		<button id="btnBuQian"
			style="height: 30px;font-size: 18px;margin-top: 8px;margin-bottom: 5px;"
			onclick="BuQianChuLi()">补签处理</button>
		<button id="btnYiChang"
			style="right: 10px;position: relative;height: 30px;font-size: 18px;margin-top: 8px;margin-bottom: 5px;"
			onclick="YiChangChuLi()">异常处理</button>
	</div>
	<div id="div_YiChangChuLi" style="display: none;">
		<fieldset>
			<legend style="margin-bottom: 5px;"></legend>
			<div class="table-responsive"
				style="position:relative;max-height:300px;min-height: 200px">
				<table id="sample-table-2" style="border: 2px solid #dddddd;"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th style="text-align: center;">操作</th>
							<th style="text-align: center;width: 108px;">工作日期</th>
							<th style="text-align: center;">姓名</th>
							<th style="text-align: center;width: 108px;">签到时间</th>
							<th style="text-align: center;">签退时间</th>
							<th style="text-align: center;">班次</th>
							<th style="text-align: center;">班段类别</th>
						</tr>
					</thead>
					<tbody id="tbodyUnusual">
					</tbody>
				</table>
			</div>
		</fieldset>
	</div>




	<div id="div_BuQianChuLi" style="display: none;">
		<fieldset>
			<legend style="margin-bottom: 5px;"></legend>
			<div class="table-responsive"
				style="position:relative;max-height:300px;min-height: 200px">
				<table id="sample-table-2" style="border: 2px solid #dddddd;"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th style="text-align: center;">操作</th>
							<th style="text-align: center;"><select
								onchange="selectDealwihthRetroative()" id="cboChuLiZhuangTai"
								style="width: 89px;font-size: 14px;font-weight: 600;">
									<option value="0">全部状态</option>
									<option value="33">未处理</option>
									<option value="31">通过</option>
									<option value="32">不通过</option>
							</select>
							</th>
							<th style="text-align: center;">申请人</th>
							<th style="text-align: center;width: 108px;">工作日期</th>
							<th style="text-align: center;">补签所属班段</th>
							<th style="text-align: center;width: 108px;">补签时间</th>
							<th style="text-align: center;">上/下班</th>
							<th style="text-align: center;">申请时间</th>
							<th style="text-align: center;">申请原因</th>
							<th style="text-align: center;">审核人</th>
							<th style="text-align: center;">审核时间</th>
							<th style="text-align: center;">批示</th>
						</tr>
					</thead>
					<tbody id="tbodyBuQian">
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
						<form id="formJiaBan">
							<div style="color: red;font-size: 18px;" id="xianshi"></div>
							<table id="tbShijianduan" class="table table-bordered"
								style="border: 1px solid #dddddd">
								<tr>
									<td
										style="font-size: 16px;text-align: center;background-color: #ebf3fb;">处理结果</td>
									<td><select id="cboKaoQingLeiBie" style="font-size: 18px;">
									</select>
									</td>
								</tr>
							</table>
						</form>
						<div class="form-actions center">
							<button type="button" onclick="save()"
								class="btn btn-sm btn-success">
								确定<i class="icon-check icon-on-right bigger-110"></i>
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
					<h4 id="tladd_edit" style="text-align:center" class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center;">
						<form id="formJiaBan">
							<div style="color: red;font-size: 18px;" id="BuQianXianShi"></div>
							<table id="tbShijianduan" class="table table-bordered"
								style="border: 1px solid #dddddd">
								<tr>
									<td class="tbcalss">申请补签时间</td>
									<td><input style="width: 150px;" name="startdate"
										id="dateQianDaoShiJian" type="text"> <script
											type="text/javascript">
								$("#dateQianDaoShiJian").jeDate({
							    isinitVal:false,
							    ishmsVal:false,
							    format:"YYYY-MM-DD hh:mm",
							    zIndex:3000,
							 });
							</script>
										<div id="MyBanDuan"
											style="font-size: 18px;display: inline-block;color: red;"></div>
									</td>
								</tr>
								<tr>
									<td class="tbcalss">处理结果</td>
									<td><select id="cboChuLiJieGuo"
										style="font-size: 18px;width: 160px;">
											<option value="31">通过</option>
											<option value="32">不通过</option>
									</select>
									<div id="MyQianDaoXinXi"
											style="font-size: 18px;display: inline-block;color: red;"></div>
								
									</td>
								</tr>
								<tr>
									<td style="background-color: #ebf3fb;">申请原因</td>
									<td><input readonly="readonly" style="width:367px;"
										id="applyForReason">
									</td>
								</tr>
								<tr id="tr_Myreturn" class="myhiden">
									<td style="background-color: #ebf3fb;">批复</td>
									<td><input style="width:367px;" id="Myreturn">
									</td>
								</tr>
							</table>
						</form>
						<div class="form-actions center">
							<button type="button" onclick="saveBuQian()"
								class="btn btn-sm btn-success">
								确定<i class="icon-check icon-on-right bigger-110"></i>
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

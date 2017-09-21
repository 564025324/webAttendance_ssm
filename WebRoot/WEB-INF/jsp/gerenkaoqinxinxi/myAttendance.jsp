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
<link rel="stylesheet" href="${ctx}/css/jedate.css" type="text/css"></link>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.jedate.min.js"></script>
<style type="text/css">
#header tr th {
	text-align: center;
	width: 90px;
	font-size: 15px;
	font-weight: 600;
	background: #fafafa;
}
#KaoQinheader tr th{
    background: rgb(67, 142, 185);
    color: white;
    max-width: 100px;
    min-width: 50px;
    text-align: center;
}
#tbodyGeRenPaiBanXinXi tr td {
	height: 80px;
	text-align: center;
}
.tbody tr td{
text-align: center;
    font-weight: 800;
    font-size: 17px;
    color: #736e6e;
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
	padding-top: 10px;
	font-size: 20px;
}
.thismydiv{
    margin-top: 5px;
    font-size: 10px;
    font-weight: 100;
    color: red;
    }
    .myhiden{
    display: none;}
    .btn_buqian{
   background: #438eb9;
   color: white;}
</style>
<SCRIPT type="text/javascript">
	$(function() {
		bangDingNianFen();
		RiQiChange();
		selectKaoQinLeiBieMX();
		fromYanZhen();
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
	function RiQiChange(){
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
		if(panduanshijian(yuediyitian,huoqudangqianriqi())){
		if(panduanshijian(yuezuihouyitian,huoqudangqianriqi())){
		}
		else{
		yuezuihouyitian=huoqudangqianriqi().substring(0, 10);
		}
		
		var data = ajax("${ctx}/PersonAttendance/selectMyClass.do?beginDate="
				+ yuediyitian + "&endDate=" + yuezuihouyitian + "&staffid=${user.staffid}");
		for ( var i = 0; i < data.length; i++) {
		  var r=data[i].signInformation.toString().split(",");
		   var r1,html1="";
		  
			var workdate = data[i].workDate;
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
		    for(var j=0;j<r.length;j++){
		     r1=r[j].toString().split("_");
		      var bl= (r1[6]!=9&&r1[6]!=10&&r1[6]!=11?false:true);
		     html1=html1+"<div class='thismydiv'>"+(r1[1]=="缺签"&&bl?r1[1]+"<button class='btn_buqian' onclick=\"BuQian(0,'"+data[i].goToWorkTime+"','"+data[i].timeFromWork+"',"+data[i].staffId+","
		     +r1[0]+",'"+data[i].startChargeTime+"','"+data[i].goToWorkTime+"','"+data[i].timeFromWork+"','"+data[i].endChargeTime+"')\">补签</button>":r1[1])+
		     (r1[3]>0?"(迟到)":"")+"～"+(r1[2]=="缺签"&&bl?r1[2]+"<button class='btn_buqian' onclick=\"BuQian(1,'"+data[i].goToWorkTime+"','"+data[i].timeFromWork+"',"+data[i].staffId+","+
		     r1[0]+",'"+data[i].startChargeTime+"','"+data[i].goToWorkTime+"','"+data[i].timeFromWork+"','"+data[i].endChargeTime+"','"+data[i].workDate+"')\">补签</button>":r1[2])+(r1[4]>0?"(早退)":"")+
		     (bl==false?"["+r1[5]+"]":"")+"</div>";
		  }  
		  $("#" + workdate).append(html1);
		}
		}
		selectKaoQinLeiBieMX();
	}
	var stafID,SX_Ban,recordID,SXB;
	var QJ_startChargeTime="", QJ_goToWorkTime="", QJ_timeFromWork="", QJ_endChargeTime="",QJ_workdate="";
	/**补签申请**/
	function BuQian(shangxianban,goToWorkTime,timeFromWork,staffid,recordid,startChargeTime,goToWorkTime,timeFromWork,endChargeTime,workdate){
	 QJ_workdate=workdate;
	 QJ_startChargeTime=startChargeTime;
	 QJ_goToWorkTime=goToWorkTime;
	 QJ_timeFromWork=timeFromWork;
	 QJ_endChargeTime=endChargeTime;
	 var data=ajax("${ctx}/PersonAttendance/selectRecord.do?staffClassesChildRecordId="+recordid+"&toAndFrom="+shangxianban);
	 if(data.length>0){/**查询补签申请记录判断补签是否已经提交过**/
	 $("#dateQianDaoShiJian").val(data[0].signintime);
	 $("#remark").val(data[0].applyforreason);
	 $("#MyZhuangTai")[0].innerHTML="申请已提交，处理状态："+data[0].checkstate;
	 $("#bt_save").attr({"disabled":"disabled"});
	 if(data[0].checkstateid!=33){
	 $("#tr_Myreturn").removeAttr("class");
	 }
	 }else{
	 $("#tr_Myreturn").attr({"class":"myhiden"});
	 $("#MyZhuangTai")[0].innerHTML="";
	 $("#dateQianDaoShiJian").val("");
	 $("#remark").val("");
	 $("#bt_save").removeAttr("disabled"); 
	 }
	  stafID=staffid;SX_Ban=shangxianban;recordID=recordid;$("#cboShangXianBan").val(shangxianban);SXB=shangxianban;
	  $("#MyBanDuan")[0].innerHTML="班段："+(goToWorkTime.toString().length>0?goToWorkTime.toString().substring(11,16):"----")+"～"+(timeFromWork.toString().length>0?timeFromWork.toString().substring(11,16):"----");
	  $("#myModal").modal("show");
	}
	/**保存补签信息**/
	function saveBuQian(){
	if ($("#form").valid()){
	if(QJ_startChargeTime.length>0){/**正常班次考勤**/
	var qiandaoshijian=$("#dateQianDaoShiJian").val();
	if(SXB==0){
	if(validDateTime(QJ_startChargeTime,qiandaoshijian)&&validDateTime(qiandaoshijian,QJ_timeFromWork)){
	baocun();
	}else{
	alert("提交失败，申请时间不符合上班申请时间");
	}
	}else{
	if(validDateTime(QJ_goToWorkTime,qiandaoshijian)&&validDateTime(qiandaoshijian,QJ_endChargeTime)){
	baocun();
	}else{
		alert("提交失败，申请时间不符合下班申请时间");
	}
	}
	}else{/**无班次考勤**/
	baocun();
	}
	}
	
	
	}
	/**保存补签申请**/
	function baocun(){
	var data=ajax("${ctx}/PersonAttendance/insertStaffretroactive.do?staffclasseschildrecordid="+recordID
	+"&signintime="+qiandaoshijian+"&toandfrom="+SX_Ban+"&operationstaffid="+stafID
	+"&operatingtime="+huoqudangqianriqi()+"&applyforreason="+$("#remark").val()+"&toandfrom="+SXB+"&checkstateid=33");
	if(data=="1"){
	alert("提交成功");
	 $("#myModal").modal("hide");
	}
	else{
	alert("提交失败");
	}
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
	function fromYanZhen() {
		$("#form").validate({
			rules : {
				startdate : {
					required : true,
					date:true
				},
				 
			},
			messages : {
				startdate : {
					required : "*请选择补签时间",
					date:"*请输入正确的日期格式"
				}
			}
		});
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
</script>
<body style="text-align: center" onclick="hideMenu()">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
			<li><a href="#">我的考勤</a></li>
			<li class="active">我的考勤记录</li>
		</ul>
	</div>
	<div id="showAndhide" class="BanDuanTiShi"></div>
	<div style="overflow-y: scroll;max-height: 550px;">
		<div style="text-align: center;padding-top: 10px;">
			<div  style="display: inline-block;">
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
		
		<div style="max-width: 1130px;padding-left: 10px;overflow: auto;">
		<table border="1" class="table"style="max-width: 2000px;min-width: 1120px;" id="tbGudinglunban">
				<thead id="KaoQinheader">
					 
				</thead>
				<tbody id="tbodyKaoQin" class="tbody">
				</tbody>
			</table>
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
								<td style="background-color: #ebf3fb;">签到/签退时间</td>
								<td><input placeholder="YYYY-MM-DD hh:mm" class="workinput wicon mr25" style="width: 150px;" name="startdate" id="dateQianDaoShiJian" type="text">
								<script type="text/javascript">
								$("#dateQianDaoShiJian").jeDate({
							    isinitVal:false,
							    ishmsVal:false,
							    format:"YYYY-MM-DD hh:mm",
							    zIndex:3000,
							 });
							</script>
							<div id="MyBanDuan" style="position: absolute;top: 29px;left: 282px;font-size: 18px;display: inline-block;color: red;"></div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">上/下班</td>
								<td ><select style="width: 150px;" disabled="disabled" id="cboShangXianBan">
								<option value="0">上班</option>
								<option value="1">下班</option>
								</select>
								<div id="MyZhuangTai" style="font-size: 18px;display: inline-block;color: red;"></div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #ebf3fb;">申请补签原因</td>
								<td><input style="width: 426px;" id="remark" name="classesname">
								</td>
							</tr>
							<tr id="tr_Myreturn" class="myhiden">
								<td style="background-color: #ebf3fb;">批复</td>
								<td><input style="width: 426px;" id="Myreturn">
								</td>
							</tr>
						</table>
						</form>
						<div  class="form-actions center">
							<button type="button" id="bt_save" onclick="saveBuQian()"
								class="btn btn-sm btn-success">
								提交<i class="icon-check icon-on-right bigger-110"></i>
							</button>
							<button type="reset" class="btn btn-sm btn-warning">
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
<script type="text/javascript">
 /**查询考勤类别显示**/
 function selectKaoQinLeiBieMX(){
  var data= ajax("${ctx}/setAttendanceType/selectByaAtendancectypeid.do?id=0");
  $("#KaoQinheader").empty();
  $("#tbodyKaoQin").empty();
  var html="<tr><th>迟到(次)</th><th>早退(次)</th><th style='min-width: 66px;'>异常未处理班段(个)</th>";
  var tr="<tr><td id='ChiDao'>0</td><td id='ZaoTui'>0</td><td id='YiChang'>0</td>",trchuqin="",trqita="",chuqin="",qita="";
  for(var i=0;i<data.length;i++){
  if(data[i].attendancectypeid==9){/**出勤类别**/
   chuqin=chuqin+"<th>"+data[i].dealwithname+"("+data[i].chulijieguo.name+")</th>";
   trchuqin=trchuqin+"<td id='KQ"+data[i].attendanceclasschildid+"'>"+baoliuxiaoshu(data[i].ignorevalue)+"</td>";
  }
  else{
  qita=qita+"<th>"+data[i].dealwithname+"("+data[i].chulijieguo.name+")</th>";
  trqita=trqita+"<td id='KQ"+data[i].attendanceclasschildid+"'>"+baoliuxiaoshu(data[i].ignorevalue)+"</td>";
  }
  }
  $("#KaoQinheader").append(html+chuqin+"<th>出差计出勤(时)</th>"+"<th>工作时长(时)</th>"+"<th>当月应出勤(时)</th>"+qita+"</tr>");
  $("#tbodyKaoQin").append(tr+trchuqin+"<td id='CCJCQ'>0</td>"+"<td id='GZXC'>0</td>"+"<td id='YCQSJ'>0</td>"+trqita+"</tr>");
 selectChuQingJiaBanGongXiuTongJi();
 }
 /**保留几位小数**/
 function baoliuxiaoshu(shu){
 if(shu==1){
 return "0.0";
 }
 else{
 if(shu=2){
 return "0.00";
 }
 else{
  return "0";
 }
 }
 }
 /**查询出勤加班公休信息**/
 function selectChuQingJiaBanGongXiuTongJi(){
    var nianfen = $("#cboNianFen").val();
	var yuefen = $("#cboYueFen").val();
	var tianshu = getDaysInOneMonth(nianfen, yuefen);//获取月份天数
	var startDate=nianfen+"-"+yuefen+"-"+"01 00:00";
	var endDate=nianfen+"-"+yuefen+"-"+tianshu+" 23:59";
   var shuju=[];
   shuju.push("${user.staffid}");
   var data=ajax("${ctx}/PersonAttendance/selectChuQingJiaBanGongXiuTongJi.do?starDate="+startDate+"&endDate="+endDate+"&staffids="+shuju);
   var r1,r2;
   for(var i=0;i<data.length;i++){
   r1=data[i].leibiekaoqinxinxi.toString().split(",");
   $("#YCQSJ")[0].innerHTML=accAdd($("#YCQSJ")[0].innerHTML,data[i].yinchuqinshijian);/**计算应出勤时间**/
   $("#ChiDao")[0].innerHTML=parseInt($("#ChiDao")[0].innerHTML)+parseInt(data[i].chidaocishu);/**计算迟到**/
   $("#ZaoTui")[0].innerHTML=parseInt($("#ZaoTui")[0].innerHTML)+parseInt(data[i].zaotuicishu);/**计算早退**/
   $("#YiChang")[0].innerHTML=parseInt($("#YiChang")[0].innerHTML)+parseInt(data[i].yichangcishu);/**计算异常**/
   for(var j=0;j<r1.length;j++){
    r2=r1[j].toString().split("-");
    $("#KQ"+r2[1])[0].innerHTML=accAdd($("#KQ"+r2[1])[0].innerHTML,r2[3]);
    /**判断是否为出勤类别，是就加到工作时长那**/
    if(r2[2]==9){
    $("#GZXC")[0].innerHTML=accAdd($("#GZXC")[0].innerHTML,r2[3]);  
    }
   }
  }
  selectChuChaQingJia(startDate,endDate);
 }
 /**出差、请假**/
 function selectChuChaQingJia(startDate,endDate){
 var data=ajax("${ctx}/PersonAttendance/selectChuChaQingJia.do?starDate="+startDate+"&endDate="+endDate+"&staffids=${user.staffid}");
 var r1,r2;
 for(var i=0;i<data.length;i++){
  $("#KQ"+data[i].attendanceClassChildId)[0].innerHTML=accAdd($("#KQ"+data[i].attendanceClassChildId)[0].innerHTML,data[i].shichang);  ;
  if(data[i].chuchajisuanfou){
  $("#CCJCQ")[0].innerHTML=accAdd($("#CCJCQ")[0].innerHTML,data[i].chuchajichuqinshijian);  
  $("#GZXC")[0].innerHTML=accAdd($("#GZXC")[0].innerHTML,data[i].chuchajichuqinshijian);  
  }
  }
 }
 /**浮点加法运算**/
 function accAdd(arg1,arg2){ 
var r1,r2,m,n; 
try{r1=arg1.toString().split(".")[1].length;}catch(e){r1=0;};
try{r2=arg2.toString().split(".")[1].length;}catch(e){r2=0;};
m=Math.pow(10,Math.max(r1,r2));
n=(r1>=r2)?r1:r2;
return ((arg1*m+arg2*m)/m).toFixed(n);
} 
</script>
</html>


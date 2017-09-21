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
#YuanGongKaoQinheader tr th{
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
    min-width: 70px;
    max-width: 150px;
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
	$("#menuContent").hide();
	selectKaoQinLeiBieMX();
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
		}/* ,
		callback : {
			//zTree节点的点击事件
			onClick : onclickinsert
		} */
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
 
</script>
<body style="text-align: center" onclick="hideMenu()">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
			<li><a href="#">我的考勤</a></li>
			<li class="active">我的考勤记录</li>
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
					<td>起始日期</td>
					<td><input placeholder="YYYY-MM-DD" class="workinput wicon mr25" style="width: 150px;" name="startdate" id="startDate" type="text">
								<script type="text/javascript">
								$("#startDate").jeDate({
							    isinitVal:false,
							    ishmsVal:false,
							    format:"YYYY-MM-DD",
							    zIndex:3000,
							 });
							</script>
								</td>
								<td>至</td>
					<td><input placeholder="YYYY-MM-DD hh:mm" class="workinput wicon mr25" style="width: 150px;" name="enddate" id="endDate" type="text">
								<script type="text/javascript">
								$("#endDate").jeDate({
							    isinitVal:false,
							    ishmsVal:false,
							    format:"YYYY-MM-DD",
							    zIndex:3000,
							 });
							</script>
								</td>
					<td>
						<button type="button" onclick="selectChuQingJiaBanGongXiuTongJi()"
							class="btn btn-info btn-sm"
							style="font-size:14px;margin-right: 5px;">
							查询 <i class="icon-search icon-on-right bigger-120"></i>
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
	
			<div style="max-width: 1130px;padding-left: 10px;overflow: auto; min-height: 500px; max-height: 500px;">
		<table border="1" class="table"style="max-width: 2000px;min-width: 1120px;" id="tbGudinglunban">
				<thead id="KaoQinheader">
					 
				</thead>
				<tbody id="tbodyKaoQin" class="tbody">
				</tbody>
			</table>
			<table border="1" class="table"style="max-width: 2000px;min-width: 1120px;" id="tbYuangGong">
				<thead id="YuanGongKaoQinheader">
				</thead>
				<tbody id="tbodyYuanGongKaoQin" class="tbody">
				</tbody>
			</table>
		</div>
</body>
<script type="text/javascript">
var tr_YuanGong="";var staffs=[];
 /**查询考勤类别显示**/
 function selectKaoQinLeiBieMX(){
  var data= ajax("${ctx}/setAttendanceType/selectByaAtendancectypeid.do?id=0");
  $("#YuanGongKaoQinheader").empty();
  $("#KaoQinheader").empty();
  $("#tbodyKaoQin").empty();
  var html="<th>迟到(次)</th><th>早退(次)</th><th style='min-width: 70px;'>异常未处理班段(个)</th>";
  var tr="<tr><td id='ChiDao'>0</td><td id='ZaoTui'>0</td><td id='YiChang'>0</td>",trchuqin="",trqita="",chuqin="",qita="";
  var tr1="<td id='YGChiDao'>0</td><td id='YGZaoTui'>0</td><td id='YGYiChang'>0</td>",trchuqin1="",trqita1="";
  for(var i=0;i<data.length;i++){
  if(data[i].attendancectypeid==9){/**出勤类别**/
   chuqin=chuqin+"<th>"+data[i].dealwithname+"("+data[i].chulijieguo.name+")</th>";
   trchuqin=trchuqin+"<td id='KQ"+data[i].attendanceclasschildid+"'>"+baoliuxiaoshu(data[i].ignorevalue)+"</td>";
   trchuqin1=trchuqin1+"<td id='YGKQ"+data[i].attendanceclasschildid+"'>"+baoliuxiaoshu(data[i].ignorevalue)+"</td>";
  }
  else{
  qita=qita+"<th>"+data[i].dealwithname+"("+data[i].chulijieguo.name+")</th>";
  trqita=trqita+"<td id='KQ"+data[i].attendanceclasschildid+"'>"+baoliuxiaoshu(data[i].ignorevalue)+"</td>";
  trqita1=trqita1+"<td id='YGKQ"+data[i].attendanceclasschildid+"'>"+baoliuxiaoshu(data[i].ignorevalue)+"</td>";
  }
  }
  $("#KaoQinheader").append("<tr>"+html+chuqin+"<th style='min-width: 70px;'>出差计出勤(时)</th>"+"<th>工作时长(时)</th>"+"<th>应出勤(时)</th>"+qita+"</tr>");
  $("#tbodyKaoQin").append(tr+trchuqin+"<td id='CCJCQ'>0</td>"+"<td id='GZXC'>0</td>"+"<td id='YCQSJ'>0</td>"+trqita+"</tr>");
  $("#YuanGongKaoQinheader").append("<tr>"+"<th>姓名</th><th>部门</th>"+html+chuqin+"<th style='min-width: 70px;'>出差计出勤(时)</th>"+"<th>工作时长(时)</th>"+"<th>应出勤(时)</th>"+qita+"</tr>");
  tr_YuanGong=tr1+trchuqin1+"<td id='YGCCJCQ'>0.00</td>"+"<td id='YGGZXC'>0.00</td>"+"<td id='YGYCQSJ'>0</td>"+trqita1;
 }
  /**查询部门员工**/
  function selectStaff(){
     var data=ajax("${ctx}/staff/selectAllStaff.do?departmentids="+departmentNodes+"&positionid=0&typeid=0&number=&name=&groupid=0");
  	  var html="";
  	  var tr_td=tr_YuanGong;
  	  $("#tbodyYuanGongKaoQin").empty();
  	  staffs=[];
  	  for(var i=0;i<data.length;i++){
  	  var staffid=data[i].staffid;
  	  staffs.push(staffid);
  	  html=html+"<tr id='YG"+staffid+"'>"+"<td>"+data[i].staffname+"</td>"+"<td>"+data[i].staffPosition.department.name+"</td>"+tr_td+"</tr>";
  	  }
  	 $("#tbodyYuanGongKaoQin").append(html);
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
 function isDate(dateString){
  if(dateString.trim()==""){
  alert("请选择日期");
  return false;}  
  var r=dateString.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
  if(r==null){
   alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd\n\r例  如：2008-08-08\n\r");
  return false;
  }
  var d=new Date(r[1],r[3]-1,r[4]);  
  var num = (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
  if(num==0){
   alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd\n\r例  如：2008-08-08\n\r");
  }
  return (num!=0);
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
	 
 /**查询出勤加班公休信息**/
 function selectChuQingJiaBanGongXiuTongJi(){
  var start_date= $("#startDate").val();
  var end_date= $("#endDate").val();
  if($("#Department").val().length>0){
  if(isDate(start_date)&&isDate(end_date)){
  if(panduanshijian(start_date,end_date)){
   selectKaoQinLeiBieMX();
   selectStaff();
  var startDate=start_date+" 00:00";
   var endDate=end_date+" 23:59";
   var data=ajax("${ctx}/PersonAttendance/selectChuQingJiaBanGongXiuTongJi.do?starDate="+startDate+"&endDate="+endDate+"&staffids="+staffs);
   var r1,r2;
   for(var i=0;i<data.length;i++){
   r1=data[i].leibiekaoqinxinxi.toString().split(",");
   var YCQSJ=data[i].yinchuqinshijian;
   var chidaocishu=data[i].chidaocishu;
   var zaotuicishu=data[i].zaotuicishu;
   var yichangcishu=data[i].yichangcishu;
   var hangID="#YG"+data[i].staffid;
   $(hangID).find("td[id='YGYCQSJ']")[0].innerHTML=YCQSJ;
   $(hangID).find("td[id='YGChiDao']")[0].innerHTML=chidaocishu;
   $(hangID).find("td[id='YGZaoTui']")[0].innerHTML=zaotuicishu;
   $(hangID).find("td[id='YGYiChang']")[0].innerHTML=yichangcishu;
   $("#YCQSJ")[0].innerHTML=accAdd($("#YCQSJ")[0].innerHTML,YCQSJ);/**计算应出勤时间**/
   $("#ChiDao")[0].innerHTML=parseInt($("#ChiDao")[0].innerHTML)+parseInt(chidaocishu);/**计算迟到**/
   $("#ZaoTui")[0].innerHTML=parseInt($("#ZaoTui")[0].innerHTML)+parseInt(zaotuicishu);/**计算早退**/
   $("#YiChang")[0].innerHTML=parseInt($("#YiChang")[0].innerHTML)+parseInt(yichangcishu);/**计算异常**/
   for(var j=0;j<r1.length;j++){
    r2=r1[j].toString().split("-");
    $(hangID).find("td[id='YGKQ"+r2[1]+"']")[0].innerHTML=r2[3];
    $("#KQ"+r2[1])[0].innerHTML=accAdd($("#KQ"+r2[1])[0].innerHTML,r2[3]);
    /**判断是否为出勤类别，是就加到工作时长那**/
    if(r2[2]==9){
    var YGGZXC= $(hangID).find("td[id='YGGZXC']")[0];
    YGGZXC.innerHTML=accAdd(YGGZXC.innerHTML,r2[3]);
    $("#GZXC")[0].innerHTML=accAdd($("#GZXC")[0].innerHTML,r2[3]);  
    }
   }
  }
  selectChuChaQingJia(startDate,endDate);
  
  
  }
  else{
 alert("起始日期必须大于终止日期，请重新选择日期"); 
  }
  }
 }
else{
   	 alert("请选择机构");
  }
   
   
 }
 /**出差、请假**/
 function selectChuChaQingJia(startDate,endDate){
 var data=ajax("${ctx}/PersonAttendance/selectChuChaQingJia.do?starDate="+startDate+"&endDate="+endDate+"&staffids=${user.staffid}");
 var kaoqinleibieid,t,shichang,chuchajichuqinshijian,YGCCJCQ,YGGZXC;
 for(var i=0;i<data.length;i++){
  kaoqinleibieid=data[i].attendanceClassChildId;
  t=$("#YG"+data[i].staffID).find("td[id='YGKQ"+kaoqinleibieid+"']")[0];
  shichang=data[i].shichang;
  $("#KQ"+kaoqinleibieid)[0].innerHTML=accAdd($("#KQ"+kaoqinleibieid)[0].innerHTML,shichang);
  t.innerHTML=accAdd(t.innerHTML,shichang);
  if(data[i].chuchajisuanfou){
  chuchajichuqinshijian=data[i].chuchajichuqinshijian;
   YGCCJCQ=$("#YG"+data[i].staffID).find("td[id='YGCCJCQ']")[0];
   YGGZXC=$("#YG"+data[i].staffID).find("td[id='YGGZXC']")[0];
  $("#CCJCQ")[0].innerHTML=accAdd($("#CCJCQ")[0].innerHTML,chuchajichuqinshijian);  
  $("#GZXC")[0].innerHTML=accAdd($("#GZXC")[0].innerHTML,chuchajichuqinshijian); 
  YGCCJCQ.innerHTML=accAdd(YGCCJCQ.innerHTML,chuchajichuqinshijian);
  YGGZXC.innerHTML=accAdd(YGGZXC.innerHTML,chuchajichuqinshijian);
  
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
</html>


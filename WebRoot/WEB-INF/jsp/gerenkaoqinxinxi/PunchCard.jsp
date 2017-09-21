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
<title>My JSP 'PunchCard.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.mytable {
	min-width: 95%;
	margin-left: 25px;
}

.mytable tr {
	line-height: 50px;
	border-top: solid 1px #dcd8d8;
}

.mytable tr td {
	text-align: center;
}

.mydiv {
	text-align: center;
	font-size: 23px;
}

.mybutton {
	background: rgb(52, 154, 184);
	color: white;
	font-size: 18px;
	height: 30px;
}

.mytd {
	width: 8%;
}

.banzudiv {
	margin-left: 20px;
	background: rgba(247, 231, 23, 0.12);
	font-size: 18px;
}

.shijiantd {
	width: 10%;
	font-size: 18px;
	font-weight: 800;
}

.danqianshijianDiv {
	margin-right: 20px;
	font-size: 18px;
	color: red;
	display: inline-block;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		jiazaiqiandaobanduan();
		huoqudangqianshijian();
	});
	/* 每个一秒运行一次 */
	function huoqudangqianshijian() {
		var date = new Date();
		if($(".danqianshijianDiv").length>0){
		$(".danqianshijianDiv")[0].innerHTML = date.toTimeString().substring(0,8);
		setTimeout("huoqudangqianshijian()", 1000);
		}
	}
  /**获取当前日期**/
  function huoqudangqianriqi(){
      var date = new Date();
		var nianfen = date.getFullYear();
		var yue = (date.getMonth() + 1) < 10 ? "0" + (date.getMonth() + 1)
				: (date.getMonth() + 1);
		var ri = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
		var riqi = nianfen + "-" + yue + "-" + ri;
		return riqi;
  }
	/**加载签到班段信息**/
	function jiazaiqiandaobanduan() {
		var xinqi = [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ];
	    var riqi=huoqudangqianriqi();
		var data = ajax("${ctx}/PersonAttendance/selectPunchCard.do?workDate="
				+ riqi + "&staffId=${user.staffid}");
			if(data.length>0){
			$(".mydiv")[0].innerHTML = data[0].className;
		      $(".banzudiv")[0].innerHTML = "(" + riqi + "　" + xinqi[new Date().getMonth()]
				+ ")你被安排在‘" + data[0].groupName + "’中";
				}else{
				$(".banzudiv")[0].innerHTML = "(" + riqi + "　" + xinqi[new Date().getMonth()]
				+ ")";
				$(".mydiv")[0].innerHTML="你今天没有班次安排";
				}
		
		$(".mytable").empty();
		var panduan = 0;
		for ( var i = 0; i < data.length; i++) {
		var signInTime=data[i].signInTime;
	    var qishishuaka=data[i].startChargeTime;
	    var zhongzhishuaka=data[i].endChargeTime;
	    var shanban=data[i].goToWorkTime;
	    var xiaban=data[i].timeFromWork;
	    if(qishishuaka.length==0){
	    if(shanban.length>0){
	    qishishuaka="";
	    }else{
	    qishishuaka="不固定";
	    }
	    }
	    if(zhongzhishuaka.length==0){
	    if(shanban.length>0){
	    zhongzhishuaka="";
	    }else{
	    zhongzhishuaka="不固定";
	    }
	    }
	     if(shanban.length==0){
	     shanban="不固定";
	    }
	    if(xiaban.length==0){
	     xiaban="不固定";
	    }
		var signBackTime= data[i].signBackTime;
		if(signInTime.length>0){
	    signInTime=signInTime.substring(10,16);
		}
		
		if(signBackTime.length>0){
	    signBackTime=signBackTime.substring(10,16);
		}
			var qiandaoBtn = "";
			var qiantuiBtn = "";
			var now= new Date().toTimeString().substring(0,5);
			if(data[i].classTypeId==8){/**不定时班次签到**/
				if(data[i].signInTime.length>0){
				if(signBackTime.length==0){
					qiantuiBtn = "<div class='danqianshijianDiv'></div><button class='mybutton' onclick=\"wubanciqiantui('"+data[i].attendanceClassChildId+"','"+data[i].classPeriodId+"','"+data[i].staffClassesRecordId+"','"+data[i].staffClassPeriodSignInRecordId+"','"+data[i].signInTime+"','"+data[i].timeToOne+"','"+data[i].longWorkTime+"','"+data[i].longWorkTimeToZero+"')\">签退</button>";
					}
					}
				else{
				 qiandaoBtn = "<div class='danqianshijianDiv'></div><button onclick=\"wubanciqiandao('"+data[i].staffClassPeriodSignInRecordId+"')\" class='mybutton'>签到</button>";
				 }
			}
			else{/**正常班次的判断**/
			if (panduan == 0) {
			if(validTime(data[i].goToWorkTime,data[i].endChargeTime)){
			if(validTime(now,data[i].endChargeTime)){
				if (data[i].signInTime == ''&& data[i].goToWorkChargeNo == true&&validTime(now,data[i].timeFromWork)==true) {
					qiandaoBtn = "<div class='danqianshijianDiv'></div><button onclick=qiandao('"+data[i].staffClassPeriodSignInRecordId+"','"+data[i].startChargeTime+"','"+data[i].calculateLeftEarlyNo+"','"+data[i].workDate+"','"+data[i].goToWorkTime+"','"+data[i].lateTime+"','"+data[i].lateAbsenteeismTime+"') class='mybutton'>签到</button>";
					panduan = 1;
				} else {
					if (data[i].signBackTime == ''&& data[i].timeFromWorkChargeNo == true) {
						qiantuiBtn = "<div class='danqianshijianDiv'></div><button class='mybutton' onclick=\"qiantui('"+data[i].staffClassPeriodSignInRecordId+"','"+data[i].calculateAbsenceNo+"','"+data[i].workDate+"','"+data[i].goToWorkTime+"','"+data[i].timeFromWork+"','"+data[i].leaveEarlyTime+"','"+data[i].leaveEarlyAbsenteeismTime+"','"+data[i].signInTime+"','"+data[i].timeToOne+"')\">签退</button>";
						panduan = 1;
					}
					if(data[i].signInTime==''&&data[i].goToWorkChargeNo==1){
				signInTime="<div style='color: red;'>没打卡4</div>";
				}
				}
				}
				else{
				if(data[i].signInTime==''&&data[i].goToWorkChargeNo==1){
				signInTime="<div style='color: red;'>没打卡5</div>";
				}
				if(data[i].timeFromWorkChargeNo==1&&data[i].signBackTime==''){
				signBackTime="<div style='color: red;'>没打卡6</div>";
				}
				}
			}
			else{
			var workDate= data[i].workDate;
			var bl=panduanTime(workDate+" "+data[i].goToWorkTime,addDate(workDate,1)+" "+data[i].endChargeTime,new Date());
			if(bl){
			if(validTime(data[i].goToWorkTime,data[i].timeFromWork)){
			if(validTime(data[i].timeFromWork,now)){
				if(data[i].signInTime==''&&data[i].leaveEarlyNo==1){
				signInTime="<div style='color: red;'>没打卡3</div>";
				}
				if (data[i].signBackTime == ''&& data[i].timeFromWorkChargeNo == true) {
						qiantuiBtn = "<div class='danqianshijianDiv'></div><button class='mybutton'>签退</button>";
						panduan = 1;
					}
			}
			}
			else{
				if (data[i].signInTime == ''&& data[i].goToWorkChargeNo == true) {
					qiandaoBtn = "<div class='danqianshijianDiv'></div><button onclick=qiandao('"+data[i].staffClassPeriodSignInRecordId+"','"+data[i].startChargeTime+"','"+data[i].calculateLeftEarlyNo+"','"+data[i].workDate+"','"+data[i].goToWorkTime+"','"+data[i].lateTime+"','"+data[i].lateAbsenteeismTime+"') class='mybutton'>签到</button>";
					panduan = 1;
				} else {
					if (data[i].signBackTime == ''&& data[i].timeFromWorkChargeNo == true) {
						qiantuiBtn = "<div class='danqianshijianDiv'></div><button class='mybutton'>签退</button>";
						panduan = 1;
					}
				}
			}
			}
			else{
			if(data[i].signInTime==''&&data[i].goToWorkChargeNo==1){
				signInTime="<div style='color: red;'>没打卡1</div>";
				}
				if(data[i].timeFromWorkChargeNo==1&&data[i].signBackTime==''){
				signBackTime="<div style='color: red;'>没打卡2</div>";
				}
				}
			}
			}/**正常班次的判断**/
			}
			if(data[i].attendanceCTypeId==15){
			signInTime=signInTime+"<div style='color: red;display: inline-block;'>("+data[i].dealWithName+")</div>";
			signBackTime=signBackTime+"<div style='color: red;display: inline-block;'>("+data[i].dealWithName+")</div>";
			}else{
			if(data[i].lateNo==1){
			signInTime=signInTime+"<div style='color: red;display: inline-block;'>(迟到)</div>";
			}
			if(data[i].leaveEarlyNo==1){
			signBackTime=signBackTime+"<div style='color: red;display: inline-block;'>(迟到)</div>";
			}
			}
			var html = "<tr><td class='mytd'>上班：</td>"
					+ "<td class='shijiantd'>" + shanban+ "</td>"
					+ "<td class='mytd'>签到： </td>" + "<td class='shijiantd'>"
					+ signInTime + "</td><td class='mytd'>起始刷卡：</td><td class='shijiantd'>"+qishishuaka+"</td>" + "<td colspan='4'>"
					+ qiandaoBtn + "</td></tr>" + "<tr>"
					+ "<td class='mytd'>下班：</td>" + "<td class='shijiantd'>"
					+ xiaban + "</td>"
					+ "<td class='mytd'>签退：</td>" + "<td class='shijiantd'>"
					+ signBackTime + "</td><td class='mytd'>终止刷卡：</td><td class='shijiantd'>"+zhongzhishuaka+"</td>" + "<td colspan='4'>"
					+ qiantuiBtn + "</td></tr>";
			        $(".mytable").append(html);
		}
	}
	/**不定时班次签到**/
   function wubanciqiandao(staffClassPeriodSignInRecordId){
    var qiandaoshijian=huoqudangqianriqi()+" "+$(".danqianshijianDiv")[0].innerHTML.substring(0,5);
    ajax("${ctx}/PersonAttendance/updateClassperiodsigninrecord.do?&staffclassperiodsigninrecordid="+staffClassPeriodSignInRecordId
    +"&signintime="+qiandaoshijian);
	jiazaiqiandaobanduan();
	}
	/**不定时班次签退**/
	function wubanciqiantui(attendanceClassChildId,classPeriodId,staffClassesRecordId,staffClassPeriodSignInRecordId,signInTime,timeToOne,longWorkTime,longWorkTimeToZero){
	var now=new Date();
	if(jisuanfenzhongshu(signInTime,now)>timeToOne){
	var qiandaoshijian="";
	var dancishanbanshijian= jisuanfenzhongshu(signInTime,now);
	if(panduanTime(signInTime,now,signInTime.substring(0,10)+" 23:59:59")){/**夸零点出勤**/
	var lingdianhoufengzhongshu= now.getHours()*60+now.getMinutes();
	if(lingdianhoufengzhongshu>longWorkTimeToZero){
	alert("你夸零点上班时间为："+lingdianhoufengzhongshu+"分钟，规定的夸零点最长工作时间为："+longWorkTimeToZero+"分钟，超过部分不作计算");
	qiandaoshijian=addminuse(now,(longWorkTimeToZero-lingdianhoufengzhongshu));
	}
	}
	if(qiandaoshijian.length>0){
	dancishanbanshijian=jisuanfenzhongshu(signInTime,qiandaoshijian);
	}
	if(dancishanbanshijian>longWorkTime){/**判断单次上班最长工作时间是否大于设定的时间**/
	qiandaoshijian= addminuse(signInTime,longWorkTime);
	alert("你单次上班时间为:"+jisuanfenzhongshu(signInTime,now)+"分钟，规定的单次最长上班时间"+longWorkTime+"分钟,超过部分不作计算");
	}
	else{
	if(qiandaoshijian.length==0){
	qiandaoshijian=huoqudangqianriqi()+" "+$(".danqianshijianDiv")[0].innerHTML.substring(0,5);
	}
	}

	ajax("${ctx}/PersonAttendance/updateClassperiodsigninrecord.do?&staffclassperiodsigninrecordid="+staffClassPeriodSignInRecordId
    +"&signbacktime="+qiandaoshijian);
    ajax("${ctx}/PersonAttendance/insertClassperiodsigninrecord.do?&attendanceclasschildid="+attendanceClassChildId
    +"&classperiodid="+classPeriodId+"&staffclassesrecordid="+staffClassesRecordId);
	jiazaiqiandaobanduan(); 
	}else{alert("签到过于频繁,签到间隔为："+timeToOne+"分钟");}
	}
/**正常班次签到**/
	function qiandao(staffClassPeriodSignInRecordId,startChargeTime,calculateLeftEarlyNo,workDate,goToWorkTime,lateTime,lateAbsenteeismTime){
	var qiandaoshijian=huoqudangqianriqi()+" "+$(".danqianshijianDiv")[0].innerHTML.substring(0,5);
	var qishishuaka=workDate+" "+startChargeTime;
	var now=new Date();
	if(validDateTime(qishishuaka,now)){
	     var chidaofou="";
	     var queqin="";
	if(calculateLeftEarlyNo){
	var shangbanshijian= workDate+" "+goToWorkTime;
	if(jisuanfenzhongshu(shangbanshijian,now)>lateTime){
	if(jisuanfenzhongshu(shangbanshijian,now)<lateAbsenteeismTime){
	chidaofou="&lateno=1";
	}
	else{
	     queqin="&attendanceclasschildid=13";
	}
	}
	}
	ajax("${ctx}/PersonAttendance/updateClassperiodsigninrecord.do?signintime="
					+ qiandaoshijian+queqin+chidaofou
					+"&signinwayid=29"
					+"&signinnumber=diannaoqiandao"+"&staffclassperiodsigninrecordid="+
					staffClassPeriodSignInRecordId);
	jiazaiqiandaobanduan();
	}
	else{
	alert("签到失败，还没到刷卡时间，起始刷卡时间是:"+startChargeTime);
	}
   ;
   }
	/**正常班次签退**/
	function qiantui(staffClassPeriodSignInRecordId,calculateAbsenceNo,workDate,goToWorkTime,timeFromWork,LeaveEarlyTime,LeaveEarlyAbsenteeismTime,signInTime,timeToOne){
	var qiantuishijian=huoqudangqianriqi()+" "+$(".danqianshijianDiv")[0].innerHTML.substring(0,5);
	if(jisuanfenzhongshu(signInTime,new Date())>timeToOne){
	var zaotui="";
	var queqin="";
	var now=new Date();
	if(validTime(goToWorkTime,timeFromWork)){/**判断下班时间是否大于上班时间**/
	if(jisuanfenzhongshu(now,workDate+" "+ timeFromWork)>LeaveEarlyTime){/**判断是否早退**/
	if(jisuanfenzhongshu(now,workDate+" "+ timeFromWork)>LeaveEarlyAbsenteeismTime){
	queqin="&attendanceclasschildid=13&lateno=0";
	}
	else{
	if(calculateAbsenceNo){/**是否记早退**/
	zaotui="&leaveearlyno=1";
	}
	}
	}
	}else{
	if(jisuanfenzhongshu(now,addDate(workDate,1)+" "+ timeFromWork)>LeaveEarlyTime){/**判断是否早退**/
	if(jisuanfenzhongshu(now,addDate(workDate,1)+" "+timeFromWork)>LeaveEarlyAbsenteeismTime){
	queqin="&attendanceclasschildid=13&lateno=0";
	}
	else{
	if(calculateAbsenceNo){/**是否记早退**/
	zaotui="&leaveearlyno=1";
	}
	}
	}
	}
		ajax("${ctx}/PersonAttendance/updateClassperiodsigninrecord.do?signbacktime="+qiantuishijian
					 +queqin+zaotui
					+"&signbackwayid=29"
					+"&signbacknumber=diannaoqiandao"+"&staffclassperiodsigninrecordid="+
					staffClassPeriodSignInRecordId
					);
	    jiazaiqiandaobanduan();
	
	}
	else{
	alert("签到过于频繁");
	}
	}
	function addDate(date,days){ 
	var d=new Date(date); 
	d.setDate(d.getDate()+days); 
	var month=d.getMonth()+1; 
	var day = d.getDate(); 
	if(month<10){ 
	month = "0"+month; 
	} 
	if(day<10){ 
	day = "0"+day; 
	} 
	var val = d.getFullYear()+"-"+month+"-"+day; 
	return val; 
	}
	
	function addminuse(shangbanshijian,fenzhongshu){
    var date=new Date(shangbanshijian);;
    var thisdate= date.getTime()+60000*fenzhongshu;
    date.setTime(thisdate);
    return dateConvert(date.toUTCString());
	}
	
	//定义转换日期函数
   function dateConvert(dateParms){ 
    var datetime=new Date(dateParms);
    //获取年月日时分秒
     var year = datetime.getFullYear();
     var month = datetime.getMonth()+1; 
     var date = datetime.getDate(); 
     var hour = datetime.getHours(); 
     var minutes = datetime.getMinutes(); 
     //月，日，时，分，秒 小于10时，补0
     if(month<10){
      month = "0" + month;
     }
     if(date<10){
      date = "0" + date;
     }
     if(hour <10){
      hour = "0" + hour;
     }
     if(minutes <10){
      minutes = "0" + minutes;
     }
     var time = year+"-"+month+"-"+date+" "+hour+":"+minutes; 
     return time;
    }
	
	
	
/**计算分钟数**/
function jisuanfenzhongshu(date1,date4){
    var  date2= new Date(date4);
    var date3 = date2.getTime() - new Date(date1).getTime();   //时间差的毫秒数        
     //计算出相差分钟数 
     return Math.floor(date3/(60*1000)); 
    }
/**判断是否过了签到时间**/
function panduanTime(shanbanshijian,endTime,danqianshijian){
       var date1=new Date(shanbanshijian).getTime(); 
       var date2=new Date(endTime).getTime();
       var date3=new Date(danqianshijian).getTime();
       if(date3>=date1&&date3<=date2){
       return true;
       }else{
             return false;
         }
}

/**判断签到时间是否大于起始刷卡时间**/
 function validTime(startTime,endTime){
       var date1=new Date("2016-01-10 "+startTime); 
       var date2=new Date("2016-01-10 "+endTime);
       if(date1.getTime()>date2.getTime()) {                                
               return false;
         }else{
             return true;
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
</head>

<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
			<li><a href="#">我的考勤</a></li>
			<li class="active">考勤打卡</li>
		</ul>
	</div>
	<div class="mydiv"></div>
	<div class="banzudiv"></div>
	<table class="mytable">


	</table>
</body>
</html>

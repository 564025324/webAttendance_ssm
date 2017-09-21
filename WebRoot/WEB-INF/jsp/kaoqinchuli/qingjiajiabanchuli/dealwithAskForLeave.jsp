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
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
<style type="text/css">
#tbodybAllAskForLeave tr td{
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
 selectAllAskForLeave();
	});
	
	/**多条件查询我的请假、出差、加班信息**/
  function selectAllAskForLeave(){
     var data= ajax("${ctx}/DealWithAskForLeave/selectAllAskForLeave.do?checkTypeId="+$("#cboChuLiZhuangTai").val());
	  	$("#tbodybAllAskForLeave").empty();
				for ( var i = 0; i < data.length; i++) {
				var startdate=data[i].startdate;
				var enddate=data[i].enddate;
				var remark=data[i].remark;
				var askForLeaveId=data[i].askForLeaveId;
				var registrationTypeId=data[i].registrationTypeId;
				var  positionClassesId=data[i].positionClassesId;
				var  askForLeaveMxId=data[i].askForLeaveMxId;
				var staffid=data[i].operationStaffId;
				var groupid=data[i].groupid;
				var writeBack=data[i].writeBack;
			    	var style=data[i].checkTypeId==31?"class='mytd'":(data[i].checkTypeId==32?"class='mytd1'":"");
					var edit="";
					if(data[i].checkTypeId==33){
					if(positionClassesId!=0){
					edit="<a href=\"javascript:chuli('"+startdate+"','"+enddate+"','"+
					askForLeaveId+"','"+registrationTypeId+"','"
					+positionClassesId+"','"+staffid+"','"+groupid+"','"+data[i].operationstaffName+"')\">【处理】</a>";
					}else{
					edit="<a href=\"javascript:chuli('"+startdate+"','"+enddate+"','"+
					askForLeaveId+"','"+registrationTypeId+"','"
					+0+"','"+staffid+"','"+groupid+"','"+data[i].operationstaffName+"')\">【处理】</a>";
					}
					}else{
					edit="<div style='color: #afa7a7;'>已处理</div>";
					}
					var html = "<tr>"+"<td>"+edit+"</td>"
					+
					"<td "+style+">"+data[i].checkTypeName+"</td>"
					+
					"<td>"+data[i].operationstaffName+"</td>"
					+
					"<td>"+data[i].registrationtypeName+"</td>"
					+
					"<td>"+data[i].className+"</td>"
					+
					"<td>"+startdate+"</td>"
					+
					"<td>"+enddate+"</td>"
					+
					"<td>"+remark+"</td>"
					+
					"<td>"+writeBack+"</td>"
					+
					"<td>"+data[i].checkmanName+"</td>"
					+
					"<td>"+data[i].checktime+"</td>"
					+"</tr>";
					$("#tbodybAllAskForLeave").append(html);
				}
      }
      /**修改请假、加班信息和签到记录表的信息**/
      var B_startdate,B_enddate,B_askForLeaveId,B_registrationTypeId,B_positionClassesId,B_staffid,B_groupid;
      function save(){
      var chulizhuangtaiId= $("#cboChuLiZhuanTai").val();
      var pishi= $("#pishi").val();
      var danqianshijian=huoqudangqianriqi();
      if(chulizhuangtaiId==31){
      if(B_positionClassesId!=0){
       
     var list="";
     for(var i=0;i<=GetDateDiff(B_startdate,B_enddate);i++){
     list=list+
     "&listInsert["+i+"].staffid="+B_staffid
     +"&listInsert["+i+"].workdate="+addDate(B_startdate,i)
     +"&listInsert["+i+"].classid="+B_positionClassesId
     +"&listInsert["+i+"].groupid="+B_groupid;
     }
      var data= ajax("${ctx}/DealWithAskForLeave/updateAskAndDeleteInsertRecord.do?askforleaveid="+B_askForLeaveId+
      "&operationstaffid="+B_staffid+"&registrationtypeid="+B_registrationTypeId+
      "&startdate="+B_startdate+"&enddate="+B_enddate
      +"&checktime="+danqianshijian
      +"&checkmanid=${user.staffid}"+"&checkTypeId="+chulizhuangtaiId+"&writeBack="+pishi+list);
       selectAllAskForLeave(); 
   }else{
        var data= ajax("${ctx}/DealWithAskForLeave/updateAskForLeavAandRecord.do?askforleaveid="
       +B_askForLeaveId+
      "&operationstaffid="+B_staffid+
      "&registrationtypeid="+B_registrationTypeId+
      "&startdate="+B_startdate+
      "&enddate="+B_enddate
      +"&checktime="+danqianshijian
      +"&checkmanid=${user.staffid}"+"&checkTypeId="+chulizhuangtaiId+"&writeBack="+pishi
      );
       selectAllAskForLeave();
      }  
      }
      else{
     var data=ajax("${ctx}/PersonAttendance/updateAskForLeave.do?askforleaveid="+B_askForLeaveId+
      "&checktime="+danqianshijian
      +"&checkmanid=${user.staffid}"+"&checkTypeId="+chulizhuangtaiId+"&writeBack="+pishi);
       selectAllAskForLeave();
      }
      $("#myModal").modal("hide");
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
      /**计算两个日期相差的天数**/
	  function GetDateDiff(startDate,endDate)  
	{  
	    var startTime = new Date(startDate).getTime();     
	    var endTime = new Date(endDate).getTime();     
	    var dates = Math.abs((startTime - endTime))/(1000*60*60*24);     
	    return  dates;    
	}
	/**日期加天数计算日期**/
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
	
    /**点击处理时触发**/
    function chuli(startdate,enddate,askForLeaveId,registrationTypeId,
    positionClassesId,staffid,groupid,staffName){
		B_startdate=startdate;
		B_enddate=enddate;
		B_askForLeaveId=askForLeaveId;
		B_registrationTypeId=registrationTypeId;
	    B_positionClassesId=positionClassesId;
	    B_staffid=staffid;
	    B_groupid=groupid;
    $("#tladd_edit")[0].innerHTML="正在处理("+staffName+")的申请";
    $("#myModal").modal("show");
    }
     /**处理状态改变时触发**/
     function onchangeChuLiZhuangTai(){
      selectAllAskForLeave();
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
			<li class="active">请假、加班处理</li>
		</ul>
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
							<th style="text-align: center;">操作</th>
							<th style="text-align: center;width:53px;padding:0px;">
							<select onchange="onchangeChuLiZhuangTai()" id="cboChuLiZhuangTai" style="width: 89px;font-size: 14px;font-weight: 600;">
							<option value="0">全部状态</option>
							<option value="33">未处理</option>
							<option value="31">通过</option>
							<option value="32">不通过</option>
							</select>
							</th>
							<th style="text-align: center;">姓名</th>
							<th style="text-align: center;">登记类型</th>
							<th style="text-align: center;">申请班次</th>
							<th style="text-align: center;width: 108px;">起始时间</th>
							<th style="text-align: center;width: 108px;">终止时间</th>
							<th style="text-align: center;">申请原因</th>
							<th style="text-align: center;">批示</th>
							<th style="text-align: center;">审核人</th>
							<th style="text-align: center;">审核时间</th>
						</tr>
					</thead>
					<tbody id="tbodybAllAskForLeave">
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
 						<table id="tbShijianduan" class="table table-bordered"
							style="border: 1px solid #dddddd">
							<tr>
								<td style="background-color: #ebf3fb;">处理状态</td>
								<td><select id="cboChuLiZhuanTai" style="font-size: 18px;">
								<option value="31">通过</option>
								<option value="32">不通过</option>
								</select>
								</td>
							    </tr>
								<tr>
								<td style="background-color: #ebf3fb;">批示</td>
								<td colspan="3"><input style="width: 426px;" id="pishi">
								</td>
							</tr>
						</table>
						</form>
						<div class="form-actions center">
							<button type="button" onclick="save()"
								class="btn btn-sm btn-success">
								提交<i class="icon-check icon-on-right bigger-110"></i>
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

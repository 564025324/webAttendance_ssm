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
#tbodybMyRetroactive tr td{
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
   selectMyRetroactive();
	});
	function selectMyRetroactive(){
     var data= ajax("${ctx}/PersonAttendance/selectMyRetroactive.do?staffid=${user.staffid}"+
	 "&starDate="+$("#qishiriqi").val()+
	 "&endDate="+$("#zhongzhiriqi").val()+
	 "&checkTypeId="+$("#cboChuLiZhuangTai").val()
	 );
	  $("#tbodybMyRetroactive").empty();
				for ( var i = 0; i < data.length; i++) {
				var style="",chaozuo="";
				if(data[i].checkstateid==31){
				style="class='mytd'";
				}else{
				if(data[i].checkstateid==32){
				style="class='mytd1'";
				}
				else{
				chaozuo="<a>【编辑】</a>";
				}
				}
					var html = "<tr>"+"<td>"+chaozuo+"</td>"
					+
					"<td "+style+">"+data[i].checkstate+"</td>"
					+
					"<td>"+data[i].operatingtime+"</td>"+
					"<td>"+data[i].signintime+"</td>"
					+
					"<td>"+(data[i].toandfrom==1?"下班":"上班")+"</td>"
					+
					"<td>"+data[i].applyforreason+"</td>"
					+
					"<td>"+data[i].remark+"</td>"
					+
					"<td>"+data[i].checkmanName+"</td>"
					+
					"<td>"+data[i].checktime+"</td>"
					
					+"</tr>";
					$("#tbodybMyRetroactive").append(html);
				} 
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
			起始时间从<input  id="qishiriqi" type="text" class="thisdate">
			<script type="text/javascript">
				$("#qishiriqi").jeDate({
			    isinitVal:false,
			    ishmsVal:false,
			    format:"YYYY-MM-DD",
			    zIndex:3000,
			});		
			</script>
			 至 <input type="text"  id="zhongzhiriqi"
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
		           	<button type="button"
										onclick="selectMyRetroactive()"
										class="btn btn-info btn-sm" style="font-size:14px">
										查询  <i class="icon-search icon-on-right bigger-120"></i>
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
							<th style="text-align: center;">补签时间</th>
							<th style="text-align: center;">上/下班</th>
							<th style="text-align: center;max-width: 330px;">申请原因</th>
							<th style="text-align: center;">批示</th>
							<th style="text-align: center;">审核人</th>
							<th style="text-align: center;">审核时间</th>
						</tr>
					</thead>
					<tbody id="tbodybMyRetroactive" class="tbody">
					</tbody>
				</table>
			</div>
		</fieldset>
	</div>

</body>
</html>

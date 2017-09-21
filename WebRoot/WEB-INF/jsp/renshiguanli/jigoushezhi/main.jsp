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
   .onediv{
   min-height:300px;height:100%;float: left
   }
   .twodiv{
   min-height:236px;width:100%;height:100%;
   }
   td{ /* padding-left: 40px; */
       padding-top: 10px;}
    #tbodyid td{
    text-align: center;
    }
   </style>
   <SCRIPT type="text/javascript">
		<!--
		var setting = {
			view: {
				dblClickExpand: true,
				selectedMulti : false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick
			}
		};
		function beforeClick(treeId, treeNode) {
			var check = (treeNode && !treeNode.isParent);
			if (!check) alert("只能选择城市...");
			return check;
		}
	     var departmentid=0;
		  function onClick(e, treeId, treeNode) {
		      $("#txtjigoubianhao").val(treeNode.number);
		      $("#cboshangjijigou").val(treeNode.fatherid);
		      $("#txtjigoumingcheng").val(treeNode.name);
		      $("#txtremark").val(treeNode.remark);
		      departmentid=treeNode.id;
		      selectOpsition(treeNode.id);
		}

		function showMenu(){
	     $("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
       var zNode=[];
	   $(document).ready(function(){
	     initZtree();
		 showMenu();
		  bangdingOpsition(2);
		});
		
		//职务下拉框的加载
	function bangdingOpsition(attributeGatherId){
		 $.ajax({
            async: false,//同步异步
			type : 'post',
			url : '${ctx}/setDeparment/selectByAttributeGatherId.do'+'?attributeGatherId='+attributeGatherId,
	         dataType: "json", 
	         scriptCharset: "utf-8",
			 success: function(data) {
			      $('#cboOpsition').empty();
			      for(var i=0;i<data.length;i++){
			      var tr="<option value='"+data[i].attributegatherchildid+"'>"+data[i].name+"</option>";
				  $('#cboOpsition').append(tr);
				 }
			},
		  });
	}
		//初始化下拉树
	 function initZtree(){
	  $("#btnSelectCustomer").show();
       <c:forEach items="${departments}" var="dp">  
       zNode.push({id:"${dp.departmentid}", pId:"${dp.fatherid}", name:"${dp.name}",number:"${dp.number}",fatherid:"${dp.fatherid}",remark:"${dp.remark}",open:true});
       </c:forEach> 
	   $.fn.zTree.init($("#treeDemo"), setting, zNode);
	 }
		var insert=0;
		var update=0;
		//机构新增操作
		function dpinsert(){
		   insert=1;
	      cancleDisabled();
	      $("#btndpinsert").attr({"disabled":"disabled"});
	      $("#btndpupdate").attr({"disabled":"disabled"});
	      $("#btndpdelete").attr({"disabled":"disabled"});
	       $("#txtjigoubianhao").val("");
	      $("#txtjigoumingcheng").val("");
	       $("#txtremark").val("");
		}
		//机构保存操作
		function dpsave(){
		var bianhao=$("#txtjigoubianhao").val().trim();
		var mingcheng=$("#txtjigoumingcheng").val().trim();
		var fathid=$("#cboshangjijigou").val();
		var remark=$("#txtremark").val();
		//insert==1进行机构新增
		if(insert==1){
		if(bianhao!=""&& mingcheng!=""){
		 if(panduan(mingcheng,bianhao)){
		 alert("该机构名称或编号已经存在，请重新输入！");
		}
		else{
		  ajax("/setDeparment/insert.do?fatherid="+fathid+"&name="+mingcheng+"&number="+bianhao+"&remark="+remark,"新增");
		  	} 
		}
		else{
		alert("机构编号或机构名称不能为空");
		}
		}
		else{
		//编辑进行保存
		if(update==1){
		if(bianhao!=""&& mingcheng!=""){
		 if(panduan(mingcheng,bianhao,departmentid)){
		 alert("该机构名称或编号已经存在，请重新输入！");
		}
		else{
		  ajax("/setDeparment/update.do?fatherid="+fathid+"&name="+mingcheng+"&number="+bianhao+"&remark="+remark+"&departmentid="+departmentid,"修改");
		  	} 
		}
		else{
		alert("机构编号或机构名称不能为空");
		}
		}	 
		}
		
		}
		
		//重新加载数据
		function refresh(){
		//主界面的方法
		activechange(document.getElementById("renshiguanli"),document.getElementById("setDepartment"),"setDeparment/main");
		}
		//判断机构编号是否相同
		function panduan(name,number,id){
		var b=false;
		for (var i = 0; i < zNode.length; i++) {
		if(zNode[i].id!=id){
        if(zNode[i].number.trim()==number||zNode[i].name.trim()==name){
	        b=true; 
	       }
		}
		}
		return b;
		}
		//机构删除操作
		function dpdelete(){
		
		}
		
		//ajax操作
		function ajax(url,caozuo,puanduan){
         $.ajax({
            async: true,//同步异步
			type : 'post',
			url : '${ctx}/'+url,
			success : function(data) {
				 if(data=="1"){
				 alert(caozuo+"成功!"); 
				 if(1!=puanduan){
				 refresh();
				 }
				 else{
				 var nodes = $.fn.zTree.getZTreeObj("treeDemo").getSelectedNodes();
				  selectOpsition(nodes[0].id);
				 }
				 }
				 else{
				  alert(caozuo+"失败");
				 }
			},
		  });
		 
		}
		 
		//机构修改操作
		function dpupdate(){
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = zTree.getSelectedNodes();
		if(nodes.length==1){
		  update=1;
		  $("#btndpinsert").attr({"disabled":"disabled"});
		  $("#btndpdelete").attr({"disabled":"disabled"});
		  cancleDisabled();
			}
			else{
			if(nodes.length>1){
			alert("不能同时选择多个机构进行修改");
			}
			else{
			alert("请选择需要修改的机构");
			}
			}
		}
		//机构取消操作
		function dpcancle(){
		   insert=0;
		   update=0;
	       $("#btndpinsert").removeAttr("disabled"); 
           $("#btndpupdate").removeAttr("disabled"); 
           $("#txtjigoumingcheng").removeAttr("disabled"); 
           $("#btndpdelete").removeAttr("disabled"); 
           disabled();
		}
		//取消文本禁用
		function cancleDisabled(){
		
           $("#cboshangjijigou").removeAttr("disabled"); 
           $("#txtjigoubianhao").removeAttr("disabled"); 
           $("#txtjigoumingcheng").removeAttr("disabled"); 
           $("#txtremark").removeAttr("disabled"); 
		}
		//禁用文本
		function disabled(){
		 $("#cboshangjijigou").attr({"disabled":"disabled"});
		 $("#txtjigoubianhao").attr({"disabled":"disabled"});
	      $("#txtjigoumingcheng").attr({"disabled":"disabled"});
	      $("#txtremark").attr({"disabled":"disabled"});
		}
		//查询机构职务
		function selectOpsition(departmentid){
		 $.ajax({
            async: false,//同步异步
			type : 'post',
			url : '${ctx}/setDeparment/selectOpsition.do'+'?departmentid='+departmentid,
	         dataType: "json", 
	         scriptCharset: "utf-8",
			 success: function(data) {
			      $('#tbodyid').empty();
			      for(var i=0;i<data.length;i++){
			      var tr="<tr><td>"+"<a href=javascript:deleteOpsition("+data[i].staffpositionid+")>【删除】</a>　　<a href=javascript:insertPosition(0,'"+data[i].staffpositionid+"','"+data[i].positionid+"')>【编辑】</a>"+"</td><td>"+data[i].department.name+"</td><td>"+data[i].department.number+"</td><td>"+data[i].position.name+"</td></tr>";
				 $('#tbodyid').append(tr);
				 }
			  
			},
		  });
		 
		
		}
    var positionid;
	//新增修改职务
	function insertPosition(add_edit,staffpositionid,zhiwuid){
	positionid=staffpositionid;
	var nodes = $.fn.zTree.getZTreeObj("treeDemo").getSelectedNodes();
	if(nodes.length==1){
	if(add_edit==0){
	    $("#tladd_edit").empty();
		$("#tladd_edit").append("修改职务");
		$("#cboOpsition").val(zhiwuid);
		$("#txthidden").val("edit");
	}
	else{
	 $("#tladd_edit").empty();
		$("#tladd_edit").append("新增职务");
		$("#txthidden").val("add");
		 
	}
	$("#myModal").modal("show");
	}
	else{if(nodes.length>1){
	alert("你已经多选了机构，请选择一个机构进行职务新增");
	}
	else{
	alert("你还没有选择机构，请选择一个要新增职务的机构");
	}
	}
	}
	//职务保存
	function opsitionsave(){
	var nodes = $.fn.zTree.getZTreeObj("treeDemo").getSelectedNodes();
	var departmentid=nodes[0].id;
	var position=$("#cboOpsition").val();
	if($("#txthidden").val()=="add"){
	 ajax("/setDeparment/add_editOpsition.do?departmentid="+departmentid+"&positionid="+position+"&add_edit=add","新增",1); 
	 $("#myModal").modal("hide");
	}
	else{
      ajax("/setDeparment/add_editOpsition.do?staffpositionid="+positionid+"&positionid="+position+"&add_edit=edit","修改",1);
	  $("#myModal").modal("hide");
	 }
	}
	//删除职务
	function deleteOpsition(opsitionid){
	if(confirm("是否确定删除此数据")){
	   ajax("/setDeparment/deleteOpsition.do?opsitionid="+opsitionid,"删除",1);
	} 
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
			<li class="active">机构设置</li>
		</ul>
    </div>
	<div class="onediv">
	<fieldset><legend>选择机构↓↓↓</legend>
    <ul  id="treeDemo" class="ztree" style="margin-top:0; width:160px;" ></ul>
    </fieldset>
    </div>
    <div>
    <div class="twodiv">
   <fieldset>
    <legend style="margin-bottom: 5px;">机构操作↓↓↓</legend>
    <table>
    <tr>
    <td colspan="2"><div>
    <span
									class="input-group-btn">
									<button id="btndpinsert" type="button" 
										onclick="dpinsert()"
										class="btn btn-info btn-sm" style="font-size:14px">
										新 增 <i class="icon-plus-sign icon-on-right bigger-120"></i>
									</button> </span> <span class="input-group-btn"></span> <span
									class="input-group-btn">
									<button id="btndpupdate" type="button" class="btn btn-warning btn-sm"
										onclick="dpupdate()"
										style="font-size:14px">
										编辑<i class="icon-pencil icon-on-right bigger-120"></i>
									</button> </span> <span class="input-group-btn"></span> <span
									class="input-group-btn">
									<button id="btndpdelete" type="button"
										onclick="dpdelete()"
										class="btn btn-danger btn-sm" style="font-size:14px">
										删 除 <i class="icon-trash icon-on-right bigger-120"></i>
									</button> </span>
									<span class="input-group-btn"></span> <span
									class="input-group-btn">
									<button id="btndpsave" onclick="dpsave()" type="button"
										class="btn btn-sm btn-success">
										保 存 <i class="icon-check icon-on-right bigger-110"></i>
									</button>
									</span>
									<span class="input-group-btn"></span> <span
									class="input-group-btn">
									<button  id="btndpcancle" type="reset" onclick="dpcancle()" class="btn btn-sm btn-warning">
										取消 <i class="icon-undo icon-on-right bigger-110"></i>
									</button></span>
    </div></td>
    </tr>
     
    <tr>
    <td>上级机构</td>
    <td><select id="cboshangjijigou" disabled="disabled" >
    <option value="0" >无上级机构</option>
     <c:forEach items="${departments}" var="dp">  
     <option value="${dp.departmentid}" >${dp.name}</option>
       </c:forEach> 
    </select></td>
    </tr>
    <tr>
    <td>机构编号</td>
    <td><input id="txtjigoubianhao" disabled="disabled"></td>
    </tr>
    <tr>
    <td>机构名称</td>
    <td><input id="txtjigoumingcheng" disabled="disabled"></td>
    </tr>
    <tr>
    <td>备注</td>
    <td><input id="txtremark" disabled="disabled"></td>
    </tr>
    </table>
    </fieldset>
    </div>
    <div>
    <fieldset>
    <legend style="margin-bottom: 5px;">机构职务操作↓↓↓</legend> 
    <button id="btndpinsert" type="button" 
										onclick="insertPosition('add')"
										class="btn btn-info btn-sm" style="font-size:14px">
										新增职务 <i class="icon-plus-sign icon-on-right bigger-120"></i>
									</button>
						<div class="table-responsive" style="position:relative;">
							<table id="sample-table-2" style="border: 2px solid #dddddd;"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th style="text-align: center;">操作</th>
										<th style="text-align: center;">机构名称</th>
										<th style="text-align: center;">机构编号</th>
										<th style="text-align: center;">职位名称</th>
									 </tr>
								</thead>
								<tbody id="tbodyid">
								</tbody>
							</table>
						</div>
					</fieldset>
    </div>
    </div>
    
 

 <!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">加载模态框</button>   -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
  <div class="modal-dialog">  
    <div class="modal-content">  
     <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>  
        <h4 id="tladd_edit" style="text-align:center" class="modal-title">新增职务</h4>  
      </div>  
     <div class="modal-body">
     <div style="text-align: center">
             <span style="font-size: 16px; padding: 10px;" >职务名称</span><select id="cboOpsition"></select>　
             <input id="txthidden" type="hidden">
      </div> 
      
     </div>  
     <div class="modal-footer">  
      <button type="button" class="btn btn-sm btn-warning" data-dismiss="modal">关闭</button>  
       <button type="button" onclick="opsitionsave()" class="btn btn-primary">保存</button>  
     </div>  
   </div>
  </div> 
</div>
 
 
  </body>
</html>

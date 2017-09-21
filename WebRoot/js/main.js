function openModulUrl(modulUrl) {
	parent.mainFrame.location = modulUrl;
}

function replaceModulUrl(modulUrl) {
	document.location = modulUrl;
}
 function afreshLogin(modulUrl) {
	if(confirm("确定要退出登录吗？")){
		 parent.document.location = modulUrl;
	}
} 
function ReturnBook(borrowingStatusID,url) {
	 if("8"==borrowingStatusID){
	alert("状态为【已续借】的数据不能归还哦!");
 }
else{
	replaceModulUrl(url);
 }
}
/**
 * 续借
 */
/*
 * function relend(url,borrowingStatusID){ if("2"==borrowingStatusID){
 * replaceModulUrl(url); } else{ alert('只有状态为【在借中】的数据才能续借哦!'); }
 *  }
 */
 
// 重置查询页面控件的值
function resetForm() {
	// 取得第一个form表单
	var actionForm = document.forms[0];

	var cbs = actionForm.elements;
	var i;
	for (i = 0; i < cbs.length; i++) {
		// alert(cbs[i].type);
		if (cbs[i].type == "checkbox" && cbs[i].checked) {
			cbs[i].checked = false;
		} else if (cbs[i].type == "text") {
			cbs[i].value = "";
		} else {
			// alert(cbs[i].type);
		}
	}

}
// 显示信息 flg=0:错误信息 flg=1:正确信息 flg=2:提示信息
function show_message(objName, flg, message) {
	var preText = "";

	var obj = document.getElementById(objName);
	if (flg == 0) {
		obj.className = "box_div_wrong";
		preText = "<img src='image/wrong.gif' style='margin-right:5px;' />";

	} else if (flg == 1) {
		obj.className = "box_div_right";
		preText = "<img src='image/right.gif' style='margin-right:5px;' />";
	} else {
		obj.className = "box_div_right";
	}
	obj.innerHTML = preText + message;

}
// 去除边空格
function trimString(str) {
	var i, j;
	if (str == "")
		return "";
	for (i = 0; i < str.length; i++)
		if (str.charAt(i) != ' ')
			break;
	if (i >= str.length)
		return "";
	for (j = str.length - 1; j >= 0; j--)
		if (str.charAt(j) != ' ')
			break;
	return str.substring(i, j + 1);
}

function out_chkEmpty(chkObjName, msg_labelName, errMessage) {
	var chk = false;
	var obj = document.getElementById(chkObjName);

	if (trimString(obj.value) != '') {
		show_message(msg_labelName, "1", '输入正确!');
		chk = true;
	} else {
		show_message(msg_labelName, "0", errMessage);
	}
	return chk;
}
function out_chkMaxLength(chkObjName, msg_labelName, errMessage, length) {
	var chk = false;
	var obj = document.getElementById(chkObjName);
	if ((trimString(obj.value).length > 0)
			&& (trimString(obj.value).length < length)) {
		show_message(msg_labelName, "1", '输入正确!');
		chk = true;
	} else {
		show_message(msg_labelName, "0", errMessage);
	}
	return chk;
}
function out_chkEmail(chkObjName, msg_labelName, errMessage, length) {
	var chk = false;
	var exp = /^[\w\.\-]+@([\w\-]+\.)+[a-z]{2,4}$/ig;
	var obj = document.getElementById(chkObjName);
	if (!out_chkMaxLength(chkObjName, msg_labelName, errMessage, length)) {
		return chk;
	}
	if (trimString(obj.value).match(exp)) {
		show_message(msg_labelName, "1", '输入正确!');
		chk = true;
	} else {
		show_message(msg_labelName, "0", errMessage);
	}

	return chk;
}
function out_chkPhone(chkObjName, msg_labelName, errMessage) {
	var exp = /^\d{11,12}$/ig;

	var chk = false;
	var obj = document.getElementById(chkObjName);

	if ((trimString(obj.value).length > 0)
			&& (trimString(obj.value).match(exp))) {
		show_message(msg_labelName, "1", '输入正确!');
		chk = true;
	} else {
		show_message(msg_labelName, "0", errMessage);
	}

	return chk;
}
function out_pickerDate(chkObjName, msg_labelName, errMessage) {
	var chk = false;
	var obj = dojo.widget.byId(chkObjName);
	if (trimString(obj.getValue()) != '') {
		show_message(msg_labelName, "1", '输入正确!');
		chk = true;
	} else {
		show_message(msg_labelName, "0", errMessage);
	}

	return chk;
}
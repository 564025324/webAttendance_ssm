package com.chenbingxian.controller.renshiguanli;
import java.util.List;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.chenbingxian.core.base.BaseController;
import com.chenbingxian.po.Department;
import com.chenbingxian.po.StaffPosition;
import com.chenbingxian.service.renshiguanli.setdepartment.IdepartmentSv;
import com.chenbingxian.service.renshiguanli.setdepartment.IpositionSv;

@Controller
@RequestMapping("/setDeparment")
public class SetDepartment extends BaseController<Department, String> {

	@Autowired
	IdepartmentSv idepartment;
	@Autowired
	IpositionSv ipositionSv;

	@RequestMapping("/main")
	public String selectAll() {
		List<Department> departments = idepartment.selectAll();
		request.setAttribute("departments", departments);
		return "/renshiguanli/jigoushezhi/main";
	}

	/*
	 * 修改部门
	 */@ResponseBody
	@RequestMapping("/update")
	public String update(Department t) {
		return "" + idepartment.update(t);
	}

	/*
	 * 新增部门
	 */
	@ResponseBody
	@RequestMapping("/insert")
	public String insert(Department t) {
		return "" + idepartment.insert(t);
	}

	@Override
	public String selectById(int id) {

		return null;
	}

	@Override
	public String delete(int id) {
		return "";
	}

	/*
	 * 根据属性集合id查询属性明细（查询绑定职务下拉框）
	 */
	@ResponseBody
	@RequestMapping(value = "/selectByAttributeGatherId", produces = "text/html;charset=UTF-8")
	public String selectByAttributeGatherId(int attributeGatherId) {
		JSONArray Positions = JSONArray.fromObject(idepartment
				.selectByAttributeGatherId(attributeGatherId));
		String str = Positions.toString();
		return str;
	}

	/*
	 * 机构职务的操作
	 */
	@ResponseBody
	@RequestMapping(value = "/selectOpsition", produces = "text/html;charset=UTF-8")
	public String selectBydepartmentId(int departmentid) {
		JSONArray staffPositions = JSONArray.fromObject(ipositionSv
				.selectBydepartmentId(departmentid));
		String str = staffPositions.toString();
		return str;
	}

	/*
	 * 新增修改职务
	 */
	@ResponseBody
	@RequestMapping(value = "/add_editOpsition")
	public String add_editOpsition(StaffPosition t, String add_edit) {
		if (add_edit.equals("add")) {
			return "" + ipositionSv.insert(t);
		} else {
			return "" + ipositionSv.update(t);
		}

	}

	/*
	 * 删除职务
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteOpsition")
	public String deleteOpsition(int opsitionid) {
		return "" + ipositionSv.delete(opsitionid);
	}
}

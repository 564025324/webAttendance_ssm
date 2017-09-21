package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.StaffClassesRecord;
import com.chenbingxian.vo.GengGaiPaiPanXinXi;
import com.chenbingxian.vo.YuanGongFenBanJiLu;
import com.chenbingxian.vo.paibanchaxunVo;

public interface StaffClassesRecordMapper {
    int deleteByPrimaryKey(Integer staffclassesrecordid);

    int insert(StaffClassesRecord record);

    int insertSelective(StaffClassesRecord record);

    StaffClassesRecord selectByPrimaryKey(Integer staffclassesrecordid);

    int updateByPrimaryKeySelective(StaffClassesRecord record);

    int updateByPrimaryKey(StaffClassesRecord record);
    /** 查询班组信息**/
    List<paibanchaxunVo> selectClassGroup();
    /**
     * 查询班组员工分班记录
     */
    List<YuanGongFenBanJiLu>  selectGroupRecord(@Param("goupid")int goupid,@Param("bginDate")String bginDate,@Param("endDate")String endDate);
   /**更改班组排班信息**/
    int updatePaiBanXinXi(@Param("listInsert")List<GengGaiPaiPanXinXi>listInsert,@Param("deleteIds")int[] deleteIds,
    		@Param("listUpdate")List<GengGaiPaiPanXinXi>listUpdate,@Param("groupid") int groupid);
	

}
package com.lijwen.po;

public class OvertimeSystem {
    private Integer overtimesystemid;
    private Integer overtime;
    private Integer earlyworktoovertimeno;
    private Integer lateworktoovertiemno;
    private Integer systemid;
 
 

    public OvertimeSystem(Integer overtimesystemid, Integer overtime, Integer earlyworktoovertimeno, Integer lateworktoovertiemno, Integer systemid) {
        this.overtimesystemid = overtimesystemid;
        this.overtime = overtime;
      
        this.earlyworktoovertimeno = earlyworktoovertimeno;
        this.lateworktoovertiemno = lateworktoovertiemno;
        
        this.systemid = systemid;
        
    }

    public OvertimeSystem() {
        super();
    }

    public Integer getOvertimesystemid() {
        return overtimesystemid;
    }

    public void setOvertimesystemid(Integer overtimesystemid) {
        this.overtimesystemid = overtimesystemid;
    }

    public Integer getOvertime() {
        return overtime;
    }

    public void setOvertime(Integer overtime) {
        this.overtime = overtime;
    }

   

    public Integer getEarlyworktoovertimeno() {
        return earlyworktoovertimeno;
    }

    public void setEarlyworktoovertimeno(Integer earlyworktoovertimeno) {
        this.earlyworktoovertimeno = earlyworktoovertimeno;
    }

    public Integer getLateworktoovertiemno() {
        return lateworktoovertiemno;
    }

    public void setLateworktoovertiemno(Integer lateworktoovertiemno) {
        this.lateworktoovertiemno = lateworktoovertiemno;
    }
    public Integer getSystemid() {
        return systemid;
    }

    public void setSystemid(Integer systemid) {
        this.systemid = systemid;
    }

}
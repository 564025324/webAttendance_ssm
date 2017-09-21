package com.chenbingxian.po;

public class AttributeGatherChild {
    private Integer attributegatherchildid;

    private String name;

    private Integer attributegatherid;

    public AttributeGatherChild(Integer attributegatherchildid, String name, Integer attributegatherid) {
        this.attributegatherchildid = attributegatherchildid;
        this.name = name;
        this.attributegatherid = attributegatherid;
    }

    public AttributeGatherChild() {
        super();
    }

    public Integer getAttributegatherchildid() {
        return attributegatherchildid;
    }

    public void setAttributegatherchildid(Integer attributegatherchildid) {
        this.attributegatherchildid = attributegatherchildid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getAttributegatherid() {
        return attributegatherid;
    }

    public void setAttributegatherid(Integer attributegatherid) {
        this.attributegatherid = attributegatherid;
    }
}
package com.softeem.hrms.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * ¿¼ÇÚÐÅÏ¢
 * @author MR.²ñ
 *
 */
public class Attendance implements Serializable {
    private Integer id;

    private String xm;

    private String bm;

    private Date gcsj;

    private Integer wdkcs;

    private Integer cdcs;

    private Integer ztcs;

    private Integer kgts;

    private Integer sjts;

    private Integer bjts;

    private Integer cj_hljts;

    private Integer hjts;

    private Integer sjts1;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm == null ? null : xm.trim();
    }

    public String getBm() {
        return bm;
    }

    public void setBm(String bm) {
        this.bm = bm == null ? null : bm.trim();
    }

    public Date getGcsj() {
        return gcsj;
    }

    public void setGcsj(Date gcsj) {
        this.gcsj = gcsj;
    }

    public Integer getWdkcs() {
        return wdkcs;
    }

    public void setWdkcs(Integer wdkcs) {
        this.wdkcs = wdkcs;
    }

    public Integer getCdcs() {
        return cdcs;
    }

    public void setCdcs(Integer cdcs) {
        this.cdcs = cdcs;
    }

    public Integer getZtcs() {
        return ztcs;
    }

    public void setZtcs(Integer ztcs) {
        this.ztcs = ztcs;
    }

    public Integer getKgts() {
        return kgts;
    }

    public void setKgts(Integer kgts) {
        this.kgts = kgts;
    }

    public Integer getSjts() {
        return sjts;
    }

    public void setSjts(Integer sjts) {
        this.sjts = sjts;
    }

    public Integer getBjts() {
        return bjts;
    }

    public void setBjts(Integer bjts) {
        this.bjts = bjts;
    }

    public Integer getCj_hljts() {
        return cj_hljts;
    }

    public void setCj_hljts(Integer cj_hljts) {
        this.cj_hljts = cj_hljts;
    }

    public Integer getHjts() {
        return hjts;
    }

    public void setHjts(Integer hjts) {
        this.hjts = hjts;
    }

    public Integer getSjts1() {
        return sjts1;
    }

    public void setSjts1(Integer sjts1) {
        this.sjts1 = sjts1;
    }
}
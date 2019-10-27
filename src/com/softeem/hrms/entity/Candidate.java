package com.softeem.hrms.entity;

import java.io.Serializable;
import java.util.Date;


public class Candidate implements Serializable {
    private Integer id;

    private String xm;

    private Date mssj;

    private String msbm;

    private String msgw;

    private String xl;

    private String zy;

    private String lxfs;

    private String dzyx;

    private Date cssj;

    private String csjg;

    private Date fssj;

    private String fsjg;

    private Integer sfly;

    private Date nlysj;

    private Integer sfdg;

    private Date dgsj;

    private String fj;

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

    public Date getMssj() {
        return mssj;
    }

    public void setMssj(Date mssj) {
        this.mssj = mssj;
    }

    public String getMsbm() {
        return msbm;
    }

    public void setMsbm(String msbm) {
        this.msbm = msbm == null ? null : msbm.trim();
    }

    public String getMsgw() {
        return msgw;
    }

    public void setMsgw(String msgw) {
        this.msgw = msgw == null ? null : msgw.trim();
    }

    public String getXl() {
        return xl;
    }

    public void setXl(String xl) {
        this.xl = xl == null ? null : xl.trim();
    }

    public String getZy() {
        return zy;
    }

    public void setZy(String zy) {
        this.zy = zy == null ? null : zy.trim();
    }

    public String getLxfs() {
        return lxfs;
    }

    public void setLxfs(String lxfs) {
        this.lxfs = lxfs == null ? null : lxfs.trim();
    }

    public String getDzyx() {
        return dzyx;
    }

    public void setDzyx(String dzyx) {
        this.dzyx = dzyx == null ? null : dzyx.trim();
    }

    public Date getCssj() {
        return cssj;
    }

    public void setCssj(Date cssj) {
        this.cssj = cssj;
    }

    public String getCsjg() {
        return csjg;
    }

    public void setCsjg(String csjg) {
        this.csjg = csjg == null ? null : csjg.trim();
    }

    public Date getFssj() {
        return fssj;
    }

    public void setFssj(Date fssj) {
        this.fssj = fssj;
    }

    public String getFsjg() {
        return fsjg;
    }

    public void setFsjg(String fsjg) {
        this.fsjg = fsjg == null ? null : fsjg.trim();
    }

    public Integer getSfly() {
        return sfly;
    }

    public void setSfly(Integer sfly) {
        this.sfly = sfly;
    }

    public Date getNlysj() {
        return nlysj;
    }

    public void setNlysj(Date nlysj) {
        this.nlysj = nlysj;
    }

    public Integer getSfdg() {
        return sfdg;
    }

    public void setSfdg(Integer sfdg) {
        this.sfdg = sfdg;
    }

    public Date getDgsj() {
        return dgsj;
    }

    public void setDgsj(Date dgsj) {
        this.dgsj = dgsj;
    }

    public String getFj() {
        return fj;
    }

    public void setFj(String fj) {
        this.fj = fj == null ? null : fj.trim();
    }
}
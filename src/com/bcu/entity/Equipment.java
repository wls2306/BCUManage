package com.bcu.entity;

public class Equipment {
    private String equId;     //编号
    private String equName;   //名称
    private String equModel;  //型号
    private String equType;   //类型
    private String equFormat;    //规格
    private String equPrice;    //单价
    private String equMainCount; //主件数量
    private String equTotalPrice;//总金额 单价*主件数
    private String equUnit;//单位
    private String equTickNo;//单据
    private String equFactory;//生产厂家
    private String equFactoryNo;//出厂号
    private String equOutFactoryDate;//出厂日期
    private String equBoughtDate;//购置日期
    private String equUseDirection;//使用方向
    private String equStatus;//状态

    /***
     *  1:可用
     *  0.不可用
     *  -1.损坏（维修）
     */
    private String equManager;//管理人
    private String equLocation;//存放位置
    private String equBelong;//归属
    private String equUser;//当前使用者



    public String getEquUser() {
        return equUser;
    }

    public void setEquUser(String equUser) {
        this.equUser = equUser;
    }



    public String getEquId() {
        return equId;
    }

    public void setEquId(String equId) {
        this.equId = equId;
    }

    public String getEquName() {
        return equName;
    }

    public void setEquName(String equName) {
        this.equName = equName;
    }

    public String getEquModel() {
        return equModel;
    }

    public void setEquModel(String equModel) {
        this.equModel = equModel;
    }

    public String getEquType() {
        return equType;
    }

    public void setEquType(String equType) {
        this.equType = equType;
    }

    public String getEquFormat() {
        return equFormat;
    }

    public void setEquFormat(String equFormat) {
        this.equFormat = equFormat;
    }

    public String getEquPrice() {
        return equPrice;
    }

    public void setEquPrice(String equPrice) {
        this.equPrice = equPrice;
    }

    public String getEquMainCount() {
        return equMainCount;
    }

    public void setEquMainCount(String equMainCount) {
        this.equMainCount = equMainCount;
    }

    public String getEquTotalPrice() {
        return equTotalPrice;
    }

    public void setEquTotalPrice(String equTotalPrice) {
        this.equTotalPrice = equTotalPrice;
    }

    public String getEquUnit() {
        return equUnit;
    }

    public void setEquUnit(String equUnit) {
        this.equUnit = equUnit;
    }

    public String getEquTickNo() {
        return equTickNo;
    }

    public void setEquTickNo(String equTickNo) {
        this.equTickNo = equTickNo;
    }

    public String getEquFactory() {
        return equFactory;
    }

    public void setEquFactory(String equFactory) {
        this.equFactory = equFactory;
    }

    public String getEquFactoryNo() {
        return equFactoryNo;
    }

    public void setEquFactoryNo(String equFactoryNo) {
        this.equFactoryNo = equFactoryNo;
    }

    public String getEquOutFactoryDate() {
        return equOutFactoryDate;
    }

    public void setEquOutFactoryDate(String equOutFactoryDate) {
        this.equOutFactoryDate = equOutFactoryDate;
    }

    public String getEquBoughtDate() {
        return equBoughtDate;
    }

    public void setEquBoughtDate(String equBoughtDate) {
        this.equBoughtDate = equBoughtDate;
    }

    public String getEquUseDirection() {
        return equUseDirection;
    }

    public void setEquUseDirection(String equUseDirection) {
        this.equUseDirection = equUseDirection;
    }

    public String getEquStatus() {
        return equStatus;
    }

    public void setEquStatus(String equStatus) {
        this.equStatus = equStatus;
    }

    public String getEquManager() {
        return equManager;
    }

    public void setEquManager(String equManager) {
        this.equManager = equManager;
    }

    public String getEquLocation() {
        return equLocation;
    }

    public void setEquLocation(String equLocation) {
        this.equLocation = equLocation;
    }

    public String getEquBelong() {
        return equBelong;
    }

    public void setEquBelong(String equBelong) {
        this.equBelong = equBelong;

    }
}

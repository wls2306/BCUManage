package com.bcu.entity;

public class Request {
    private String reqId; //请求编号
    private String reqType;//请求类别

    /***
     * 规定 Type
     *  10+ ：资产相关请求
     *      10.资产借用请求
     *  20+：耗材相关请求
     *  30+仪器设备相关请求
     *  40+采购单等方面相关请求
     */


    private String reqGoalId;//请求目标编号
    private String reqGoalName;//请求目标名称
    private String reqContent;//请求描述
    private String reqApprovalLevel;//审批人权限
    private String reqStatus;//请求状态

    /***
     * 规定 reqStatus
     * -1.拒绝
     * 0.未处理
     * 1.接受
     * 2.向上级审核
     */




    private String reqBack;//请求反馈
    private String reqInitiator;//请求发起人
    private String reqAuditor;//请求审批人
    private String reqPostTime; //请求发送时间
    private String reqHandleTime;//请求处理时间

    public String getReqPostTime() {
        return reqPostTime;
    }

    public void setReqPostTime(String reqPostTime) {
        this.reqPostTime = reqPostTime;
    }

    public String getReqHandleTime() {
        return reqHandleTime;
    }

    public void setReqHandleTime(String reqHandleTime) {
        this.reqHandleTime = reqHandleTime;
    }

    public String getReqId() {
        return reqId;
    }

    public void setReqId(String reqId) {
        this.reqId = reqId;
    }

    public String getReqType() {
        return reqType;
    }

    public void setReqType(String reqType) {
        this.reqType = reqType;
    }

    public String getReqGoalId() {
        return reqGoalId;
    }

    public void setReqGoalId(String reqGoalId) {
        this.reqGoalId = reqGoalId;
    }

    public String getReqGoalName() {
        return reqGoalName;
    }

    public void setReqGoalName(String reqGoalName) {
        this.reqGoalName = reqGoalName;
    }

    public String getReqContent() {
        return reqContent;
    }

    public void setReqContent(String reqContent) {
        this.reqContent = reqContent;
    }

    public String getReqApprovalLevel() {
        return reqApprovalLevel;
    }

    public void setReqApprovalLevel(String reqApprovalLevel) {
        this.reqApprovalLevel = reqApprovalLevel;
    }

    public String getReqStatus() {
        return reqStatus;
    }

    public void setReqStatus(String reqStatus) {
        this.reqStatus = reqStatus;
    }

    public String getReqBack() {
        return reqBack;
    }

    public void setReqBack(String reqBack) {
        this.reqBack = reqBack;
    }

    public String getReqInitiator() {
        return reqInitiator;
    }

    public void setReqInitiator(String reqInitiator) {
        this.reqInitiator = reqInitiator;
    }

    public String getReqAuditor() {
        return reqAuditor;
    }

    public void setReqAuditor(String reqAuditor) {
        this.reqAuditor = reqAuditor;
    }
}

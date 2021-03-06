package com.lifeshs.component.sms;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.3-hudson-390-
 * Generated source version: 2.0
 * 
 */
@WebService(name = "SmsPortType", targetNamespace = "http://ws.flaginfo.com.cn")
public interface SmsPortType {

	/**
	 * 
	 * @param in0 企业编号
	 * @param in1 用户名称
	 * @param in2 用户密码
	 * @param in3 短信内容, 最大402个字符
	 * @param in4 手机号码(多个号码用”,”分隔)，最多1000个号码
	 * @param in5 流水号，20位数字，唯一  （规则自定义,建议时间格式精确到毫秒）
	 * @param in6 预约发送时间，格式:yyyyMMddhhmmss,如‘20090901010101’， 立即发送请填空
	 * @param in7 提交时检测方式
				  1 --- 提交号码中有效的号码仍正常发出短信，无效的号码在返回参数faillist中列出
				   不为1 或该参数不存在 --- 提交号码中只要有无效的号码，那么所有的号码都不发出短信，所有的号码在返回参数faillist中列出
	 * @param in8 保留（空值）
	 * @param in9 接入号扩展号（默认不填，扩展号为数字，扩展位数由当前所配的接入号长度决定，整个接入号最长20位）
	 * @param in10 保留（空值）
	 * @return returns java.lang.String
	 */
	@WebMethod(operationName = "Sms")
	@WebResult(name = "out", targetNamespace = "http://ws.flaginfo.com.cn")
	@RequestWrapper(localName = "Sms", targetNamespace = "http://ws.flaginfo.com.cn", className = "com.tzcms.cxf.webservice.sms.Sms")
	@ResponseWrapper(localName = "SmsResponse", targetNamespace = "http://ws.flaginfo.com.cn", className = "com.tzcms.cxf.webservice.sms.SmsResponse")
	public String sms(
            @WebParam(name = "in0", targetNamespace = "http://ws.flaginfo.com.cn") String in0,
            @WebParam(name = "in1", targetNamespace = "http://ws.flaginfo.com.cn") String in1,
            @WebParam(name = "in2", targetNamespace = "http://ws.flaginfo.com.cn") String in2,
            @WebParam(name = "in3", targetNamespace = "http://ws.flaginfo.com.cn") String in3,
            @WebParam(name = "in4", targetNamespace = "http://ws.flaginfo.com.cn") String in4,
            @WebParam(name = "in5", targetNamespace = "http://ws.flaginfo.com.cn") String in5,
            @WebParam(name = "in6", targetNamespace = "http://ws.flaginfo.com.cn") String in6,
            @WebParam(name = "in7", targetNamespace = "http://ws.flaginfo.com.cn") String in7,
            @WebParam(name = "in8", targetNamespace = "http://ws.flaginfo.com.cn") String in8,
            @WebParam(name = "in9", targetNamespace = "http://ws.flaginfo.com.cn") String in9,
            @WebParam(name = "in10", targetNamespace = "http://ws.flaginfo.com.cn") String in10);

	/**
	 * 
	 * @param in2
	 * @param in1
	 * @param in0
	 * @return returns java.lang.String
	 */
	@WebMethod(operationName = "Report")
	@WebResult(name = "out", targetNamespace = "http://ws.flaginfo.com.cn")
	@RequestWrapper(localName = "Report", targetNamespace = "http://ws.flaginfo.com.cn", className = "com.tzcms.cxf.webservice.sms.Report")
	@ResponseWrapper(localName = "ReportResponse", targetNamespace = "http://ws.flaginfo.com.cn", className = "com.tzcms.cxf.webservice.sms.ReportResponse")
	public String report(
            @WebParam(name = "in0", targetNamespace = "http://ws.flaginfo.com.cn") String in0,
            @WebParam(name = "in1", targetNamespace = "http://ws.flaginfo.com.cn") String in1,
            @WebParam(name = "in2", targetNamespace = "http://ws.flaginfo.com.cn") String in2);

	/**
	 * 
	 * @param parameters
	 * @return returns com.tzcms.cxf.webservice.sms.ReplyResponse
	 */
	@WebMethod(operationName = "Reply")
	@WebResult(name = "ReplyResponse", targetNamespace = "http://ws.flaginfo.com.cn", partName = "parameters")
	@SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
	public ReplyResponse reply(
            @WebParam(name = "ReplyRequest", targetNamespace = "http://ws.flaginfo.com.cn", partName = "parameters") ReplyRequest parameters);

	/**
	 * 
	 * @param parameters
	 * @return returns com.tzcms.cxf.webservice.sms.ReplyConfirmResponse
	 */
	@WebMethod(operationName = "ReplyConfirm")
	@WebResult(name = "ReplyConfirmResponse", targetNamespace = "http://ws.flaginfo.com.cn", partName = "parameters")
	@SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
	public ReplyConfirmResponse replyConfirm(
            @WebParam(name = "ReplyConfirmRequest", targetNamespace = "http://ws.flaginfo.com.cn", partName = "parameters") ReplyConfirmRequest parameters);

	/**
	 * 
	 * @param parameters
	 * @return returns com.tzcms.cxf.webservice.sms.SearchSmsNumResponse
	 */
	@WebMethod(operationName = "SearchSmsNum")
	@WebResult(name = "SearchSmsNumResponse", targetNamespace = "http://ws.flaginfo.com.cn", partName = "parameters")
	@SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
	public SearchSmsNumResponse searchSmsNum(
            @WebParam(name = "SearchSmsNumRequest", targetNamespace = "http://ws.flaginfo.com.cn", partName = "parameters") SearchSmsNumRequest parameters);

	/**
	 * 
	 * @param parameters
	 * @return returns com.tzcms.cxf.webservice.sms.AuditingResponse
	 */
	@WebMethod(operationName = "Auditing")
	@WebResult(name = "AuditingResponse", targetNamespace = "http://ws.flaginfo.com.cn", partName = "parameters")
	@SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
	public AuditingResponse auditing(
            @WebParam(name = "AuditingRequest", targetNamespace = "http://ws.flaginfo.com.cn", partName = "parameters") AuditingRequest parameters);

}

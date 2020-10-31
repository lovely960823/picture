package mlt.boot.log;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.alibaba.fastjson.JSONObject;

import mlt.boot.entity.ExceptionLogEntity;
import mlt.boot.mapper.ExceptionLogMapper;


@Aspect
@Component
public class ExceptionLogAspect {

	
	@Autowired
	HttpServletRequest request;

	 @Pointcut("execution(* mlt.boot.controller..*.*(..))")
	    public void operExceptionLogPoinCut() {
	    }

	    @Autowired
	    private ExceptionLogMapper exceptionLogMapper;
	    
	    @AfterThrowing(pointcut = "operExceptionLogPoinCut()", throwing = "e")
	    public void saveExceptionLog(JoinPoint joinPoint, Throwable e) {
	        // 获取RequestAttributes
	        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
	        // 从获取RequestAttributes中获取HttpServletRequest的信息
	        HttpServletRequest request = (HttpServletRequest) requestAttributes
	                .resolveReference(RequestAttributes.REFERENCE_REQUEST);
	        ExceptionLogEntity excepLog = new ExceptionLogEntity();
	        try {
	            // 获取请求的类名
	            String className = joinPoint.getTarget().getClass().getName();
	            // 获取请求的方法名
	            String methodName = className+":"+request.getRequestURI();
	            // 请求的参数
	            Enumeration<String> paramter = request.getParameterNames();
	            JSONObject json = new JSONObject();
	    		while (paramter.hasMoreElements()) {
	    			String str = (String) paramter.nextElement();
	    			json.put(str, request.getParameter(str));
	    		}
	            excepLog.setExcRequParam(json.toJSONString()); // 请求参数
	            excepLog.setOperMethod(methodName); // 请求方法名
	            excepLog.setExcName(e.getClass().getName()); // 异常名称
	            excepLog.setExcMessage(stackTraceToString(e.getClass().getName(), e.getMessage(), e.getStackTrace())); // 异常信息
	            excepLog.setOperUserId(""); // 操作员ID
	            excepLog.setOperUserName(""); // 操作员名称
	            excepLog.setOperIp(request.getRemoteAddr()); // 操作员IP
	            excepLog.setOperCreateTime(new Date().toLocaleString()); // 发生异常时间
	            exceptionLogMapper.insertSelective(excepLog);
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }

	    }

	    public String stackTraceToString(String exceptionName, String exceptionMessage, StackTraceElement[] elements) {
	        StringBuffer strbuff = new StringBuffer();
	        for (StackTraceElement stet : elements) {
	            strbuff.append(stet + "\n");
	        }
	        String message = exceptionName + ":" + exceptionMessage + "\n\t" + strbuff.toString();
	        return message;
	    }

}

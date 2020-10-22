<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>相册</title>
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
	<script src="js/css3-mediaqueries.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath }/static/jquery/jquery-1.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js" charset="utf-8"></script>

<script src="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/layui.all.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/css/layui.css">
<style type="text/css">
	input {
	position: absolute;
	}
	.layui-form-item {
		margin-top: 40%;
		margin-left: 70%;
	}
	.layui-btn {
    display: inline-block;
    height: 38px;
    line-height: 26px;
    padding: 0 18px;
    background-color: #009688;
    color: #fff;
    white-space: nowrap;
    text-align: center;
    font-size: 14px;
    border: none;
    border-radius: 2px;
    cursor: pointer;
   } 
</style>
</head>
<body >
<input type="radio" name="skinChecked" value="1">
<img alt="" src="${pageContext.request.contextPath }/static/images/skin1.png" style="width: 100px;height: 100px;">  

<input type="radio" name="skinChecked" value="2">
<img alt="" src="${pageContext.request.contextPath }/static/images/skin2.png" style="width: 100px;height: 100px;"> 
  
<input type="radio" name="skinChecked" value="3">
<img alt="" src="${pageContext.request.contextPath }/static/images/skin3.png" style="width: 100px;height: 100px;">   

<%-- <input type="radio" name="skinChecked" value="4">
<img alt="" src="${pageContext.request.contextPath }/static/images/skin4.png" style="width: 100px;height: 100px;">   
 --%>
<!-- <input type="radio" name="skinChecked" value="5">
<img alt="" src="/static/images/skin5.jpg" style="width: 100px;height: 100px;">    -->


  <div class="layui-form-item">
     <button type="button" class="layui-btn"  onclick="commit1()" style="background-color: #975233;border-radius: 10px;height: 26px;">确定</button> 
     <button type="button" class="layui-btn" onclick="cancel()" style="background-color: #975233;border-radius: 10px;height: 26px;">取消</button> 
  </div>
</body>
<script>
function cancel(){
	//parent.location.reload();
	parent.layer.close(parent.layer.getFrameIndex(window.name));
}
function commit1(){
	var val = $('input:radio:checked').val();
	$.ajax({
       	url:"${pageContext.request.contextPath }/common/setskin?id="+val,
       	data:{},
       	dataType:"json",
       	type:"POST",
       	success:function(data){
            if (data.code == 10000) {
            	layer.msg(data.message, {time: 1000});
            	parent.location.reload();
            	parent.layer.close(parent.layer.getFrameIndex(window.name));
            } else {
                layer.msg(data.message, {time: 1000});
            }
       	},
       	error:function(){
       		layer.msg(data.message, {time: 1000});
       	},
       	
       });
}
</script>
</html>
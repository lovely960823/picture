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

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/ztree/css/zTreeStyle/zTreeStyle.min.css">
<script src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.all.js" charset="utf-8"></script>
<style type="text/css">
#btndiv{
    position: fixed;
    right: 6px;
    bottom:15px;
}
</style>

</head>
<body>
<input id="id" name="id" value="${id}" type="hidden"><!-- 要移动的目标文件 -->
<input id="moveid" name="moveid" value="" type="hidden"><!-- 要移动到的目标位置 -->
<input id="huanyuan" name="huanyuan" value="${huanyuan }" type="hidden">
<div style="height: 30px;"align="center" id="btndiv">
 <button type="button" class="layui-btn" onclick="ensure()">确定</button> 
 <button type="button" class="layui-btn" onclick="cancel()">关闭</button>
</div>
<br>
<div>
   <ul id="treeDemo" class="ztree"></ul>
</div>
</body>
<script type="text/javascript">
var setting = {
	    data: {
	        simpleData: {
	            enable: true,
	        }
	    },
	    check: {
			enable: false
		},
	    view: {
	       
	        showIcon: false
	    },
	    callback:{
	    	 onClick: zTreeOnLeftClick
        }
	};
	
$(document).ready(function () {
	var zNodes=[];
	$.ajax({
       	url:"${pageContext.request.contextPath }/sys/moveTree?id="+$('#id').val(),
       	data:{},
       	dataType:"json",
       	type:"POST",
       	success:function(data){
       		if(data.code==10000){
       			zNodes=data.data;
       		}else{
       			alert(data.msg);
       		}
       		openTree(zNodes);
       	},
       	error:function(){
       		alert("服务器忙");
       	},
       	
       });  
});
	
//初始化树	
function openTree(zNodes){
	var myTree = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
	myTree.expandAll(true);
}
function zTreeOnLeftClick(event, treeId, treeNode){
	$('#moveid').val(treeNode.id);
}	
function cancel(){
	//parent.location.reload();
	parent.layer.close(parent.layer.getFrameIndex(window.name));
}
function ensure(){
	if($('#moveid').val()==null||$('#moveid').val()==''){
		layer.msg('请选择要目标位置', {time: 1000});
		return;
	}
	layer.confirm('<span style="color:black">确定进行该操作吗？</span>', function(index){
		 $.ajax({
	      url:'${pageContext.request.contextPath }/common/domove?id='+$('#id').val()+'&moveid='+$('#moveid').val()+'&huanyuan='+$('#huanyuan').val(),
	      type:'POST',
	      dataType:'JSON',
	      data:{},
	      success:function(data){
	    	if(data.code==10000){
	    		layer.msg(data.message, {time: 1000});
	    		parent.location.reload();
	    		parent.layer.close(parent.layer.getFrameIndex(window.name));
	    		parent.refreshTree();
	    	}else{
	    		layer.msg(data.message, {time: 1000});
	    	}
	    	}
		});
	 })
}
</script>
</html>
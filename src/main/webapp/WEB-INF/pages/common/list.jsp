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

<script src="${pageContext.request.contextPath }/static/rightmenu/js/jquery.contextMenu.min.js"></script>
<script src="${pageContext.request.contextPath }/static/rightmenu/js/mouseRight.min.js" type="text/javascript" charset="utf-8"></script>

<style type="text/css">
/* RESET */
body{font-family:Tahoma,Helvetica,"\5b8b\4f53","Arial",sans-serif;font-size:12px;color:#fff;}
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,th,td{margin:0;padding:0}
input,button,textarea{border:none 0}
fieldset,img{border:0}
table{border-collapse:collapse;border-spacing:0}
ul,ol{list-style:none}
a:link{text-decoration:none}
a:visited{text-decoration:none}
a:hover{text-decoration:none}

.clear{zoom:1}
.clear:after{content:"";display:block;clear:both}
/* polaroids */
.polaroids{width:100%;margin:0 0 18px 10px;}
.polaroids li{display: inline;}
.polaroids a{background: #fff;display: inline;float:left;margin:0 0 27px 30px;width:auto;padding:10px 10px 15px;text-align: center;font-family: "Marker Felt", sans-serif;text-decoration: none;color:#333;font-size: 18px;
-webkit-box-shadow:0 3px 6px rgba(0,0,0,.25);
-moz-box-shadow:0 3px 6px rgba(0,0,0,.25);
-o-box-shadow:0 3px 6px rgba(0,0,0,.25);
box-shadow:0 3px 6px rgba(0,0,0,.25);
}
.polaroids img{display: block;width:190px;margin-bottom:12px;}
.polaroids a:after{content: attr(title);/* Ie8+,FF,Chorme,Safari */}
.polaroids li:nth-child(even) a{
	-webkit-transform:rotate(2deg);
	-moz-transform:rotate(2deg);
	-ms-transform:rotate(2deg);
	transform:rotate(2deg);
}
.polaroids li:nth-child(3n) a{
	-webkit-transform:none;
	-moz-transform:none;
	-ms-transform:rotate(2deg);
	transform:none;
	position: relative;
	top:-5px;
}
.polaroids li:nth-child(5n) a{
	-webkit-transform:rotate(5deg);
	-moz-transform:rotate(5deg);
	-ms-transform:rotate(5deg);
	transform:rotate(5deg);
	position: relative;
	right:5px;
}
.polaroids li:nth-child(8n) a{
	position: relative;
	top:8px;
	right:5px;
}
.polaroids li:nth-child(11n) a{
	position: relative;
	top:3px;
	right:-5px;
}
.polaroids li a:hover{
	-webkit-transform:scale(1.25);
	-moz-transform:scale(1.25);
	-ms-transform:scale(1.25);
	transform:scale(1.25);
	-webkit-box-shadow:0 3px 6px rgba(0,0,0,.5);
	-moz-box-shadow:0 3px 6px rgba(0,0,0,.5);
	-o-box-shadow:0 3px 6px rgba(0,0,0,.5);
	box-shadow:0 3px 6px rgba(0,0,0,.5);
	position: relative;
	z-index: 5;
}
.polaroids li.messy a{margin-top:-375px;margin-left:160px;
	-webkit-transform:rotate(-5deg);
	-moz-transform:rotate(-5deg);
	-ms-transform:rotate(-5deg);
	transform:rotate(-5deg);
}
</style>
</head>
<body id="mybody">
<input id="id" value="${id }" type="hidden">
<input id="nowid" name="sonid"  value="" type="hidden"><!-- 当前文件的id -->
<br>
<div class="layui-form-item">
    <div class="layui-input-block">
      <button type="button" class="layui-btn" onclick="fileupload()">上传</button>
      <button type="button" class="layui-btn" onclick="newfolder()">创建相册</button>
    </div>
  </div>

<br>
<ul class="polaroids" id="dataul" >
</ul>
</body>
<script type="text/javascript">
getDataLiu();
function getDataLiu(){
	var result='';
	$.ajax({
       	url:"${pageContext.request.contextPath }/teacher/list?id="+$('#id').val(),
       	data:{},
       	dataType:"json",
       	type:"POST",
       	success:function(data){
            if (data.code == 10000) {
                console.log(data);
                var liu = data.data;
                for(var i=0;i<liu.length;i++){
                	var img=liu[i].img;
                	if(liu[i].img==null){
                		img="${pageContext.request.contextPath }/static/images/notfound.jpg";
                	}
                	if(liu[i].folder==1){
                		result+='<li id="fileid'+liu[i].id+'" ondblclick="viewAndChecknode('+liu[i].id+')" onmouseover="setSonId('+liu[i].id+')" ><a href="#" title="'+liu[i].name+'"><img src="'+img+'" alt="Discussion" style="width: 300px;height:200px; "></a></li>';
                	}else{
                		result+='<li id="fileid'+liu[i].id+'" ondblclick="alert('+liu[i].id+')"  ><a href="#" title="'+liu[i].name+'"><img src="'+img+'" alt="Discussion" style="width: 300px;height:200px; "></a></li>';
                	}
                }
                $('#dataul').html(result);
            } else {
                layer.msg(data.message, {time: 1000});
            }
       	},
       	error:function(){
       		layer.msg(data.message, {time: 1000});
       	},
       	
       });
}
//双击相册，查看数据，并同时设置节点被选中
function viewAndChecknode(x){
	parent.checkLocalNode(x);//设置节点被选中
	var id=x;
	window.location.href="${pageContext.request.contextPath }/teacher/teacher_index?id="+id;	
}

function setSonId(x){
	$('#nowid').val(x);
}

function newfolder(){
	
}
</script>
</html>
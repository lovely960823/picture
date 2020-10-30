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

<!-- 右键菜单 -->
<script src="${pageContext.request.contextPath }/static/rightmenu/jquery.contextmenu.r2.js"></script>
<!-- 右键菜单 -->

<!-- 图片查看 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/picview/css/index.css">
<script src="${pageContext.request.contextPath }/static/picview/js/index.js"></script>
<script src="${pageContext.request.contextPath }/static/picview/js/jquery.rotate.min.js"></script>
<!-- 图片查看 -->
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
.polaroids{width:100%;margin:10px 0 18px 10px;padding: 30px 0 0 0;}
.polaroids li{display: inline;}
.polaroids a{background: #fff;display: inline;float:left;margin:0 0 27px 30px;width:auto;padding:10px 10px 15px;text-align: center;font-family: "Marker Felt", sans-serif;text-decoration: none;color:#333;font-size: 18px;
-webkit-box-shadow:0 3px 6px rgba(0,0,0,.25);
-moz-box-shadow:0 3px 6px rgba(0,0,0,.25);
-o-box-shadow:0 3px 6px rgba(0,0,0,.25);
box-shadow:0 3px 6px rgba(0,0,0,.25);
}
 .polaroids a.a1{
 background:transparent; 
 box-shadow: 11px 10px 6px #33333378; 
 border: 10px solid #ea8b59;
 padding: 0px;
}
 .polaroids a.a2{
	padding-top: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
    padding-right: 0;
    background-color: transparent;
    box-shadow: 0 0px 0px rgba(0,0,0,.25); 	
} 

.polaroids img{display: block;width:190px;margin-bottom:12px;}
.polaroids a:after{content: attr(title);/* Ie8+,FF,Chorme,Safari */}
.polaroids li:nth-child(even) a{
	-webkit-transform:rotate(2deg);
	-moz-transform:rotate(2deg);
	-ms-transform:rotate(2deg);
	transform:none;
}
.polaroids li:nth-child(3n) a{
	-webkit-transform:none;
	-moz-transform:none;
	-ms-transform:rotate(2deg);
	transform:none;
	position: relative;
	top:0px;
}
.polaroids li:nth-child(5n) a{
	-webkit-transform:rotate(5deg);
	-moz-transform:rotate(5deg);
	-ms-transform:rotate(5deg);
	transform:none;
	position: relative;
	right:5px;
}
.polaroids li:nth-child(8n) a{
	position: relative;
	top:0px;
	right:5px;
}
.polaroids li:nth-child(11n) a{
	position: relative;
	top:0px;
	right:-5px;
}
.polaroids li a.a1:hover{
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
#dataul li a{
padding-top: 0px;
padding-bottom: 0px;

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
 .xiaoshi{
 	display: none;
 }
 .myskin{
        background-color: transparent;/*背景透明*/
        box-shadow: 0 0 0 rgba(0,0,0,0);/*前景无阴影*/
} 
.ico .layui-layer-ico {
    background: url(/static/images/ic_cha1.png) no-repeat;
} 
.hh{word-break: break-all;}
.polaroids::-webkit-scrollbar{
    display: none;
}  
</style>
<!-- onload="setHeight();" onresize=" setHeight()" -->
</head>
<body onload="setHeight();" onresize=" setHeight()">
<input id="id" value="${id}" type="hidden"><!-- 这个id是当树前节点id，用来查找子节点数据的 -->
<input id="sonid" name="sonid"  value="" type="hidden"><!-- 当前文件的id -->
<input id="isfolder" name="isfolder"  value="" type="hidden">

<input type="hidden" class="xiaoshi" id="bzbtn"> <!-- 判断备注点击的 -->
<!-- 指示栏 -->
<div style="width:99%;height:36px;margin-top: 10px;border-bottom: 1px #f2e7da solid">
	<div  style="float:left;width:55%" >
	
		<h3 id="getheader" style="color: black;height: 26px;margin-left: 10px;">
			<a title="主页" href="javascript:void(0)" onclick="goHome()"> <img alt="" src="${pageContext.request.contextPath }/static/images/home.png" style="width: 23px;height: 23px;"> </a>&nbsp;  回收站
		</h3>
	</div>
	<div  style="float:right;width:13%">
	<span style="color: blue;font-size:14px">全选:</span>
	<input type="checkbox" name="checkbox1" onclick="checkAll()" id="Acheckbox">
	&nbsp;&nbsp;
	<button type="button" class="layui-btn" onclick="removePic()" style="background-color: #975233;border-radius: 10px;height: 26px;">删除</button>
	</div>
</div>

<!-- 相册数据展示 -->
<ul class="polaroids" id="dataul"  style="overflow-y:scroll;">
</ul>

<!-- 右键菜单 -->
<div class="contextMenu" id="myMenu1"><!-- 选择复制备注前的相册菜单 -->
  <ul>
    <li id="huanyuan">还原</li>
    <li id="realdel">删除</li>
  </ul>
</div>



</body>
<script type="text/javascript">

<!--设置页面根据窗口可以滚动-->
function setHeight()
{
     var max_height = document.documentElement.clientHeight-180;
     var primary = document.getElementById('dataul');
     primary.style.minHeight = max_height+"px";
     primary.style.maxHeight = max_height+"px";                                      
}

function goHome(){
	parent.parent.location.href="${pageContext.request.contextPath }/";
}

getDataLiu();
function getDataLiu(){
	//加载loding
    var loading = layer.load(0, {
        shade: false
    });
	var searchName = $('#searchName').val();
	var result='';
	$.ajax({
		url:"${pageContext.request.contextPath }/teacher/trash?searchName="+searchName,
       	data:{},
       	dataType:"json",
       	type:"POST",
       	success:function(data){
            if (data.code == 10000) {
                var liu = data.data;
                if(liu.length>0){
	                for(var i=0;i<liu.length;i++){
	                	var img=liu[i].img;
	                	if(liu[i].img==null){
	                		img="/static/images/notfound.jpg";
	                	}
	                	if(liu[i].folder==0){
	                		result+='<li onmouseover="setSonId('+liu[i].id+')" >'
	                		+'<a href="#" class="a2 a3" onclick="check('+liu[i].id+')" style="width:220px;height:257px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;" title="'+liu[i].name+'">'
	                		+'<div class="checkbox" style="z-index: 100;position: absolute;">'
	                		+'<input type="checkbox" name="checkbox" onclick="check('+liu[i].id+')" id="checkbox'+liu[i].id+'" value="'+liu[i].id+'">'
	                		+'</div>'
	                		+'<img src="'+img+'" style="object-fit: cover;width:198px;height:198px;" ></a></li>';
	                	}else if(liu[i].folder==3){
	                		var img=liu[i].url;
	                		if(img==null){
	                			img="/static/images/ic_morenshjipin.png";
	                		}
	                		result+='<li onmouseover="setSonId('+liu[i].id+')" >'
	                		+'<a href="#" class="a2 a3" onclick="check('+liu[i].id+')" style="width:220px;height:257px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;" title="'+liu[i].name+'">'
	                		+'<div class="checkbox" style="z-index: 100;position: absolute;">'
	                		+'<input type="checkbox" name="checkbox" onclick="check('+liu[i].id+')" id="checkbox'+liu[i].id+'" value="'+liu[i].id+'">'
	                		+'</div>'
	                		+'<img  src="'+img+'" style="object-fit: cover;width:198px;height:198px;" ></a></li>';
	                	}
	                }
	                $('#dataul').html(result);
                }else{
                	layer.msg('暂无数据', {time: 1000});
                }
              //关闭加载loding
	           layer.close(loading);
            } else {
                layer.msg(data.message, {time: 1000});
            }
       	},
       	error:function(){
       		layer.msg(data.message, {time: 1000});
       	},
       	
       });
}

function setSonId(x){
	$('#sonid').val(x);
	//右键菜单
	//所有class为demo1的span标签都会绑定此右键菜单
	  $('.a2').contextMenu('myMenu1', 
	  {
	       bindings: 
	       {
	         'huanyuan': function(t) {
	           huanyuan();
	         },
	         'realdel': function(t) {
		           realdel();
		         }
	    
	       }
	 });
}

function huanyuan(){
	layer.open({
        type: 2,
        skin: 'layui-layer-demo', //样式类名
        title: ['还原到','color:white;background-color: #18A689;'],
        closeBtn: 1, //显示关闭按钮
        anim: 2,
        area: ['900px', '600px'],
        shadeClose: true, //开启遮罩关闭
        content: '${pageContext.request.contextPath }/common/moveto?id='+$('#sonid').val()+'&huanyuan=1'
    });
}

function realdel(){
	layer.confirm('<span style="color:black">确认是否要彻底删除</span>', function(index){
		$.ajax({
		      url:'${pageContext.request.contextPath }/common/realdel?id='+$('#sonid').val(),
		      type:'POST',
		      dataType:'JSON',
		      data:{},
		      success:function(data){
		    	if(data.code==10000){
		    		layer.msg(data.message, {time: 1000});
		    		window.location.reload();
		    	}else{
		    		layer.msg(data.message, {time: 1000});
		    	}
		    	}
			});
	})
}

function check(picId){
	var checkbox = $("#checkbox"+picId);
	if(!checkbox[0].checked){
		checkbox[0].checked=true;
	}else{
		checkbox[0].checked=false;
	}
	var checkboxAll = document.getElementsByName("checkbox");
	var Acheckbox = $("#Acheckbox");
	for(var i=0;i<checkboxAll.length;i++){
		if(!checkboxAll[i].checked){
			Acheckbox[0].checked=false;
			return;
		}else{
			Acheckbox[0].checked=true;
		}
	}
}

function checkAll(){
	var checkbox = $("#Acheckbox");
	var checkboxAll = document.getElementsByName("checkbox");
	if(checkbox[0].checked){
		for(var i=0;i<checkboxAll.length;i++){
			checkboxAll[i].checked=true;
		}
	}else{
		for(var i=0;i<checkboxAll.length;i++){
			checkboxAll[i].checked=false;
		}
	}
}

function getPicId(){
	var checkbox = document.getElementsByName("checkbox");
	var arry = [];
	for(var i=0;i<checkbox.length;i++){
		if(checkbox[i].checked){
			arry.push(checkbox[i].value)
		}
	}
	return arry;
}

function removePic(){
	var picId = getPicId();
	if(picId.length<1){
		layer.msg("至少选择一条数据");
		return;
	}
	var id = picId.join(",")
		layer.confirm('<span style="color:black">确认是否要彻底删除</span>', function(index){
		$.ajax({
		      url:'${pageContext.request.contextPath }/common/realdel?id='+id,
		      type:'POST',
		      dataType:'JSON',
		      data:{},
		      success:function(data){
		    	if(data.code==10000){
		    		layer.msg(data.message, {time: 1000});
		    		window.location.reload();
		    	}else{
		    		layer.msg(data.message, {time: 1000});
		    	}
		    	}
			});
	})
}

//阻止默认右键菜单
document.oncontextmenu = function (event) {
    event.preventDefault();
};
</script>
</html>
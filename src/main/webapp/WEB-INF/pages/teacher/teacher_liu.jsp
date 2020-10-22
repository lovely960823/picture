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
body{font-family:Tahoma,Helvetica,"\5b8b\4f53","Arial",sans-serif;font-size:12px;color:#000;}
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
/* -webkit-box-shadow:0 3px 6px rgba(0,0,0,.25);
-moz-box-shadow:0 3px 6px rgba(0,0,0,.25);
-o-box-shadow:0 3px 6px rgba(0,0,0,.25);
box-shadow:0 3px 6px rgba(0,0,0,.25); */
}
 .polaroids a.a1{
 background:transparent; 
 box-shadow: 11px 10px 6px #33333378; 
 border: 3px solid #ea8b59;
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
	-webkit-transform:scale(1.05);
	-moz-transform:scale(1.05);
	-ms-transform:scale(1.05);
	transform:scale(1.05);
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
#dataul .layui-flow-more {
    margin: 10px 0;
    text-align: center;
    color: #999;
    font-size: 14px;
    position: fixed;
    bottom: 120px;
    right: 50%;
    height: 50px;
    display:none;
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
			<a title="主页" href="javascript:void(0)" onclick="goHome()"> <img alt="" src="${pageContext.request.contextPath }/static/images/home.png" style="width: 23px;height: 23px;"> </a>&nbsp;  ${getHeader }
		</h3>
	</div>

	<div  style="float:left;width:20%">
		<input type="text" name="searchName" id="searchName" value="${searchName }" autocomplete="off" class="layui-input" style="background-color: #F6EADE;  border-radius: 15px;height: 26px;">
	</div>
	<div  style="float:left;width:25%">
		<button type="button" class="layui-btn" id="test2" style="background-color: #975233;border-radius: 10px;height: 26px;">上传图片</button>
		<button type="button" class="layui-btn" id="sp" style="background-color: #975233;border-radius: 10px;height: 26px;">上传视频</button>
  		<button type="button" class="layui-btn" onclick="newfolder()" style="background-color: #975233;border-radius: 10px;height: 26px;">新建相册</button>
  		<!-- <button type="button" class="layui-btn" onclick="newVideo()" style="background-color: #975233;border-radius: 10px;height: 26px;">新建视频</button> -->
	</div>
</div>

<!-- 相册数据展示 -->
<ul class="polaroids" id="dataul"  style="overflow-y:scroll;">
</ul>

<!-- 右键菜单 -->
<div class="contextMenu" id="myMenu1"><!-- 选择复制备注前的相册菜单 -->
  <ul>
    <li id="bofang">播放</li>
    <!-- <li id="bofang2">播放2</li> -->
    <li id="edit">编辑</li>
    <li id="del">删除</li>
    <li id="move">移动到</li>
    <!-- <li id="download">下载</li> -->
    <li id="beizhu">备注</li>
    <li id="copy">复制备注</li>
  </ul>
</div>

<div class="contextMenu" id="myMenu3"><!-- 选择复制备注后的相册菜单 -->
  <ul>
    <li id="bofang">播放</li>
    <!-- <li id="bofang2">播放2</li> -->
    <li id="edit">编辑</li>
    <li id="del">删除</li>
    <li id="move">移动到</li>
    <!-- <li id="download">下载</li> -->
    <li id="beizhu">备注</li>
    <li id="copy">复制备注</li>
    <li id="paste">粘贴备注</li>
  </ul>
</div>

<div class="contextMenu" id="myMenu2"><!-- 选择复制备注前的照片菜单 -->
  <ul>
    <li id="edit1">编辑</li>
    <li id="del">删除</li>
    <li id="move">移动到</li>
    <li id="download">下载</li>
    <li id="beizhu">备注</li>
    <li id="copy">复制备注</li>
  </ul>
</div>

<div class="contextMenu" id="myMenu4"><!-- 选择复制备注后的照片菜单 -->
  <ul>
    <li id="edit1">编辑</li>
    <li id="del">删除</li>
    <li id="move">移动到</li>
    <li id="download">下载</li>
    <li id="beizhu">备注</li>
    <li id="copy">复制备注</li>
    <li id="paste">粘贴备注</li>
  </ul>
</div>

<!-- 图片查看  不用异步是因为避免每次点击都要加载数据-->
 <ul class="picView-magnify-list" style="padding: 30px;display:none " >
    <!-- <li>
        <a href="javascript:void(0)" data-magnify="gallery" data-group="g1" data-src="" data-caption="测试图片一" id="testpic">
            <img src="" id="testimg">
        </a>
    </li> -->
    <c:forEach items="${findViewPic }" var="list">
	    <li>
	        <a href="javascript:void(0)" data-magnify="gallery" data-group="g1" data-src="${list.img }" data-caption="${list.id }" data-picid="${list.id }" id="pic${list.id }" >
	            <img src="${list.img } ">
	        </a>
	    </li>
    </c:forEach>
</ul>


</body>
<script type="text/javascript">
function getDataLiu(){
	$('#dataul').html('');//删除后重新渲染数据
	//加载loding
    var loading = layer.load(0, {
        shade: false
    });
	var searchName = $('#searchName').val();
    layui.use('flow', function(){
  	  var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
  	  var flow = layui.flow;
  	 flow.lazyimg(); //当你执行这样一个方法时，即对页面中的全部带有lay-src的img元素开启了懒加载（当然你也可以指定相关img）
  	  flow.load({
  	    elem: '#dataul' //指定列表容器
  	    ,scrollElem :'#dataul' //指定容器滚动加载
  	    ,isLazyimg  : true
  	    ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
  	    	console.log(page);
  	      var lis = [];
  	      //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
  	      $.get('${pageContext.request.contextPath }/teacher/list?id='+$('#id').val()+'&searchName='+searchName+'&page='+page, function(res){
  	    	 var loading = layer.load(0, {
  	           shade: false
  	       });
  	    	 console.log(res);
  	    	 var pages = Math.ceil(res.data.total/res.data.pageSize); 
  	        //假设你的列表返回在data集合中
  	        layui.each(res.data.list, function(index, item){
  	          //lis.push('<li ><img src="'+item.img+'" style="width:200px;" /></li>');
  	        	var img=item.img;
  	        	if(item.img==null){
  	        			img="/static/images/notfound.jpg";
            	}
  	      	if(item.folder==1){
  	      	lis.push('<div id="'+item.id+'" style="width: 16%;float: left;padding:0 10px 0 0;" onclick="openbz()" ondblclick="viewAndChecknode('+item.id+')" ondragover="allowDrop(event)" ondrop="drop(event)" onmouseover="setSonId('+item.id+','+item.folder+')" >'
        		+'<a href="#" class="a3" style="width:200px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden; background: url(/static/images/ic_xiangce.png);background-size: cover;height: 198px;" title="'+item.name+' '+"("+item.counts+")"+'  " >'
        		+'<img src="'+img+'" alt="" style="width: 70px;margin-left: 67px;margin-top: 51px;"></a></div>');
        	}else if(item.folder==0){
        		lis.push('<div id="'+item.id+'" style="width: 16%;float: left;padding:0 10px 0 0;" onclick="openbz()" ondragstart="drag(event)"  ondblclick="viewPic1('+item.id+')" onmouseover="setSonId('+item.id+','+item.folder+')" >'
        		+'<a href="#" class="a2 a3" style="width:220px;height:257px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;" title="'+item.name+'">'
        		+'<img lay-src="'+img+'" style="object-fit: cover;width:198px;height:198px;" ></a></div>');
        	}else if(item.folder==3){
        		var img=item.url;
        		if(img==null){
        			img="/static/images/ic_morenshjipin.png";
        		}
        		var aId = "fas"+index;
        		lis.push('<div id="'+item.id+'" style="width: 16%;float: left;padding:0 10px 0 0;" onmouseover="setSonId('+item.id+','+item.folder+')" >'
        		+'<a href="#" class="a2 a3" style="width:220px;height:257px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;" onclick="play1('+item.id+')" title="'+item.name+'">'
        		+'<img id="'+aId+'" src="/static/images/ic_bofang.png" onmouseover="imgOverSrc('+aId+')" onmouseout="imgOutSrc('+aId+')" style="object-fit: cover;width:198px;height:198px;background:url('+img+');background-size: cover"" ></a></div>');
        	}
  	        	
  	        }); 
  	        //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
  	        //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
  	        next(lis.join(''), page < pages);
  	      //关闭加载loding
	      layer.close(loading);
  	      });
  	    }
  	  });
  	});
}

layui.use('upload', function(){
	  var $ = layui.jquery
	  ,upload = layui.upload;
	//多图片上传
	  upload.render({
	    elem: '#test2'
	    ,url: '${pageContext.request.contextPath }/common/uploadFile?id='+$('#id').val() //改成您自己的上传接口
	    ,multiple: true
	  /*   ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" style="width: 150px;height: 150px;" class="layui-upload-img">')
	      });
	    } */
	    ,done: function(res){
	      //上传完毕
	    	layer.msg('<span style="color:#000">上传成功</span>', {icon: 6}); 
	      	window.parent.iframe($('#id').val());
	    }
	  });
		var index = layer.load(2);
		upload.render({
		    elem: '#sp'
		    ,url: '${pageContext.request.contextPath }/upload?id='+$('#id').val() //改成您自己的上传接口
		    ,multiple: true
		    ,accept:'video'
		    ,done: function(res){
		      //上传完毕
		    	layer.msg('<span style="color:#000">上传成功</span>', {icon: 6}); 
		      	window.parent.iframe($('#id').val());
		      	layer.close(index);
		    }
		  });
	  
	})
<!--设置页面根据窗口可以滚动-->
function setHeight()
{
     var max_height = document.documentElement.clientHeight-180;
     var primary = document.getElementById('dataul');
     primary.style.minHeight = max_height+"px";
     primary.style.maxHeight = max_height+"px";                                      
}

function goHome(){
	//window.open("${pageContext.request.contextPath }/");
	parent.parent.location.href="${pageContext.request.contextPath }/";
}
function newfolder(){
	parent.layer.open({
        type: 2,
        skin: 'layui-layer-demo', //样式类名
        title: ['创建相册','color:white;background-color: #18A689;'],
        closeBtn: 1, //不显示关闭按钮
        anim: 2,
        area: ['578px', '670px'],
        shadeClose: true, //开启遮罩关闭
        content: '${pageContext.request.contextPath }/common/tonewfolder?id='+$('#id').val()
    });
}

function upload(){
	layer.open({
        type: 2,
        skin: 'layui-layer-demo', //样式类名
        title: ['上传图片','color:white;background-color: #18A689;'],
        closeBtn: 1, //不显示关闭按钮
        anim: 2,
        area: ['800px', '600px'],
        shadeClose: true, //开启遮罩关闭
        content: '${pageContext.request.contextPath }/common/touploadFile?id='+$('#id').val()
    });
}

/* function getDataLiu(){
	//加载loding
    var loading = layer.load(0, {
        shade: false
    });
	var searchName = $('#searchName').val();
	var result='';
	$.ajax({
       	url:"${pageContext.request.contextPath }/teacher/list?id="+$('#id').val()+'&searchName='+searchName,
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
	                	if(liu[i].folder==1){
	                		result+='<li id="'+liu[i].id+'" onclick="openbz()" onclick="beizhu()" ondblclick="viewAndChecknode('+liu[i].id+')" ondragover="allowDrop(event)" ondrop="drop(event)" onmouseover="setSonId('+liu[i].id+','+liu[i].folder+')" >'
	                		+'<a href="#" class="a1 a3" style="width:200px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;" title="'+liu[i].name+' '+"("+liu[i].counts+")"+'  " >'
	                		+'<img src="'+img+'" alt="Discussion" style="width: 198px;height:198px;"></a></li>';
	                	}else if(liu[i].folder==0){
	                		result+='<li id="'+liu[i].id+'" onclick="openbz()" onclick="beizhu()" ondragstart="drag(event)"  ondblclick="viewPic1('+liu[i].id+')" onmouseover="setSonId('+liu[i].id+','+liu[i].folder+')" >'
	                		+'<a href="#" class="a2 a3" style="width:220px;height:257px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;" title="'+liu[i].name+'">'
	                		+'<img src="'+img+'" style="object-fit: cover;width:198px;height:198px;" ></a></li>';
	                	}else if(liu[i].folder==3){
	                		var img=liu[i].url;
	                		if(img==null){
	                			img="/static/images/ic_morenshjipin.png";
	                		}
	                		var aId = "fas"+i;
	                		result+='<li id="'+liu[i].id+'" onclick="play1('+liu[i].id+')"  onmouseover="setSonId('+liu[i].id+','+liu[i].folder+')" >'
	                		+'<a href="#" class="a2 a3" style="width:220px;height:257px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;" title="'+liu[i].name+'">'
	                		+'<img id="'+aId+'" src="/static/images/ic_bofang.png" onmouseover="imgOverSrc('+aId+')" onmouseout="imgOutSrc('+aId+')" style="object-fit: cover;width:198px;height:198px;background:url('+img+');background-size: cover"" ></a></li>';
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
} */
//双击相册，查看数据，并同时设置节点被选中
function viewAndChecknode(x){
	parent.checkLocalNode(x);//设置节点被选中
	var id=x;
	window.location.href="${pageContext.request.contextPath }/teacher/liu/fileList?id="+id;	
}
function imgOverSrc(img){
	img.src='/static/images/ic_bofangjh.png';
}
function imgOutSrc(img){
	img.src='/static/images/ic_bofang.png';
}
//双击查看图片
function viewPic1(x){
	$("#pic"+x).trigger("click");
}
//搜索
$('#searchName').bind('keypress', function (event) {
	if(event.keyCode == '13'){  //输入框绑定回车事件
		if($('#searchName').val()==null||$('#searchName').val()==''){
			return ;
		}else{
			$('#dataul').html('');//搜索后重新渲染数据
			getDataLiu();
		}
	}
});

function setSonId(x,y){
	var session;
$.ajax({
      url:'${pageContext.request.contextPath }/common/sessionisvaild',
      type:'POST',
      dataType:'JSON',
      async:false,
      data:{},
      success:function(data){
    	  session=data.data;
      }
	});
	$('#sonid').val(x);
	$('#isfolder').val(y);
	var isfolder = $('#isfolder').val();
	var myselect= 'myMenu1';//默认为1  (文件夹)
	if(isfolder==1){
		if(session==null||session==''){
			myselect = 'myMenu1';
		}else{
			myselect = 'myMenu3';
		}
	}else{
		if(session==null||session==''){
			myselect = 'myMenu2';
		}else{
			myselect = 'myMenu4';
		}
		
	}
//右键菜单
//所有class为demo1的span标签都会绑定此右键菜单
  $('.a3').contextMenu(myselect, 
  {
       bindings: 
       {
         'bofang': function(t) {
           bofang(1);
         },
         'bofang2': function(t) {
             bofang(2);
           },
         'edit': function(t) {
           toedit();
         },
         'edit1': function(t) {
             toedit1();
           },
         'move': function(t) {
           moveto();
         },
         'del': function(t) {
           delData();
         },
         'download': function(t) {
             download();
           },
         'beizhu': function(t) {
             beizhu();
           },
         'copy': function(t) {
            	copy();
           },
         'paste': function(t) {
           	paste();
          }
       }
 });
}

//文件删除操作
function delData(){
	var id = $('#sonid').val();//获取到当前要操作的id值
	layer.confirm('<span style="color:black">确定删除吗？</span>', function(index){
		 $.ajax({
	      url:'${pageContext.request.contextPath }/common/delfile?id='+id,
	      type:'POST',
	      dataType:'JSON',
	      data:{},
	      success:function(data){
	    	if(data.code==10000){
	    		layer.msg(data.message, {time: 1000});
	    		getDataLiu();
	    		//refreshTree();
	    		//如果删除文件夹则刷新Ztree 否则不刷新
	    		if(data.data!=null){
	    			if(data.data.folder==1){
	    				refreshTree();
	    			}
	    		}
	    	}else{
	    		layer.msg(data.message, {time: 1000});
	    	}
	    	}
		});
	 })
}
//图片下载
function download(){
	var id = $('#sonid').val();//获取到当前要操作的id值
	window.location.href="${pageContext.request.contextPath }/common/download?id="+id;
}

//移动文件
function moveto(){
	layer.open({
        type: 2,
        skin: 'layui-layer-demo', //样式类名
        title: ['移动到','color:white;background-color: #18A689;'],
        closeBtn: 1, //不显示关闭按钮
        anim: 2,
        area: ['40%', '60%'],
        shadeClose: true, //开启遮罩关闭
        content: '${pageContext.request.contextPath }/common/moveto?id='+$('#sonid').val()
    });
}
//播放图片
function bofang(type){
	parent.layer.open({
        type: 2,
        skin: 'myskin', //样式类名
        title: false,
        closeBtn: 1, //不显示关闭按钮
        anim: 2,
        area: ['90%', '80%'],
        shadeClose: true, //开启遮罩关闭
        content: '${pageContext.request.contextPath }/common/bofang?id='+$('#sonid').val()+'&type='+type
    });
}
//修改相册页面
function toedit(){
	parent.layer.open({
        type: 2,
        skin: 'layui-layer-demo', //样式类名
        closeBtn: 1, //不显示关闭按钮
        anim: 2,
        area: ['578px', '670px'],
        shadeClose: true, //开启遮罩关闭
        content: '${pageContext.request.contextPath }/common/toupdatefolder?id='+$('#sonid').val()
    });
}
function toedit1(){
	layer.open({
        type: 2,
        skin: 'layui-layer-demo', //样式类名
        title: ['修改','color:white;background-color: #18A689;'],
        closeBtn: 1, //不显示关闭按钮
        anim: 2,
        area: ['30%', '30%'],
        shadeClose: true, //开启遮罩关闭
        content: '${pageContext.request.contextPath }/common/toedit1?id='+$('#sonid').val()
    });
}

//图片查看插件
$(function () {
	getDataLiu();
    $('[data-magnify]').Magnify({
        Toolbar: [
            'prev',
            'next',
            'rotateLeft',
            'rotateRight',
            'zoomIn',
            'actualSize',
            'zoomOut'
        ],
        keyboard:true,
        draggable:true,
        movable:true,
        modalSize:[800,600],
        beforeOpen:function (obj,data) {
        },
        opened:function (obj,data) {
        },
        beforeClose:function (obj,data) {
        },
        closed:function (obj,data) {
        },
        beforeChange:function (obj,data) {
        },
        changed:function (obj,data) {
        }
    });
    
})
//右键菜单打开备注
function beizhu(){
	layer.closeAll();
	$('#bzbtn').removeClass('xiaoshi');
	 layer.open({
	  title: '备注'
	  ,type:2
	  ,area: ['700px', '430px']
	  ,anim: 2
	  ,move: false
	  ,content: '${pageContext.request.contextPath }/common/toBeizhu?id='+$('#sonid').val()
	  ,offset: ['40%','0%','0px','0px;']//显示位置
	  ,shade: 0 //不显示遮罩
	  ,skin:"ico"
	  ,cancel: function(index, layero){ 
		layer.closeAll();
		 $('#bzbtn').addClass('xiaoshi');
		}    
	});  
}
//通过点击方式打开备注
function openbz(){
	layer.closeAll();
	var is= $('#bzbtn').hasClass('xiaoshi');
	if(is===false){
		layer.open({
			  title: '备注'
			  ,type:2
			  ,area: ['700px', '430px']
			  ,anim: 2
			  ,content: '${pageContext.request.contextPath }/common/toBeizhu?id='+$('#sonid').val()
			  ,offset: ['40%','0%','0px','0px;']//显示位置
			  ,shade: 0 //不显示遮罩
			  ,skin:"ico"
			  ,cancel: function(index, layero){ 
				layer.closeAll();
				 $('#bzbtn').addClass('xiaoshi');
				}    
			});
	}
}
function play1(id){
		parent.layer.open({
			  title: false
			  ,type:2
			  ,area: ['700px', '500px']
			  ,anim: 2
			  ,skin:"myskin"
			  ,content: '${pageContext.request.contextPath }/common/player?id='+id
			  ,cancel: function(index, layero){ 
				layer.closeAll();
				}    
			});
}

//复制备注
function copy(){
 $.ajax({
      url:'${pageContext.request.contextPath }/common/copy?id='+$('#sonid').val(),
      type:'POST',
      dataType:'JSON',
      data:{},
      success:function(data){
    	if(data.code==10000){
    		layer.msg("复制成功", {time: 1000});
    	}else{
    		layer.msg(data.message, {time: 1000});
    	}
    	}
	});
}
//粘贴备注
function paste(){
	var folder = $('#isfolder').val();
	var msg;
	if(folder==1){
		msg="该备注将粘贴到相册里所有的照片中。是否确定粘贴？";
	}else{
		msg="该备注将粘贴到照片中。是否确定粘贴？";
	}
	var id = $('#sonid').val();//获取到当前要操作的id值
	layer.confirm('<span style="color:black">'+msg+'</span>', function(index){
		 $.ajax({
	      url:'${pageContext.request.contextPath }/common/paste?id='+id,
	      type:'POST',
	      dataType:'JSON',
	      data:{},
	      success:function(data){
	    	if(data.code==10000){
	    		layer.msg(data.message, {time: 1000});
	    	}else{
	    		layer.msg(data.message, {time: 1000});
	    	}
	    	}
		});
	 })
}

/**
 * 刷新树节点
 */
function refreshTree(ids){
	var id = $('#id').val();
	parent.loadTree(id);
}

//给layer.open添加esc事件 
$('body',document).on('keyup', function (e) {
    if (e.which === 27) {
        layer.closeAll();
        $('#bzbtn').addClass('xiaoshi');
        $('.magnify-btn-close').trigger("click");
    }
});
function drag(ev){
	var id = ev.currentTarget.id;
	ev.dataTransfer.setData("sourceId",id);
}

  function drop(ev){
	  ev.preventDefault();
	  var targetId = ev.currentTarget.id;
	  var sourceId=ev.dataTransfer.getData("sourceId");
	  if(sourceId!=null&&sourceId!=""){
		  $.ajax({
		      url:'${pageContext.request.contextPath }/common/domove?id='+sourceId+'&moveid='+targetId,
		      type:'POST',
		      dataType:'JSON',
		      data:{},
		      success:function(data){
		    	if(data.code==10000){
		    		layer.msg(data.message, {time: 1000});
		    		getDataLiu();
		    	}else{
		    		layer.msg(data.message, {time: 1000});
		    	}
		    	}
			});
	  }
  }
  function allowDrop(ev){
  	ev.preventDefault();
  }
//阻止默认右键菜单
document.oncontextmenu = function (event) {
    event.preventDefault();
};
</script>
</html>
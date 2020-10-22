<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;">
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="${pageContext.request.contextPath }/static/jquery/jquery-1.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js" charset="utf-8"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/ztree/css/zTreeStyle/zTreeStyle.min.css">
<script src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.all.js" charset="utf-8"></script>

<script src="${pageContext.request.contextPath }/static/easyui/easyuidemo/jquery.easyui.min.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/easyui/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/easyui/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/easyui/easyuidemo/demo.css">

<script src="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/layui.all.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/css/layui.css">
<!--隐藏左边的横杠-->
<style type="text/css">
  	#left1::-webkit-scrollbar{display: none;}
  	.layout-panel-east, .layout-panel-west {
    z-index: 2;
    bottom: 20px;
}
 .panel {
    bottom: 20px;
    margin-left: 20px;
    margin-top: 120px;
} 
/* .layout {
    position: relative;
    overflow: hidden;
    margin: 0 0 0 -30px;
    padding: 0;
    z-index: 0;
} */
/* #orgTree{
overflow-x: auto;
    height: 80% !important;
} */
#right{
width: 98% !important;
}
.ztree * {font-size: 13pt;font-family:"Microsoft Yahei",Verdana,Simsun,"Segoe UI Web Light","Segoe UI Light","Segoe UI Web Regular","Segoe UI","Segoe UI Symbol","Helvetica Neue",Arial}
.ztree li {
    padding: 0;
    margin: 4px;
    list-style: none;
    line-height: 14px;
    text-align: left;
    white-space: nowrap;
    outline: 0;
}
@media (max-width: 1440px) {
      #orgTree{
        height:85% !important;
      }
    }
@media (max-width: 1920px) {
      #orgTree{
        height:83% !important;
      }
    }
.ico .layui-layer-ico {
    background: url(/static/images/ic_cha1.png) no-repeat;
} 
 .myskin{
        background-color: transparent;/*背景透明*/
        box-shadow: 0 0 0 rgba(0,0,0,0);/*前景无阴影*/
} 
</style>
</head>
<body style="height: 98%;background: url(${pageContext.request.contextPath }${m.img});background-size: cover;">
<input id="id" value="${id }" type="hidden">
<div class="easyui-layout" fit="true" style="width:100%;">
    <div id="left1" data-options="region:'west',split:true" title="相册目录" style="width:200px;overflow: auto;border-right: 1px solid #b3b3b3;">
        <div id="orgTree" class="ztree" style="overflow-x: auto;height: 100%;"></div>
    </div>
    <div id="right"data-options="region:'center'"region="center"  class="easyui-panel">
        <iframe id="iframe0" class="body-iframe" name="iframe0" width="100%" height="100%"
                src="${url }" frameborder="0" data-id="home.html" seamless scrolling="no" ></iframe>
    </div>
</div>
</body>
<script type="text/javascript">
function toPage(id){
	window.location.href="${pageContext.request.contextPath }/teacher/which/"+id;
}
var checkedNodeId = $('#id').val();
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
	       
	        showIcon: true,
	        addDiyDom:addDiyDom
	    },
	    callback:{
	    	 onClick: zTreeOnLeftClick
        }
	};
loadTree(checkedNodeId);
function loadTree(checkedNodeId){
	debugger;
	var zNodes=[];
	$.ajax({
       	url:"${pageContext.request.contextPath }/sys/menu?id="+$('#id').val(),
       	data:{},
       	dataType:"json",
       	type:"POST",
       	success:function(data){
       		if(data.code==10000){
       			zNodes=data.data;
       		}else{
       			alert(data.msg);
       		}
       		openTree(zNodes,checkedNodeId);
       	},
       	error:function(){
       		alert("服务器忙");
       	},
       	
       });  	
}	

	
//初始化树	
function openTree(zNodes,checkedNodeId){
	var myTree = $.fn.zTree.init($("#orgTree"), setting, zNodes);
	myTree.expandAll(true);
	$(".body-iframe").attr("src", "${pageContext.request.contextPath }/teacher/liu/fileList?id="+checkedNodeId);
	checkLocalNode(checkedNodeId);
	
	//当出现Ztree页面的时候背景图发生改变
 	var skinpng = '${m.img}';
 	var skin = skinpng.split(".")[0];
 	skin=skin+'1.png'
 	$('body').css("background","url('"+${pageContext.request.contextPath }skin+"')");
}

//鼠标左击显示右边页面
 function zTreeOnLeftClick(event, treeId, treeNode) {
        iframe(treeNode.id)
    };
  function iframe(id) {
	 	var url='${pageContext.request.contextPath }/teacher/liu/fileList?id='+id
      $(".body-iframe").attr("src", url);
  }
 function clopen(id) {
     if(id==1){
         $("#left1").parent().css("display","none");
         $("#left2").css("display","block");

         $("#right").parent().offset({"left":30});
         $("#right").parent().width($("#right").parent().width()+170);
         $("#right").width($("#right").width()+170);
     }else {
         $("#left1").parent().css("display","block");
         $("#left2").css("display","none");

         $("#right").parent().offset({"left":199});
         $("#right").parent().width($("#right").parent().width()-170);
         $("#right").width($("#right").width()-170);
     }
 }
 
 //设置该节点被选中
 function checkLocalNode(x){
	 zTree = $.fn.zTree.getZTreeObj("orgTree");//treeDemo界面中加载ztree的div
	 var node = zTree.getNodeByParam("id",x );
	 zTree.cancelSelectedNode();//先取消所有的选中状态
	 zTree.selectNode(node,true);//将指定ID的节点选中
	 zTree.expandNode(node, true, false);//将指定ID节点展开
 }
 
 function addDiyDom(treeId, treeNode) {
	 if(!treeNode.children){
		 var switchObj = $("#" + treeNode.tId + "_switch");
		/*  switchObj.remove();
		 var spaceWidth =3;
	     icoObj = $("#" + treeNode.tId + "_ico");
	     var spaceStr = "<span id='"+ treeNode.tId +"_switch' title='' class='level"+treeNode.level+" switch center_docu' treenode_switch></span>";
	     icoObj.before(spaceStr );  */

	 }
	
 }	 	 

 function reLiuList(){
	 $("#iframe0")[0].contentWindow.getDataLiu();
 }

</script>
</html>
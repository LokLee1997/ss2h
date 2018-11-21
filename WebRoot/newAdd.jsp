<%@ page language="java" import="java.util.*,action.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1"> 
    
     <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
     <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script type="text/javascript" src="ueditor/ueditor.config.js"></script>
   <script type="text/javascript" src="ueditor/ueditor.all.js"></script>
   <script type="text/javascript" src="ueditor/lang/zh-cn/zh-cn.js"></script>
   <script type="text/javascript">
   	var ue=UE.getEditor("content");
   </script>
    <script type="text/javascript">
    	$(document).ready(function() {
            $.ajax({
				type:'post',
				url:"categoryJsonAction_getcategorys.action",
				dataType:"json",
				success: function(data){
					var data2 = eval(data);
					for(var i in data2){
					 $("#category").append("<option value='"+data2[i].id+"'>"+data2[i].categoryName+"</option>");
						}
					}
				})
    });
    </script>
  </head>
  
  <body>
  <div class="container">
    <h3>发布新闻</h3>
   <form action="addNew.action" method="post" id="newUpdateForm" class="form-horizontal">
   	  <div class="form-group">
      	<label for="title" class="control-label col-md-2">标题</label>
      	<div class="col-md-6">
        	<input type="text" name="title" id="title" class="form-control">
      	</div>
      </div>
      <div class="form-group">
        <label for="category" class="control-label col-md-2">类型</label>
      		<div class="col-md-3">
            <select name="cid" id="category" class="form-control">
      		</select>
        </div>
      </div>
      <div class="form-group">
      	<label for="content" class="control-label col-md-2">内容</label>
      	<div  class="col-md-6">
      		<textarea name="content" id="content" rows="10"></textarea>
      	</div>
      </div>
      <div class="form-group">
      	<div class=" col-md-2 col-md-offset-2">
      		<input type="submit" value="更新" class="btn btn-default"/>
            <input type="reset" value="重置" class="btn btn-default"/>
        </div>
      </div>
   
   </form>
   </div>
  </body>
</html>

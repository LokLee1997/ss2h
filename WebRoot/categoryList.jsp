<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
    
    <title>My JSP 'categoryAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
   	<script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
			
            $.ajax({
				type:'post',
				url:"categoryJsonAction_getcategorys.action",
				dataType:"json",
				success: function(data){
					var data2 = eval(data);
					for(var i in data2){
					 $("#table").append("<tr><td>"+data2[i].id+"</td><td>"+
					 data2[i].categoryName+"</td><td><a href='updateCategory.action?cid="+data2[i].id+"'>修改</a>&nbsp;&nbsp;&nbsp;<a href='deleteCategory.action?cid="+data2[i].id+"'>删除</a>");
					 if(i==null||i==""){
						 $("#table").append("还没有加任何内容!");
						 }
						}
					}
				})
        });
    </script>
  </head>
  
  <body>
    <h3>查看新闻类型:</h3>
   		<table align="center" border="1" width="800" cellpadding="6" cellspacing="0" id="table" style="text-align:center">
        <tr>
        	<th>序号</th>
            <th>类型名</th>
            <th>操作</th>
        </tr>
        </table>
  </body>
</html>

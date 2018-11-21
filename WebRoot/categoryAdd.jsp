<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
            $("#add").click(function(){
				$.ajax({
					 url:"categoryJsonAction_checkCategoryName.action",
					 type:'POST',
					 data:{categoryName:$("#categoryName").val()},
					 dataType:"json",
					 success: function(data){
						 if(data.cn_result=="true"){
							 alert("已存在该类型")
							 }else{
							var add = document.getElementById("categoryAdd");
							add.submit();
								 }
						 }
					})
				})
			$("#categoryName").blur(function(){
				$.ajax({
					 url:"categoryJsonAction_checkCategoryName.action",
					 type:'POST',
					 data:{categoryName:$("#categoryName").val()},
					 dataType:"json",
					 success: function(data){
						 if(data.cn_result=="true"){
							 $("#categoryName").parents('.form-group').addClass('has-error');
							 $("#categoryName").siblings('.glyphicon').addClass('glyphicon-remove');
							 $("#categoryNamespan").html("<font color='red'><b>该类型已经存在</b></font>");
							 }else{
								 if($("#categoryName").val()!=null && $("#categoryName").val()!=""){
							 $("#categoryName").parents('.form-group').addClass(' has-success');
							 $("#categoryName").siblings('.glyphicon').addClass('glyphicon-ok');
								 }
								 }
						 }
					})
				}).focus(function(){
					$("#categoryName").parents('.form-group').removeClass('has-error has-success');
					$("#categoryName").siblings('.glyphicon').removeClass('glyphicon-remove glyphicon-ok');
					$("#categoryNamespan").html("")
					})
        });
    </script>
  </head>
  
  <body>
  	<div class="container">
    	<h3>发布新闻类型</h3>
    	<form action="add.action" method="post" class="form-horizontal" name="categoryAdd"  id="categoryAdd">
    		<div class="form-group has-feedback">
            	<label for="categoryName" class="control-label col-md-2">类型</label>
                <div class="col-md-4">
                	<input type="text" name="categoryName" id="categoryName" class="form-control col-xs-5">
                    <span class="glyphicon form-control-feedback"></span>
                    <span id="categoryNamespan"></span>
                </div>
            </div>
            <div class="form-group">
   				<div class="col-md-2 col-md-offset-2">
            		<input type="button" id="add" value="添加" class="btn btn-primary btn-block">
            	</div>
            </div>
    	</form>
    </div>
  </body>
</html>

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
							 $("#cspan").html("<font color='red'><b>该类型已经存在</b></font>");
							 }
							 else{
							 $("#categoryName").parents('.form-group').addClass(' has-success');
							 $("#categoryName").siblings('.glyphicon').addClass('glyphicon-ok');
								 }
					
						 }
					})
				}).focus(function(){
					$("#categoryName").parents('.form-group').removeClass('has-error has-success')
					$("#categoryName").siblings('.glyphicon').removeClass('glyphicon-remove glyphicon-ok')
					$("#cspan").html("")
					})
				$("#update").click(function(){
					$.ajax({
					 url:"categoryJsonAction_checkCategoryName.action",
					 type:'POST',
					 data:{categoryName:$("#categoryName").val()},
					 dataType:"json",
					 success: function(data){
						 if(data.result=="true"){
							 alert("已存在该类型")
							 }else{
							var update = document.getElementById("updateform");
							update.submit();
								 }
						 }
					})
					})
        });
    </script>
  </head>
  
  <body>
  <h3>更新新闻类型：</h3>
  <div class="container" style="text-align:center">
     
    <form action="updatedCategory.action" method="post" id="updateform" align="center" class="form-horizontal">
    	<div class=" form-group">	
    		<input type="hidden" name="cid" value="${category.id}">
    	</div>
        <div class="form-group has-feedback">
        	<label for="categoryName" class="control-label col-md-2">类型:</label>
    		<div class="col-md-4">
            	<input type="text" name="categoryName" id="categoryName" value="${category.categoryName}" class="form-control col-md-5"/>
                <span class="glyphicon form-control-feedback"></span>				
        		<span id="cspan"></span>
        	</div>
        </div>
        
        <div class="form-group">
        	<div class=" col-md-2 col-md-offset-2">
        	<input type="button" id="update" value="提交" class="btn btn-primary"/>
    		</div>
        </div>
    </form>
    
  </div>
  </body>
</html>

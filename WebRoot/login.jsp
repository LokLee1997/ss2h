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
    <link rel="stylesheet" href="css/bootstrap.min.css">
  <script type="text/javascript" src="js/jquery-3.1.1.js"></script>
  <script type="text/javascript">
	$(document).ready(function() {
		$(function(){
			 document.onkeydown = function(e){
				 var ev = document.all?window.event:e;
				 if(ev.keyCode==13){
					 $("#login").click();
					 }
				 }
			});
        $("#denglu").click(function(){
			if($("#username").val()==null && $("#username").val()==""){
					return false;
				}
			if($("#password").val()==null && $("#password").val()==""){
					return false;
				}	
			 $.ajax({   
                url:"personJsonAction_login.action", 
                type:"POST", 
                data:{username:$("#username").val(),password:$("#password").val()},
                dataType:"json",  
                success: function(data)   
                        { 
						if(data.login_result=="false"){
							alert("帐号或者密码错误");
							location.href="./login.jsp";
							}else{
							var login = document.getElementById('login');	
							login.submit();
							} 
                        },   
                error:function(){  
                        return false;  
                }  
               });   

			});
    });
  </script>
  
  
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <div class="container">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <h2>用户登录</h2>
    <form class="form-horizontal" method="post" action="login.action" name="login" id="login">
  		<div class="form-group">
    			<label for="username" class="control-label col-md-2">用户名</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" name="username" id="username" /><span id="nameSpan"></span>		                
                </div>
    	</div>
        <div class="form-group">
        		<label for="password" class="control-label col-md-2">密码</label>
                <div class="col-md-6">
        			<input class="form-control" type="password" name="password" id="password"/><span id="passSpan"></span>				        		
                </div>
        </div>
        <div class="form-group text-center">
    			<input class="btn btn-info" type="button" value="登录" id="denglu"/>
        </div>
        </form>
  </div>
  </div>
  </div>
  </body>
</html>

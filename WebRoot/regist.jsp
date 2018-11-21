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
    <base href="<%=basePath%>">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
	$(document).ready(function() {
        $("#phone").blur(function(){
			if($("#phone").val()==""||$("#phone").val()==null){
				$("#sphone").html("<b><font color='red'>*手机号不能为空</font></b>");
				return false;
				}
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
				if(!myreg.test($("#phone").val())) 
				{ 
    			$("#sphone").html("<b><font color='red'>*手机号格式不正确</font></b>");
    			return false; 
			} 
			
			$.ajax({
			  url:"personJsonAction_checkPhone.action",
			  type:"POST",
			  data:{phone:$("#phone").val()},
			  dataType:"json",
			  success: function(data){
				  if(data.phone_result=="true"){
					  $("#phone").parents('.form-group').addClass('has-error');
					  $("#phone").siblings('.glyphicon').addClass('glyphicon-remove');
				      $("#sphone").html("<b><font color='red'>*该电话号码已经注册</font></b>");
				  }else{
					  $("#phone").parents('.form-group').addClass('has-success');
					  $("#phone").siblings('.glyphicon').addClass('glyphicon-ok');
					  $("#sphone").html("<b><font color='green'>*该电话号码可以使用</font></b>");
					  }
				  
				  },
			  error:function(){return false;}
			 });
			}).focus(function(){
				$("#phone").parents('.form-group').removeClass('has-error has-success');
				$("#phone").siblings('.glyphicon').removeClass('glyphicon-ok glyphicon-remove');
				$("#sphone").html("");
			});
		$	
		$("#email").blur(function(){
			if($("#email").val()==""||$("#email").val()==null){
				$("#semail").html("<b><font color='red'>*邮箱不能为空</font></b>");
				return false;
				}
			var myreg=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			if(!myreg.test($("#email").val())){
				$("#semail").html("<b><font color='red'>*邮箱格式错误</font></b>");
				return false;
			}
			$.ajax({
			 	url:"personJsonAction_checkEmail.action",
				type:"POST",
				data:{email:$("#email").val()},
				dataType:"json",
				success: function(data){
					if(data.email_result=="true"){
						$("#email").parents('.form-group').addClass('has-error');
					  	$("#email").siblings('.glyphicon').addClass('glyphicon-remove');
						$("#semail").html("<b><font color='red'>*该邮箱已经注册</font></b>");
						}else{
						$("#email").parents('.form-group').addClass(' has-success');
					  	$("#email").siblings('.glyphicon').addClass(' glyphicon-ok');
					  	$("#semail").html("<b><font color='green'>*该邮箱可以使用</font></b>");
					  }
					}
			 });
			}).focus(function(){
				$("#email").parents('.form-group').removeClass('has-error has-success');
				$("#email").siblings('.glyphicon').removeClass('glyphicon-ok glyphicon-remove');
				$("#span4").html("");
			});
			
		$("#username").blur(function(){
			if($("#username").val()==""||$("#username").val()==null){
				$("#suser").html("<b><font color='red'>*帐号不能为空</font></b>");
				return false;
				}
			 $.ajax({   
                url:"personJsonAction_checkUsername.action", //请求验证页面   
                type:"POST", //请求方式 可换为post 注意验证页面接收方式   
                data:{username:$("#username").val()},//取得表文本框数据，作为提交数据 注意前面的 user 此处格式 key=value 其他方式请参考ajax手册  
                dataType:"json",  
                success: function(data)   
                        { 
						if(data.name_result=="true"){
							$("#username").parents('.form-group').addClass('has-error');
							$("#username").siblings('.glyphicon').addClass('glyphicon-remove');
							$("#suser").html("<b><font color='red'>*该用户已存在</font></b>");
							}else{		
							$("#username").parents('.form-group').addClass('has-success');
							$("#username").siblings('.glyphicon').addClass('glyphicon-ok');
							$("#suser").html("<b><font color='green'>*该用户名可以使用</font></b>")
								} 
                        },   
                error:function(){  
                        return false;  
                }  
               });   
			}).focus(function(){
			$("#username").parents('.form-group').removeClass('has-error has-success');
			$("#username").siblings('.glyphicon').removeClass('glyphicon-ok glyphicon-remove');
			$("#suser").html("");
			});
			
		$("#password").blur(function(){
			if($("#password").val()==""||$("#password").val()==null){
				$("#spass").html("<b><font color='red'>*密码不能为空</font></b>");
				return false;
				}
			}).focus(function(){
				$("#spass").html("");
				});
				
		$("#password1").blur(function(){
			if($("#password").val()==$("#password1").val()){
				$("#password1").parent('.form-group').addClass('has-success');
				$("#password1").siblings('.glyphicon').addClass('glyphicon-ok');
				}else if($("#password1").val()==null||$("#password1").val()==""){
				$("#password1").parent('.form-group').addClass();
				$("#password1").siblings('.glyphicon').addClass();
					}else{
				$("#password1").parent('.form-group').addClass('has-error');
				$("#password1").siblings('.glyphicon').addClass('glyphicon-remove');
				$("#spass1").html("<b><font color='red'>*两次密码不一致</font></b>")
					}
			}).focus(function(){
				$("#password1").parents('.form-group').removeClass('has-error has-success');
				$("#password1").siblings('.glyphicon').removeClass('glyphicon-ok glyphicon-remove');
				$("#spass1").html("");
				});
		$("#zhuce").click(function(){
			if($("#username").val()=="" && $("#username").val()==null){alert("用户名不能为空")}
			else if($("#phone").val()=="" && $("#phone").val()==null){alert("手机号码不能为空!")}
			else if($("#email").val()=="" && $("#email").val()==null){alert("邮件不能为空!")}
			else{
				var regist = document.getElementById('regist');
				regist.submit();
				}
			});
		$(function(){
			 document.onkeydown = function(e){
				 var ev = document.all?window.event:e;
				 if(ev.keyCode==13){
					 $("#zhuce").click();
					 }
				 }
			});
    });
	

    
    </script>

 	
    <title>My JSP 'regist.jsp' starting page</title>
    
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
  <div class="row">
  	<div class="col-md-6 col-md-offset-3">		
    <h4>用户注册</h4>			
  		<form action="addPerson.action" method="post" class="form-horizontal" name="regist" id="regist">
        
    	<div class="form-group has-feedback">
        	<label class="control-label col-md-2" for="username">*用户名</label>
        		<div class="col-md-6">
                	<input id="username" type="text" name="username" class="form-control">	
                	<span class="glyphicon form-control-feedback"></span>
                	<span id="suser"></span>
                </div>
        </div>
        
        <div class="form-group">
        	<label class="control-label col-md-2" for="password">*密码</label>
            <div class="col-md-6">
       			<input id="password"  type="password" name="password" class="form-control">
                <span id="spass"></span>
            </div>
        </div>
        <div class="form-group has-feedback">
        	<label class="control-label col-md-2" for="password1">*确认密码</label>
            <div class="col-md-6">
            	<input id="password1" type="password" name="password1" class="form-control">
                <span class="glyphicon form-control-feedback"></span>
                <span id="spass1"></span>
        	</div>
        </div>
        <div class="form-group has-feedback">
        	<label class="control-label col-md-2" for="phone">*电话号码</label>
            <div class="col-md-6">
        		<input id="phone" type="text" name="phone" class="form-control" >
                <span class="glyphicon form-control-feedback"></span>
            	<span id="sphone"></span>
            </div>
        </div>
        
        <div class="form-group has-feedback">
        	<label for="email" class="control-label col-md-2">*邮箱</label>  
            <div class="col-md-6">
        		<input id="email" type="text" name="email" class="form-control" >
                <span class="glyphicon form-control-feedback"></span>
            	 <span id="semail"></span>
            </div>
        </div>
        
        <div class="form-group has-feedback">
        	<label for="address" class="control-label col-md-2">地址</label>   
        	<div class="col-md-6">
            	<input id="address" type="text" name="address" class=" form-control">
            </div> 
        </div>
        
        <div class="col-md-4">
         	<input type="button" id="zhuce" value="注册" class="btn btn-primary">  
        </div>
        
        <div class="col-md-4">
        	<input type="reset" value="重置" class="btn btn-primary">
        </div>
    </form>
    </div>
    </div>
    </div>
  </body>
</html>

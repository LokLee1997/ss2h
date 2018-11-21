<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
   <style type="text/css">
   	div{border: 1 #ccc solid;}
   </style>
  </head>
  
<body style="line-height:25px">
<div class="container" style="margin-top:25px">
 	<!--第一行-->
 	<div class="row">
  		<div class="col-xs-offset-2 col-md-8">
  		<jsp:include page="/resource/runbo.html"></jsp:include>
  		</div>
 	</div>
 <!--第二行-->
 <div class="row">
 	<div class="col-xs-offset-1">
    <h3>最近新闻</h3>
    </div>
 </div>
 <!--第三行-->
 <div class="row">
 	<div class="col-xs-offset-2 col-md-4">
 	
    <ul style="list-style-type:circle">
   	<s:iterator value="newses" var="news" status="stu">
   	<s:if test="#stu.index<5">
   		<li><a href="showNews.action?nid=${news.id }" style="text-decoration:none">
   		<font size="+1">${news.title}</font></a></li>  
    	</s:if>
   	</s:iterator>
   	</ul>
  	</div>
    
    
	<div class="col-xs-offset-1 col-md-4" >
    <ul style="list-style-type:circle">
   	<s:iterator value="newses" var="news" status="stu">
   	<s:if test="#stu.index>=5 && #stu.index<10">
   	<li><a href="showNews.action?nid=${news.id }" style="text-decoration:none">
   		<font size="+1">${news.title}</font></a></li>  
    </s:if>
   	</s:iterator>
   	</ul>
  	</div>
 </div>
 <!-- 第四行 -->
 <div class="row">
 	<h3></h3>
 </div>
</div>

</body>
</html>

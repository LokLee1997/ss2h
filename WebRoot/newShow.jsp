<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>

  </head>
  
  <body>
   <div id="main" style="alignment-adjust:auto">
    <div id="title" align="center"><h1>${news.title}</h1></div><br/>
    		<div align="right" style="margin-right:20%">
    			<span class="date"><s:date name="news.issueTime" format="yyyy-MM-dd"/></span>
    		</div>
    	
    	<div id="content" style="margin:0 auto;width:60%;text-align:left">
        ${news.content}
        </div>

    </div>
  </body>
</html>

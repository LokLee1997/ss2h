<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  </head>
  
  <body>
  <table align="center" border="1" cellpadding="6" cellspacing="0" id="table" style="text-align:center">
   <tr align="center"><th>序号</th><th width="35%">标题</th><th width="20%">发布时间</th><th width="20%">类型</th><th width="20%">操作</th></tr>
   <s:iterator value="newses" var="news" status="stu">
   <tr align="center">
   <td><s:property value="#news.id"/></td>
   <td align="center"><s:a href="showNews.action?nid=%{#news.id}"><s:property value="#news.title"/></s:a></td>
   <td><s:property value="%{getText('{0,date,yyyy-MM-dd}',{#news.issueTime})}"/></td>
   <td><s:property value="#news.category.categoryName"/></td>
   <td><s:a href="new/updateNew.action?nid=%{#news.id}">修改</s:a>
       <s:a href="new/deleteNew.action?nid=%{#news.id}">删除</s:a>
    </td>
   </tr>
   </s:iterator>
   </table>
  </body>
</html>

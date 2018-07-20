<%@ page language="java"  pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>大学英语自主学习网</title>
    <link href="css/left.css" type="text/css" rel="stylesheet">
  </head>
	<script language=javascript>
		function MenuDisplay(obj)
		{
		    for(var i=1;i<=19;i++)
		    {
				var obj2 = document.getElementById('table_' + i.toString());
				if (obj2)
				{
		        document.getElementById('table_'+i).style.display='none';
				document.getElementById('table_'+i+'Span').innerText='＋';
				}
		    }
			var obj2 = document.getElementById(obj);
			if (obj2)
			{
				if(document.getElementById(obj).style.display=='none')
				{
					document.getElementById(obj).style.display='block';
					document.getElementById(obj+'Span').innerText='－';
				}
				else
				{
					document.getElementById(obj).style.display='none';
					document.getElementById(obj+'Span').innerText='＋';
				}
			}
			
		}
    </script>
<body>
	<table cellSpacing=0 cellPadding=0 width=210 align=center border=0>
  <tbody>
  <tr>
    <td width=15><img src="images/new_005.jpg" border=0></td>
    <td align=center width=180 background=images/new_006.jpg height=35>
    <b>功能菜单</b> </td>
    <td width=15><img src="images/new_007.jpg" border=0></td></tr></tbody></table>
	<table width=210 height="100%" border=0 align=center cellPadding=0 cellSpacing=0>
  <tbody>
  <tr>
    <td width=15 background=images/new_008.jpg></td>
    <td width=180 height="588" valign=top bgcolor=#ffffff>
      <table cellspacing=0 cellpadding=3 width=165 align=center border=0>
        <tbody>
        <tr>
          <td class=mainMenu onClick="MenuDisplay('table_1');">
          <span class=span id=table_1Span>＋</span> 个人资料管理</td></tr>
        <tr>
          <td>
            <table id=table_1 style="display: none" cellspacing=0 cellpadding=2 width=155 align=center border=0>
              <tbody>
              <tr>
                <td class=menuSmall><a class=style2 href="xueshengxinxi_updt2.jsp" target=hsgmain>－ 个人资料管理</a></td></tr>
				 <tr>
              </tbody></table></td></tr>
        <tr>
          <td background=images/new_027.jpg height=1></td></tr>
        <tr>
          <td class=mainMenu onclick="MenuDisplay('table_2');">
          <span class=span id=table_2Span>＋</span> 成绩查看</td></tr>
        <tr>
          <td>
            <table id=table_2 style="display: none" cellspacing=0 cellpadding=2 width=155 align=center border=0>
              <tbody>
              <tr>
                <td class=menuSmall><a class=style2 href="cj_list2.jsp" target=hsgmain>－ 成绩查看</a></td></tr>
			
             </tbody></table></td></tr>
      
				 <tr>
          <td background=images/new_027.jpg height=1></td></tr>
        <tr>
       <td class=mainMenu onclick="MenuDisplay('table_4');">
       <span class=span id=table_4Span>＋</span> 作业管理</td></tr>
        <tr>
          <td>
            <table id=table_4 style="display: none" cellspacing=0 cellpadding=2 width=155 align=center border=0>
              <tbody>
              <tr>
                <td class=menuSmall><a class=style2 href="zuoyetijiao_add.jsp" target=hsgmain>－ 作业上交</a></td></tr>
				 <tr>
                <td class=menuSmall><a class=style2 href="zuoyetijiao_list2.jsp" target=hsgmain>－ 已交作业查询</a></td></tr>
             </tbody></table></td></tr>
        <tr>
		 <td background=images/new_027.jpg height=1></td></tr>
       </tbody></table></td>
  <td width=15 background=images/new_009.jpg></td></tr></tbody></table>
	<table cellspacing=0 cellpadding=0 width=210 align=center border=0>
  <tbody>
  <tr>
    <td width=15><img src="images/new_010.jpg" border=0></td>
    <td align=middle width=180 background=images/new_011.jpg height=15></td>
    <td width=15><img src="images/new_012.jpg" border=0></td></tr></tbody></table>
</body>
</html>


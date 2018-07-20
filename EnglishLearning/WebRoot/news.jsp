<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>大学英语自主学习网</title>
		<link href="css/style.css" type="text/css" rel="stylesheet">	   
  </head>
	<%
		String lb=new String(request.getParameter("lb").getBytes("8859_1"));
	%>
<body >
  <table width="988" height="1007" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
		<tr>
			<td><%@ include file="qttop.jsp"%></td>
		</tr>
		<tr>
			<td><table id="__01" width="988" height="666" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><table id="__01" width="785" height="666" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top"><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="17%" height="20" align="center" valign="bottom"><span class="title"><%=lb%></span></td>
                        <td width="76%" class="STYLE4">&nbsp;</td>
                        <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="100%" height="669" valign="top" background="qtimages/5.gif"><table width="98%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#AAE4D5" style="border-collapse:collapse">
                      <tr align="center">
                        <td width="50">序号</td>
                        <td width="400">标题</td>
                        <td width="107">点击率</td>
                        <td width="102">添加时间</td>
                      </tr>
			<%
  			int curpage=1;//当前页
				int page_record=25;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from xinwentongzhi where leibie='"+lb+"'";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
  			while(RS_resultfy.next()){
  			    zgs=Integer.parseInt(RS_resultfy.getString("ss"));
  					zys=zgs/page_record+1;
  			}
				if (hsgnpage!=null){curpage=Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
				}
				else{
						curpage=1;
				}
				if (curpage==0){
						curpage=1;
				}
				if(curpage>zys){
						curpage=zys;
				}
			  String sql="";
			  sql="select top "+page_record+" * from xinwentongzhi where leibie='"+lb+"' and id not in (select top "+((curpage-1)*page_record)+" id from xinwentongzhi order by id desc) ";
  
				if(request.getParameter("keyword")=="" ||request.getParameter("keyword")==null ){}else{sql=sql+" and biaoti like '%"+new String(request.getParameter("keyword").getBytes("8859_1"))+"%'";}
			  sql=sql+" order by id desc";
			  ResultSet RS_result=connDbBean.executeQuery(sql);
			  String id="";
			  String biaoti="";
			  String leibie="";
			  String neirong="";
			  String tianjiaren="";
			  String shouyetupian="";
			  String dianjilv="";
			  String addtime="";
			  int i=0;
 
			  while(RS_result.next()){
			     i=i+1;
			     id=RS_result.getString("id");
					 biaoti=RS_result.getString("biaoti");
					 leibie=RS_result.getString("leibie");
					 neirong=RS_result.getString("neirong");
					 tianjiaren=RS_result.getString("tianjiaren");
					 shouyetupian=RS_result.getString("shouyetupian");
					 dianjilv=RS_result.getString("dianjilv");
					 addtime=RS_result.getString("addtime");
			%>
											
        <tr align="center">
          <td width="50"><%=i %></td>
          <td width="400"><a href="gg_detail.jsp?id=<%=id%>"><%=biaoti %></a></td>
          <td width="107">被点击<%=dianjilv %>次</td>
          <td width="102"><%=addtime.substring(0,10) %></td>
        </tr>
			<%
  			}
   		%>
	</table><br>
	<p align="center">以上数据共 <%=i %> 条,<a style="cursor:hand" onclick="javascript:window.print();">打印本页</a></p>
	<p align="center">&nbsp;共<%=i%>条记录&nbsp;&nbsp;<%=page_record %>条/页　
	<a href="news.jsp?page=1&lb=<%=lb%>">首页</a>　
	<a href="news.jsp?page=<%= curpage-1%>&lb=<%=lb%>">上一页</a>　
	<a href="news.jsp?page=<%= curpage+1%>&lb=<%=lb%>">下一页</a>　
	<a href="news.jsp?page=<%=zys %>&lb=<%=lb%>">尾页</a>　当前第<font color=red><%=curpage %></font>页/共<font color=red><%=zys %></font>页</p>
	<p align=center></td>
	  </tr>
	  <tr>
	    <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
	  </tr>
  </table></td>
		</tr></table></td>
     <td valign="top"><%@ include file="qtleft.jsp"%></td>
    </tr></table></td>
		</tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>
<%
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){  //判断用户是否已经登陆，如果没有，则给出登陆框，如果有则显示当前用户信息
			out.print("<script>alert('对不起,请您先登录!');window.history.go(-1);</script>");
	}
%><%@ page language="java"  pageEncoding="gb2312"%>
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
	  String id=request.getParameter("id");
	  connDbBean.executeUpdate("update xinwentongzhi set dianjilv=dianjilv+1 where id="+id);
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
                      <td width="17%" height="20" align="center" valign="bottom"><span class="title">资料详细</span></td>
                      <td width="76%" class="STYLE4">&nbsp;</td>
                      <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="100%" height="669" valign="top" background="qtimages/5.gif"><p align="center">
		<%
		  String sql="select * from ziliaoxiazai where id="+id;
		  String bianhao="";String mingcheng="";String leibie="";String kecheng="";String jianjie="";String fujian="";
		  ResultSet RS_result=connDbBean.executeQuery(sql);
		  while(RS_result.next()){
		  bianhao=RS_result.getString("bianhao");mingcheng=RS_result.getString("mingcheng");leibie=RS_result.getString("leibie");kecheng=RS_result.getString("kecheng");jianjie=RS_result.getString("jianjie");fujian=RS_result.getString("fujian");
		  }
	   %></p>
	 <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
	  <tr align="center"><td width='11%'>编号</td><td width='39%'><%=bianhao%></td></tr>
	  <tr align="center"><td width='11%'>名称</td><td width='39%'><%=mingcheng%></td></tr>
	  <tr align="center"><td width='11%'>类别</td><td width='39%'><%=leibie%></td></tr>
	  <tr align="center"><td width='11%'>课程</td><td width='39%'><%=kecheng%></td></tr>
	  <tr align="center"><td>下载</td><td><a href="<%=fujian%>" target="_blank">点此下载</a></td>
	  <tr align="center"><td width='11%' height="95">简介</td><td><%=jianjie%></td>
	  <tr>
	    <td colspan="2" align="center"><input type="button" name="Submit5" value="返回" onClick="javascript:history.back()" /></td>
	  </tr>
          </table>
          <p align="center"></p>
          <P align=center></td>
      </tr>
      <tr>
        <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
      </tr>
    </table></td>
  	</tr>
         </table></td>
         <td valign="top"><%@ include file="qtleft.jsp"%></td>
       </tr>
     </table></td>
		</tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>
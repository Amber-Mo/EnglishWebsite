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
                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">在线测试</span></td>
                        <td width="76%" class="STYLE4">&nbsp;</td>
                        <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="100%" height="669" valign="top" background="qtimages/5.gif">
                    <p align="center">
                      <%
											  String id=request.getParameter("id");
											  String sql="",nnn="",bianhao="",tishu="",fenzhi="";
												sql="select * from zidongzujuan where id="+id+"";
											  ResultSet RS_result=connDbBean.executeQuery(sql);
											  while(RS_result.next()){
													  nnn=RS_result.getString("timu");
													  bianhao=RS_result.getString("bianhao");
													  tishu=RS_result.getString("tishu");
													  fenzhi=RS_result.getString("fenzhi");
											  }
   										%>
									</p>
                  <form name="form1" id="form1" method="post" action="jiaojuan.jsp?tishu=<%=tishu%>&fenzhi=<%=fenzhi%>&bianhao=<%=bianhao%>">
                  	<p>试卷编号：<%=bianhao%> &nbsp;试题数量：<%=tishu%> &nbsp;每题分值：<%=fenzhi%> &nbsp;时间：0.5分钟，现在开始计时！剩余 
                  	<span id=tiao></span> 秒 <script language=javascript>
										<!--
										function clock(){i=i-1
										document.getElementById('tiao').innerHTML=i;
										if(i>0) {
										setTimeout("clock();",1000);
										}
										else {
										
										alert("考试时间到，系统自动交卷！");
										document.form1.submit();
										}
										}
										var i=30
										clock()
										//-->
									</script> </p>
                  <table width="100%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
                    <tr align="center">
                      <td height="33" colspan="3">选择题</td>
                    </tr>
                    <%
											sql="select * from xuanzeti where id in ("+nnn+")";
											sql=sql+" order by id desc";
											RS_result=connDbBean.executeQuery(sql);
											id="";
											String zhuanye="";
											String xueke="";
											String timu="";
											String xuanxiangA="";
											String xuanxiangB="";
											String xuanxiangC="";
											String xuanxiangD="";
											String daan="";
											String nanduxishu="";
											String addtime="";
											int i=0;
											while(RS_result.next()){
											    i=i+1;
											    id=RS_result.getString("id");
													zhuanye=RS_result.getString("zhuanye");
													xueke=RS_result.getString("xueke");
													timu=RS_result.getString("timu");
													xuanxiangA=RS_result.getString("xuanxiangA");
													xuanxiangB=RS_result.getString("xuanxiangB");
													xuanxiangC=RS_result.getString("xuanxiangC");
													xuanxiangD=RS_result.getString("xuanxiangD");
													daan=RS_result.getString("daan");
													nanduxishu=RS_result.getString("nanduxishu");
													addtime=RS_result.getString("addtime");
											 
											%>
                      <tr>
                        <td width="9%" height="33" align="center">第 <%=i%> 题</td>
                        <td colspan="2"><%=timu%>
                            <input name="xztshitida<%=i%>" type="hidden" id="xztshitida<%=i%>" value="<%=daan%>"></td>
                      </tr>
                      <tr>
                        <td rowspan="2" align="center">选项</td>
                        <td width="52%">
                        <input type="radio" name="xztxxa<%=i%>" value="A">选项A&nbsp; &nbsp;<%=xuanxiangA%></td>
                        <td width="39%">
                        <input type="radio" name="xztxxa<%=i%>" value="B">选项B&nbsp; &nbsp;<%=xuanxiangB%></td>
                      </tr>
                      <tr>
                      	<td><input type="radio" name="xztxxa<%=i%>" value="C">选项C&nbsp; &nbsp;<%=xuanxiangC%></td>
                        <td><input type="radio" name="xztxxa<%=i%>" value="D">选项&nbsp; &nbsp;<%=xuanxiangD%></td>
                      </tr>
                      <%
											  }
											%>
                   </table>
                   	<p align="center">
                    	<input type="submit" name="Submit5" value="交卷">
                     </p>
                </form>
                   <p align="center">&nbsp;</p>
                   <P align=center></P>
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
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
    <title>试卷详细</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
  </head>
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
<body >
  <form name="form1" id="form1" method="post" action="">
    <p>试卷编号：<%=bianhao%>&nbsp;&nbsp;
    	  试题数量：<%=tishu%>&nbsp;&nbsp;
    	  每题分值：<%=fenzhi%>
    </p>
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
	 String daan="";String nanduxishu="";
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
       <td width="9%" height="33" align="center">第<%=i %>题</td>
       <td colspan="2" align="left"><%=timu%>  <input name="xztshitida<%=i%>" type="hidden" id="xztshitida<%=i%>" value="<%=daan%>"></td>
     </tr>
     <tr>
       <td rowspan="2" align="center">选项</td>
       <td width="52%"><input type="radio" name="xztxxa<%=i%>" value="A">A&nbsp;&nbsp;&nbsp;&nbsp;<%=xuanxiangA%></td>
       <td width="39%"><input type="radio" name="xztxxa<%=i%>" value="B">B&nbsp;&nbsp;&nbsp;&nbsp;<%=xuanxiangB%></td>
     </tr>
     <tr>
       <td><input type="radio" name="xztxxa<%=i%>" value="C">C&nbsp;&nbsp;&nbsp;&nbsp;<%=xuanxiangC%></td>
       <td><input type="radio" name="xztxxa<%=i%>" value="D">D&nbsp;&nbsp;&nbsp;&nbsp;<%=xuanxiangD%></td>
     </tr>
     <%
			}
		%>
    </table>
  </form>
</body>
</html>


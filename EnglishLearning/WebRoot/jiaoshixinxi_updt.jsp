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
    <title>��ʦ��Ϣ</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
	  <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","�ļ��ϴ�");
            pop.build();
            pop.show();
	    }
		</script>
  </head>
		<script language="javascript">
			function check(){
				if(document.form1.gonghao.value==""){
					alert("�����빤��");document.form1.gonghao.focus();
					return false;
				}
				if(document.form1.xingming.value==""){
					alert("����������");document.form1.xingming.focus();
					return false;
				}
				if(document.form1.mima.value==""){
					alert("����������");document.form1.mima.focus();
					return false;}
				if(document.form1.shenfenzheng.value==""){
					alert("���������֤");document.form1.shenfenzheng.focus();
					return false;
				}
				if(document.form1.dianhua.value==""){
					alert("������绰");document.form1.dianhua.focus();
					return false;
				}
			}
		</script>
<body >
  <%
  	String id=request.getParameter("id");
  %>
  <form name="form1" id="form1" method="post" action="jiaoshixinxi_updt_post.jsp?id=<%=id %>">
    �޸Ľ�ʦ��Ϣ<br><br>
  <%
	  String sql="select * from jiaoshixinxi where id="+id;
	  String gonghao="";String xingming="";String mima="";String chushengnianyue="";String shenfenzheng="";String xingbie="";String zhicheng="";String zhaopian="";String zhujiaokecheng="";String dianhua="";String beizhu="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	      gonghao=RS_result.getString("gonghao");
	      xingming=RS_result.getString("xingming");
	      mima=RS_result.getString("mima");
	      chushengnianyue=RS_result.getString("chushengnianyue");
	      shenfenzheng=RS_result.getString("shenfenzheng");
	      xingbie=RS_result.getString("xingbie");
	      zhicheng=RS_result.getString("zhicheng");
	      zhaopian=RS_result.getString("zhaopian");
	      zhujiaokecheng=RS_result.getString("zhujiaokecheng");
	      dianhua=RS_result.getString("dianhua");
	      beizhu=RS_result.getString("beizhu");
		}
	%>
		<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
    	<tr><td align="center">����</td><td><input name='gonghao' type='text' id='gonghao' value='<%= gonghao%>' /></td></tr>
      <tr><td align="center">����</td><td><input name='xingming' type='text' id='xingming' value='<%= xingming%>' /></td></tr>
      <tr><td align="center">�Ա�</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=xingbie%>';</script>
      <tr><td align="center">����</td><td><input name='mima' type='text' id='mima' value='<%= mima%>' /></td></tr>
      <tr><td align="center">��������</td><td><input name='chushengnianyue' type='text' id='chushengnianyue' value='<%= chushengnianyue%>' onclick="getDate(form1.chushengnianyue,'2')" need="1"  /></td></tr>
      <tr><td align="center">���֤</td><td><input name='shenfenzheng' type='text' id='shenfenzheng' size='50' value='<%=shenfenzheng%>' /></td></tr>
      <tr><td align="center">ְ��</td><td><input name='zhicheng' type='text' id='zhicheng' value='<%= zhicheng%>' /></td></tr>
      <tr><td align="center">��Ƭ</td><td><input name='zhaopian' type='text' id='zhaopian' size='50' value='<%= zhaopian%>' />&nbsp;<input type='button' value='�ϴ�' onClick="up('zhaopian')"/></td></tr>
      <tr><td align="center">���̿γ�</td><td><select name='zhujiaokecheng' id='zhujiaokecheng'><%sql="select kechengmingcheng from kechengxinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("kechengmingcheng")%>" ><%=RS_result.getString("kechengmingcheng")%></option><%}%></select></td></tr><script language="javascript">document.form1.zhujiaokecheng.value='<%=zhujiaokecheng%>';</script>
      <tr><td align="center">�绰</td><td><input name='dianhua' type='text' id='dianhua' value='<%= dianhua%>' /></td></tr>
      <tr><td align="center">��ע</td><td><textarea rows="1" cols="60" name="beizhu" onscroll="this.rows++;" id='beizhu'><%=beizhu%></textarea></td></tr>
     <tr align="center">
       <td colspan="2">
	       <input type="submit" name="Submit" value="�ύ" onClick="return check();" />&nbsp;&nbsp;&nbsp;
	       <input type="reset" name="Submit2" value="����" /></td>
     </tr>
  	</table>
	</form>
</body>
</html>



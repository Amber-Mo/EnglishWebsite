<%@ page language="java"  pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�޸�����</title>
  </head>
<body >
	<form name="form1" id="form1" method="post" action="mod_post.jsp">
  	<table width="36%" height="126" border="1" cellpadding="3" cellspacing="1" bordercolor="9DC9FF" style="border-collapse:collapse">
	    <tr>
	      <td colspan="2"><div align="center">�޸�����</div></td>
	    </tr>
	    <tr>
	      <td align="center">ԭ����</td>
	      <td><input name="ymm" type="text" id="ymm" /></td>
	    </tr>
	    <tr>
	      <td align="center">������</td>
	      <td><input name="xmm1" type="password" id="xmm1" /></td>
	    </tr>
	    <tr>
	      <td align="center">ȷ������</td>
	      <td><input name="xmm2" type="password" id="xmm2" /></td>
	    </tr>
	    <tr align="center">
	      <td colspan="2">
		      <input type="submit" name="Submit" value="ȷ��" onclick="return check()" />&nbsp;&nbsp;
		      <input type="reset" name="Submit2" value="����" />
	      </td>
	    </tr>
  	</table>
	</form>
</body>
</html>


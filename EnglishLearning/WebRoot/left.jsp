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
    <title>��ѧӢ������ѧϰ��</title>
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
					document.getElementById('table_'+i+'Span').innerText='��';
					}
			    }
				var obj2 = document.getElementById(obj);
				if (obj2)
				{
					if(document.getElementById(obj).style.display=='none')
					{
						document.getElementById(obj).style.display='block';
						document.getElementById(obj+'Span').innerText='��';
					}
					else
					{
						document.getElementById(obj).style.display='none';
						document.getElementById(obj+'Span').innerText='��';
					}
				}
				
			}
    </script>
 <body >
	<table cellspacing=0 cellpadding=0 width=210 align=center border=0>
  <tbody>
	  <tr>
	    <td width=15><img src="images/new_005.jpg" border=0></td>
	    <td align=center width=180 background=images/new_006.jpg height=35><b>���ܲ˵�</b> </td>
	    <td width=15><img src="images/new_007.jpg" border=0></td></tr></tbody></table>
	<table width=210 height="100%" border=0 align=center cellpadding=0 cellspacing=0>
  <tbody>
	  <tr>
	    <td width=15 background=images/new_008.jpg></td>
	    <td width=180 height="588" vAlign=top bgColor=#ffffff>
	      <table cellspacing=0 cellpadding=3 width=165 align=center border=0>
	        <tbody>
	        <tr>
	          <td class=mainMenu onclick="MenuDisplay('table_1');">
	          <span class=span id=table_1Span>��</span> ϵͳ�û�����</td></tr>
	        <tr>
	          <td>
            <table id=table_1 style="display: none" cellspacing=0 cellpadding=2 width=155 align=center border=0>
              <tbody>
              <tr>
                <td class=menuSmall>
                <a class=style2 href="yhzhgl.jsp" target=hsgmain>�� ϵͳ����Ա����</a></td></tr>
              </tbody></table></td></tr>
        <tr>
          <td background=images/new_027.jpg height=1></td></tr>
        <tr>
          <td class=mainMenu onclick="MenuDisplay('table_2');">
          <span class=span id=table_2Span>��</span> �����������</td></tr>
        <tr>
          <td>
            <table id=table_2 style="display: none" cellspacing=0 cellpadding=2 width=155 align=center border=0>
              <tbody>
              <tr>
                <td class=menuSmall><a class=style2 href="mod.jsp" target=hsgmain>�� �����������</a></td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <tr>
          <td background=images/new_027.jpg height=1></td></tr>
        <tr>
          <td class=mainMenu onClick="MenuDisplay('table_3');"><span 
            class=span id=table_3Span>��</span> ����֪ͨ����</td></tr>
        <tr>
          <td>
            <table id=table_3 style="display: none" cellspacing=0 cellpadding=2 
            width=155 align=center border=0>
              <tbody>
              <tr>
                <td class=menuSmall><a class=style2 
                  href="xinwentongzhi_add.jsp?lb=����֪ͨ" 
                  target=hsgmain>�� ����֪ͨ���</a></td></tr>
              <tr>
                <td class=menuSmall><a class=style2 
                  href="xinwentongzhi_list.jsp?lb=����֪ͨ" target=hsgmain>�� ����֪ͨ��ѯ</a></td></tr>
				  
				  </tbody></table></td></tr>
        <tr>
          <td background=images/new_027.jpg height=1></td></tr>
        <tr>
          <td class=mainMenu onClick="MenuDisplay('table_4');"><SPAN 
            class=span id=table_4Span>��</span> ʦ������</td></tr>
        <tr>
          <td>
            <table id=table_4 style="display: none" cellspacing=0 cellpadding=2 width=155 align=center border=0>
              <tbody>
              <tr>
                <td class=menuSmall><a class=style2 href="jiaoshixinxi_add.jsp" target=hsgmain>�� ��ʦ���</a></td>
              </tr>
              <tr>
                <td class=menuSmall><a class=style2 href="jiaoshixinxi_list.jsp" target=hsgmain>�� ��ʦ����</a></td>
              </tr>
              <tr>
                <td class=menuSmall><a class=style2 href="xueshengxinxi_add.jsp" target=hsgmain>�� ѧ�����</a></td>
              </tr>
              <tr>
                <td class=menuSmall><a class=style2 href="xueshengxinxi_list.jsp" target=hsgmain>�� ѧ������</a></td>
              </tr></tbody></table></td></tr>
        <tr>
          <td background=images/new_027.jpg height=1></td></tr>
      <tr>
          <td class=mainMenu onClick="MenuDisplay('table_5');">
          <span class=span id=table_5Span>��</span> ѧϰ��Դ����</td></tr>
        <tr>
          <td>
            <table id=table_5 style="display: none" cellspacing=0 cellpadding=2 width=155 align=center border=0>
              <tbody>
              <tr>
                <td class=menuSmall><a class=style2  href="ziliaoxiazai_add.jsp" target=hsgmain>�� �����ϴ�</a></td>
              </tr>
              <tr>
                <td class=menuSmall><a class=style2 href="ziliaoxiazai_list.jsp" target=hsgmain>�� ���Ϲ���</a></td>
              </tr>
             </tbody></table></td></tr>
        <tr>
          <td background=images/new_027.jpg height=1></td></tr>
        <tr>
          <td class=mainMenu onClick="MenuDisplay('table_18');"><span 
            class=span id=table_18Span>��</span> ���Թ���</td></tr>
        <tr>
          <td>
            <table id=table_18 style="display: none" cellspacing=0 cellpadding=2 width=155 align=center border=0>
              <tbody>
              <tr>
                <td class=menuSmall><a class=style2 href="liuyanban_list.jsp" target=hsgmain>�� ���Թ���</a></td>
              </tr>
              </tbody></table></td></tr>
        <tr>
          <td background=images/new_027.jpg height=1></td></tr>
        <tr>
          <td class=mainMenu onclick="MenuDisplay('table_19');">
          <span class=span id=table_19Span>��</span> ϵͳ����</td></tr>
        <tr>
          <td>
            <table id=table_19 style="display: none" cellspacing=0 cellpadding=2 width=155 align=center border=0>
              <tbody>
                <td class=menuSmall><a class=style2 href="dx.jsp?lb=ϵͳ���" target=hsgmain>�� ϵͳ�������</a></td>
              </tr>
              <tr>
                <td class=menuSmall><a class=style2 href="dx.jsp?lb=ϵͳ����" target=hsgmain>�� ϵͳ��������</a></td>
              </tr>
              <tr>
                <td class=menuSmall><a class=style2 href="youqinglianjie_add.jsp" target=hsgmain>�� �����������</a></td>
              </tr>
              <tr>
                <td class=menuSmall><a class=style2 href="youqinglianjie_list.jsp" target=hsgmain>�� �������Ӳ�ѯ</a></td>
              </tr>
              </tbody></table></td></tr></tbody></table></td>
  <td width=15 background=images/new_009.jpg></td></tr></tbody></table>
	<table cellspacing=0 cellpadding=0 width=210 align=center border=0>
  <tbody>
  <tr>
    <td width=15><img src="images/new_010.jpg" border=0></td>
    <td align=middle width=180 background=images/new_011.jpg height=15></td>
    <td width=15><img src="images/new_012.jpg" border=0></td></tr></tbody></table>
  </body>
</html>


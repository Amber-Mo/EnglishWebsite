<%@ page contentType="text/html;charset=gb2312" language="java" import="com.jspsmart.upload.*"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
%>
<%
  String newFile1Name=null;
  String file_name=null;
	SmartUpload mySmartUpload = new SmartUpload();
	//初始化上传
	mySmartUpload.initialize(pageContext);
	//只允许上载此类文件
	try 
	{
		mySmartUpload.upload();
	} 
	catch (Exception e){}
	try 
	{
		   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
		   if (myFile.isMissing())
		   {
			  out.println("<script language=javascript>alert('必须选择图片！');   history.back(-1);</script>");
			  return;

		   } 
		   else 
		   {
			   int file_size = myFile.getSize(); //取得文件的大小 (单位是b) 
			   file_name=myFile.getFileName();
			   System.out.println("文件大小："+file_size+"文件名称："+file_name);
         newFile1Name=new Date().getTime()+file_name.substring(file_name.indexOf("."));
	       System.out.println("新文件名称："+newFile1Name);
				 String saveurl = request.getSession().getServletContext().getRealPath("upload");
				 saveurl = saveurl+"/"+newFile1Name;
				 myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
			} 
	  } 
	  catch (Exception e)
	  {
	    e.toString();
	  }
%>
	<script language="javascript">
		var str=location.toString()
		var Result=((((str.split('?'))[1]).split('='))[1]);
		window.parent.document.getElementById(Result).value="upload/<%= newFile1Name%>";					
		document.write("上传成功");
	</script> 
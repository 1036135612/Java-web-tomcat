<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function fh(){
	
	location.href = "http://127.0.0.1:8080/Javaweb/%E9%A6%96%E9%A1%B5.jsp"
}


</script>    
<body> 


<form action="release" method="post">
<table  border="0" width="400px" style="margin: auto;background:orange;color:blue;">
<tr><td><div>${result}</div></td></tr>
<tr>
    <td>标题：<input Type="text" name="bt" style="width: 240px;"> </td>
</tr>
<tr>
 <td>内容：</td>
</tr>
<tr>
   <td>&emsp;&emsp;&nbsp;&nbsp; <textarea cols="30" rows="15" name="nr"></textarea></td>
</tr>
<tr>
 <td>&emsp;&ensp;&ensp;&nbsp;&nbsp;&nbsp;<input Type="submit" value="发布">
    <input Type="reset" value="重写">
     &emsp;<button type="button" onclick="fh()">返回</button>
 </td>
</tr>
</table>
</form>

</body>  
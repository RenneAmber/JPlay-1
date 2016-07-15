<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 16/7/14
  Time: 下午8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jplay</title>

</head>
<body>
<center><b>ERROR: <%if(session.getAttribute("message") != null) {%><%=session.getAttribute("message")%>
<%session.removeAttribute("message");}else{%><%="Unknown ERROR"%><%}%></b></center>
</body>
</html>

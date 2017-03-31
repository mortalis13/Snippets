
<%@page import="java.util.Enumeration" %>

<%
  Enumeration e = session.getAttributeNames();
  while (e.hasMoreElements()) {
    String name = (String) e.nextElement();
    String value = session.getAttribute(name).toString();
    out.println("<div>");
    out.println("  --ATTR-- <b>[" + name + "]</b>: " + value);
    out.println("</div><br>");
  }
%>

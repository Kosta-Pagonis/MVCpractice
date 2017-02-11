<%@ page import="helloPackage.obj.MyName" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Hello World</title>
</head>
<body>
<h2>${message}</h2>
<br />

<%
    List<MyName> names = ObjectifyService.ofy().load().type(MyName.class).order("-date").list();

    if(names.isEmpty()){
        %>No name in the google data store<%
    }else{
        for(MyName name: names){
            %><h2>My Name is <b style="color:blue;"><%=name.getName()%> </b></h2><%
        }
    }
%>


</body>
</html>
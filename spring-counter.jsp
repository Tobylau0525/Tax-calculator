<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dynamic Counter by Yat Cho Lau</title>
<link href="./common.css" rel="stylesheet"
	type="text/css">
</head>
<body>

    <h1>Number as of ${currentDate}</h1>

    <% String sCounter = request.getParameter("countToNumber");
        sCounter = sCounter == null || sCounter.trim().equals("") ? "45" : sCounter;
    %>

	<h1>
		Numbers <span id="mode"><%= sCounter %></span>
	</h1>
	
	<form:form id="input"  method="get" modelAttribute="input">
		<label for="countToNumber">number: </label> 
		<form:input path="countToNumber" type="text" />
		<form:radiobutton path="mode" value="123" checked="checked"/> 123
		<form:radiobutton path="mode" value="321"/> 321
		<form:radiobutton path="mode" value="abc"/> abc
		<form:radiobutton path="mode" value="cba" /> cba
		<br />

		<input type="submit" value="submit"/>	
	</form:form>
	
	<br />
	<div id="divBody" style="width: 5.5in; ">

	    <c:forEach items="${numbers}" var="n"><div class="${n.className}">${n.displayValue}</div></c:forEach>

	</div>
</body>
</html>
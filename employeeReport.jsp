<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<link href="marginal.css" rel="stylesheet"
	type="text/css">
</head>
<body>

	<h2>Employee Report Row Count: ${size} </h2>
	
	<form:form  modelAttribute="input" action="/employeeReport" method="get">
		Report Templates: 
		<form:select path="code">
			<form:option value="ALL">All Employees</form:option>
			<form:option value="F">Female Employees</form:option>
			<form:option value="M">Male Employee</form:option>
			<form:option value="GT100K">Greater than 100k</form:option>
			<form:option value="GT200K" >Greater than 200k</form:option> <!-- Portion Students  -->
			<form:option value="GT300K" >Greater than 300k</form:option> <!-- Portion Students  -->
			<form:option value="GT600K" >Greater than 600k</form:option> <!-- Portion Students  -->
			<form:option value="TriState" >NY, NJ, and CT</form:option> <!-- Portion Students  -->
		</form:select>
		<input type="submit" />	
	</form:form>

	<table>
		<thead>
			<tr>
				<th>employeeId</th>
				<th>state</th>
				<th>gender</th>
				<th>salary</th>
				<th>status</th>				
			</tr>
		</thead>
		<tbody>
		    <c:forEach items="${employees}" var="n">
                <tr>
                    <td>L-8921</td>
                    <td class="center">${n.employeeId}</td>
                    <td class="center">${n.state}</td>
                    <td class="center">${n.gender}</td>
                    <td class="money">${n.formattedSalary}</td>
                    <td class="center">${n.status}</td>
                </tr>

		    </c:forEach>
			


			
		</tbody>
	</table>
	<small>Author : Yat Cho Lau </small>
</body>
</html>
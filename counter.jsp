<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dynamic Counter by Yat Cho Lau</title>
<link href="./common.css" rel="stylesheet"
	type="text/css">
</head>
<body>

    <% String sCounter = request.getParameter("countToNumber");
        sCounter = sCounter == null || sCounter.trim().equals("") ? "45" : sCounter;
    %>

	<h1>
		Numbers <span id="mode"><%= sCounter %></span>
	</h1>
	
	<form id="input"  method="get">
		<label for="countToNumber">number: </label> 
		<input id="countToNumber" name="countToNumber" type="text" />
		<input id="mode" type="radio" value="123" name="mode" checked="checked"/> 123
		<input id="mode" type="radio" value="321" name="mode" /> 321
		<input id="mode" type="radio" value="abc" name="mode" /> abc
		<input id="mode" type="radio" value="cba" name="mode" /> cba
		<br />

		<input type="submit" value="submit"/>	
	</form>
	
	<br />
	<div id="divBody" style="width: 5.5in; ">


            <%  int counter = Integer.parseInt(sCounter);
                String mode = request.getParameter("mode");
                mode = mode == null ? "123" : mode;
                String evenClass = "";
            %>

		    <%
                if(mode.equals("123")){
                    for(int i =1; i <= counter; i++){
                        evenClass = i % 2 ==0? "isEven" : "odd";%><div class='numbers separator <%= evenClass %> '><%=i%></div><%}}
                else if(mode.equals("321")){
                    for(int i = counter; i > 0; i--){
                        evenClass = i % 2 ==0? "isEven" : "odd";%><div class='numbers separator <%= evenClass %> '><%=i%></div><%}}
                else if(mode.equals("abc")){
                    for(char i = 'A'; i <= 'Z'; i++){
                      %><div class='numbers'><%=i%></div><%}}
                else if(mode.equals("cba")){
                    for(char i = 'Z'; i >= 'A'; i--){
                      %><div class='numbers'><%=i%></div><%}}

            %>


	</div>
</body>
</html>
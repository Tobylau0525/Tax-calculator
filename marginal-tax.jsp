<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<link href="marginal-tax.css" rel="stylesheet" type="text/css"></link>
	</head>
	<body>
		<div class="body row">
			<div class="column1">

				<h2>Input </h2>
				<form:form modelAttribute="input" action="/marginal-tax-rate" method="get">
					<label>Year:</label>
					<form:select path="year">
						<form:option value="2021" selected="selected">2021</form:option>
						<form:option value="2020">2020</form:option>
						<form:option value="2019">2019</form:option>
					</form:select>
					<br />
						<label>Status:</label>
						<form:select path="code" >
							<form:option value="S" selected="selected">Single</form:option>
							<form:option value="MFJ">Married Filing Jointly</form:option>
							<form:option value="HH">Head of House Hold</form:option>
						</form:select>
						<br />
							<label path="salary">Salary:</label>
							<input id="salary" name="salary" type="text"
								value="150000" />
							<br />
							<input type="submit" value="calculate" />
				</form:form>

			</div>
			<div class="middle"></div>

			<div class="column2">
				<h2>Marginal Tax Rate Example</h2>
				<p>
					The table below shows the rates and income levels for three types
					of
					filer in
					<span class="replacable" > ${year} :</span>
					single, married
					filing jointly, and heads of household
				</p>
				<table>
					<thead>
						<tr>
							<th>Rate</th>
							<th>For Singles With Taxable Income Over</th>
							<th>For Married Filing Jointly With Taxable Income Over</th>
							<th>For Heads of Household With Taxable Income Over</th>
						</tr>
					</thead>
					<tbody class="money">
                        <c:forEach items="${taxRates}" var="n">
                            <tr>
                                <td class="center">${n.taxRate}%</td>
                                <td class="center">${n.formattedSSalaryS}</td>
                                <td class="center">${n.formattedSSalaryMFJ}</td>
                                <td class="center">${n.formattedSSalaryHH}</td>

                            </tr>
                        </c:forEach>
					</tbody>
				</table>
				<p>Individuals who make the lowest amount of income are placed
					into
					the lowest marginal tax rate bracket,while higher-earning
					individuals are placed into higher marginal tax brackets. However,
					the marginal tax bracket in which an individual falls does not
					determine how the entire income is taxed. Instead, income taxes are
					assessed progressively, with each bracket having a range of income
					values that are taxed at a particular rate.
				</p>

				<p>
					Under the current plan, if a
					<span class="replacable">${code}
					</span>
					taxpayer earned
					<span class="replacable">${salary}</span>
					in
					taxable income, they would owe the following income taxes for
					<span class="replacable">${year}</span>
					(due in April
					<span class="replacable">${yearDue}</span>
					), as shown below:
				</p>
				<ul>
                    <c:forEach items="${leBracket}" var="n">
                        <li>

                            <Strong>${n.bracket}</Strong> ${n.calculateDescription}
                        </li>
                    </c:forEach>
				</ul>
				<p>
					If you add up these amounts, the entire tax liability for this
					individual would be
					<span class="replacable">$${total}</span>
					, or
					an effective tax rate of
					<span class="replacable">${percentage}</span>
					<span class="replacable">($${total} / $${salary})</span>
				</p>
			</div>
		</div>
	</body>
</html>
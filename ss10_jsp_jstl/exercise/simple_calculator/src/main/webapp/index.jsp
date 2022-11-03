<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/3/2022
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<form method="post" action="/calculate">
    <span>First Operand: <input type="text" name="first-operand"></span>
    <span>Second Operand: <input type="text" name="second-operand"></span>
    <span>
    <select name="operator">
    <option value="+">Addition</option>
    <option value="-">Subtraction</option>
    <option value="*">Multiplication</option>
    <option value="/">Division</option>
  </select>
</span>
    <span>
    <button type="submit" value="Calculate">Calculate</button>
</span>
</form>
</body>
</html>

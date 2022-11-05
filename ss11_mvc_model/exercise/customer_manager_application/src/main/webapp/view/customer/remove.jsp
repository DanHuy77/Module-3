<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/5/2022
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer Remove</title>
</head>
<body>
<form action="/customer?action=remove" method="post">
    <h3>Are you sure?</h3>
    <table>
        <tr>
            <td hidden>ID</td>
            <td>Tên</td>
            <td>Email</td>
            <td>Địa Chỉ</td>
        </tr>

        <tr>
            <td hidden><input type="text" name="id" value="${customer.getId()}"></td>
            <td><input type="text" name="name" value="${requestScope["customer"].getName()}"></td>
            <td><input type="text" name="email" value="${requestScope["customer"].getEmail()}"></td>
            <td><input type="text" name="address" value="${requestScope["customer"].getAddress()}"></td>
        </tr>
    </table>
    <button>Remove</button>
</form>
<a href="/customer"><button>Back to Customer List</button></a>
</body>
</html>

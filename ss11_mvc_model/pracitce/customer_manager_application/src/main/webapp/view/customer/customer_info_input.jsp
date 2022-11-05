<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/4/2022
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer Info Input</title>
</head>
<body>
<h1>Add new Customer</h1>
<a href="/customer"><button>Back to Customer List</button></a>
<c:if test="${message!=null}">
    <span>${message}</span>
</c:if>
<form action="/customer?action=add" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td>Tên</td>
            <td>Email</td>
            <td>Địa Chỉ</td>
        </tr>
        <tr>
            <td>
                <input type="text" name="id">
            </td>
            <td><input type="text" name="name"></td>
            <td><input type="text" name="email"></td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td><button>Confirm</button></td>
        </tr>
    </table>
</form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/4/2022
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<h1 style="text-align: center">Edit Customer Info</h1>
<p>
    <a href="/customer"><button>Back to Customer List</button></a>
    <c:if test="${message!=null}">
        <span>${message}</span>
    </c:if>
</p>

<form action="/customer?action=edit" method="post">
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
    <button>Edit</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>

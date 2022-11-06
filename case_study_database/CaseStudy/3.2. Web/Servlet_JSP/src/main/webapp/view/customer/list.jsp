<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/6/2022
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<h1 style="text-align: center">Danh sách khách hàng</h1>
<a href="/customers?action=add"> <button style="float: right" class="btn btn-primary">Add new Customer</button></a>
<table class="table table-success">
    <tr>
        <th hidden>ID</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Số CMND</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Loại khách</th>
        <th>Update</th>
        <th>Delete</th>
        <th>View</th>
    </tr>
    <c:forEach var="customers" items="${customersList}">
        <tr>
            <td hidden><a style="text-: none" name="id">${customers.getId()}</a></td>
            <td>${customers.getName()}</td>
            <td>${customers.getBirthday()}</td>
            <td>${customers.isGender()}</td>
            <td>${customers.getIdNumber()}</td>
            <td>${customers.getPhoneNumber()}</td>
            <td>${customers.getPhoneNumber()}</td>
            <td>${customers.getEmail()}</td>
            <td >${customers.getAddress()}</td>
            <td><a href="/customer?action=edit&id=${customers.getId()}"><button class="btn btn-success">Edit</button></a></td>
            <td><a href="/customer?action=remove&id=${customers.getId()}"><button class="btn btn-danger">Remove</button></a></td>
            <td><a href="/customer?action=view&id=${customers.getId()}"><button class="btn btn-secondary">View</button></a></td>
        </tr>
    </c:forEach>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>

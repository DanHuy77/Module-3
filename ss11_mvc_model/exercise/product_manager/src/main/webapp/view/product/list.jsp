<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/5/2022
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<h1 style="text-align: center">Product List</h1>
<a href="/product?action=add"> <button style="float: right" class="btn btn-primary">Add new Product</button></a>
<table class="table table-success">
    <tr>
        <th hidden>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Mô Tả</th>
        <th>Nhà Sản Xuất</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>View</th>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td hidden><a style="text-: none" name="id">${product.getId()}</a></td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td >${product.getDescription()}</td>
            <td >${product.getProducer()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}"><button class="btn btn-success">Edit</button></a></td>
            <td><a href="/product?action=remove&id=${product.getId()}"><button class="btn btn-danger">Remove</button></a></td>
            <td><a href="/product?action=view&id=${product.getId()}"><button class="btn btn-secondary">View</button></a></td>
        </tr>
    </c:forEach>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/5/2022
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<h1 style="text-align: center">Edit Product Info</h1>
<p>
    <a href="/product"><button>Back to Product List</button></a>
    <c:if test="${message!=null}">
        <span>${message}</span>
    </c:if>
</p>

<form action="/product?action=edit" method="post">
    <table>
        <tr>
            <td hidden>ID</td>
            <th>Tên</th>
            <th>Giá</th>
            <th>Mô Tả</th>
            <th>Nhà Sản Xuất</th>
        </tr>

        <tr>
            <td hidden><input type="text" name="id" value="${product.getId()}"></td>
            <td><input type="text" name="name" value="${requestScope["product"].getName()}"></td>
            <td><input type="text" name="price" value="${requestScope["product"].getPrice()}"></td>
            <td><input type="text" name="description" value="${requestScope["product"].getDescription()}"></td>
            <td><input type="text" name="producer" value="${requestScope["product"].getProducer()}"></td>
        </tr>
    </table>
    <button>Edit</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>

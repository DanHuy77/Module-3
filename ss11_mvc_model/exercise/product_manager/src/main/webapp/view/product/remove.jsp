<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/5/2022
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Remove</title>
</head>
<body>
<form action="/product?action=remove" method="post">
    <h3>Are you sure?</h3>
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
            <td><input type="text" name="email" value="${requestScope["product"].getPrice()}"></td>
            <td><input type="text" name="address" value="${requestScope["product"].getDescription()}"></td>
            <td><input type="text" name="address" value="${requestScope["product"].getProducer()}"></td>
        </tr>
    </table>
    <button>Remove</button>
</form>
<a href="/product"><button>Back to Customer List</button></a>
</body>
</html>

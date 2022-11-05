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
<form action="/product?action=remove&id=${product.getId()}" method="post">
    <h3>Are you sure?</h3>
    <table>
        <tr>
            <th>Tên</th>
            <th>Giá</th>
            <th>Mô Tả</th>
            <th>Nhà Sản Xuất</th>
        </tr>

        <tr>
            <td>${requestScope["product"].getName()}</td>
            <td>${requestScope["product"].getPrice()}</td>
            <td>${requestScope["product"].getDescription()}</td>
            <td>"${requestScope["product"].getProducer()}</td>
        </tr>
    </table>
    <button>Remove</button>
</form>
<a href="/product"><button>Back to Customer List</button></a>
</body>
</html>

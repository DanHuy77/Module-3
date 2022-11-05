<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/5/2022
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Info Input</title>
</head>
<body>
<h1>Add new Product</h1>
<a href="/product"><button>Back to Product List</button></a>
<c:if test="${message!=null}">
    <span>${message}</span>
</c:if>
<form action="/product?action=add" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td>Tên</td>
            <td>Giá</td>
            <td>Mô Tả</td>
            <td>Nhà Sản Xuất</td>
        </tr>
        <tr>
            <td>
                <input type="text" name="id">
            </td>
            <td><input type="text" name="name"></td>
            <td><input type="text" name="price"></td>
            <td><input type="text" name="description"></td>
            <td><input type="text" name="producer"></td>
        </tr>
        <tr>
            <td><button>Confirm</button></td>
        </tr>
    </table>
</form>
</body>
</html>
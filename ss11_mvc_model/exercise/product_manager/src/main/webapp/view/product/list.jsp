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
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<h1 style="text-align: center">Danh sách sản phẩm</h1>
<a href="/product?action=add">
    <button style="float: right" class="btn btn-primary">Thêm mới sản phẩm</button>
</a>
<table class="table table-success">
    <tr>
        <th hidden>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Mô Tả</th>
        <th>Nhà Sản Xuất</th>
        <th>Chỉnh sửa</th>
        <th>Xóa</th>
        <th>Xem chi tiết</th>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td hidden><a name="id">${product.getId()}</a></td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">
                <button class="btn btn-success">Chỉnh sửa</button>
            </a></td>
            <td>
                <button class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#remove">
                    Xóa
                </button>
                <div class="modal fade" id="remove" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Chú ý!</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                Bạn có muốn xóa sản phẩm này không?
                            </div>
                            <div class="modal-footer">
                                <form action="/product?action=remove&id=${product.getId()}" method="post">
                                        <%-- <input name="id" value="${product.getId()}" hidden>--%>
                                    <span><button type="button" class="btn btn-secondary"
                                                  data-bs-dismiss="modal">Không</button></span>
                                    <span><button class="btn btn-primary">Xác nhận</button></span>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td><a href="/product?action=view&id=${product.getId()}">
                <button class="btn btn-secondary">Xem chi tiết</button>
            </a></td>
        </tr>
    </c:forEach>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>

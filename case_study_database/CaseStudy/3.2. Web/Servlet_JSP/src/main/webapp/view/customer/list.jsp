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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<h1 style="text-align: center">Danh sách khách hàng</h1>

<button type="button" style="float: right" class="btn btn-primary" data-bs-toggle="modal"
        data-bs-target="#add">Thêm mới khách hàng
</button>

<table class="table table-success">
    <tr>
        <th hidden>ID</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th hidden>Số CMND</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th hidden>Địa chỉ</th>
        <th>Loại khách</th>
        <th>Update</th>
        <th>Delete</th>
        <th>View</th>
    </tr>
    <c:forEach var="customers" items="${customersList}">
        <tr>
            <td hidden>${customers.getId()}</td>
            <td>${customers.getName()}</td>
            <td>${customers.getBirthday()}</td>
            <td>${customers.isGender()}</td>
            <td hidden>${customers.getIdNumber()}</td>
            <td>${customers.getPhoneNumber()}</td>
            <td>${customers.getEmail()}</td>
            <td hidden>${customers.getAddress()}</td>
            <td>${customers.getCustomerType()}</td>
            <td>
                <button class="btn btn-success" type="button" data-bs-toggle="modal"
                        data-bs-target="#edit">Edit
                </button>
            </td>
            <td>
                <button class="btn btn-danger" type="button" data-bs-toggle="modal"
                        data-bs-target="#remove">Remove
                </button>
            </td>
            <td><a href="/customer?action=view&id=${customers.getId()}">
                <button class="btn btn-secondary">View</button>
            </a></td>
        </tr>
        <div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabelRemove">Cập nhật thông tin</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="/customers?action=edit&id=${customers.getId()}" method="post">
                        <div class="modal-body">

                            <pre>Tên           <input name="name" value="${customers.getName()}"></pre>


                            <pre>Ngày Sinh     <input name="birthday" type="date"
                                                      value="${customers.getBirthday()}"></pre>


                            <pre>Giới tính     <select name="gender" style="width: 45%"
                                                       class="form-select form-control-sm"
                                                       aria-label="Default select example">
                                <option selected>${customers.isGender()}</option>
                                <option value="2">${!customers.isGender()}</option>
                            </select></pre>


                            <pre>Số CMND       <input name="idNumber" type="text"
                                                      value="${customers.getIdNumber()}"></pre>

                            <pre>Số điện thoại <input name="phoneNumber" type="text"
                                                      value="${customers.getPhoneNumber()}"></pre>


                            <pre>Email         <input name="email" type="text" value="${customers.getEmail()}"></pre>


                            <pre>Địa chỉ       <input name="address" type="text"
                                                      value="${customers.getAddress()}"></pre>

                            <pre>Loại khách    <select name="customerType" style="width: 45%"
                                                       class="form-select form-control-sm"
                                                       aria-label="Default select example">
                                <option value="Diamond" selected>Diamond</option>
                                <option value="Platinum">Platinum</option>
                                <option value="Gold">Gold</option>
                                <option value="Silver">Silver</option>
                                <option value="Member">Member</option>
                            </select></pre>
                        </div>

                        <div class="modal-footer">

                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                            <button type="submit" class="btn btn-primary">Lưu</button>

                        </div>
                    </form>
                </div>

            </div>

        </div>


        <div class="modal fade" id="remove${customers.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Chú ý!</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        Bạn có muốn xóa khách hàng này không?
                    </div>
                    <div class="modal-footer">
                        <form action="/customers?action=remove&id=${customers.getId()}" method="post">
                                <%-- <input name="id" value="${product.getId()}" hidden>--%>
                            <span><button type="button" class="btn btn-secondary"
                                          data-bs-dismiss="modal">Không</button></span>
                            <span><button class="btn btn-primary">Xác nhận</button></span>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </c:forEach>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelAdd">Thêm mới khách hàng</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customers?action=add" method="post">
                <div class="modal-body">

                    <pre>ID            <input name="id"></pre>

                    <pre>Tên           <input name="name"></pre>


                    <pre>Ngày Sinh     <input name="birthday" type="date"></pre>


                    <pre>Giới tính     <select name="gender" style="width: 45%; height: 70%"
                                               class="form-select form-control-sm"
                                               aria-label="Default select example">
                                <option value="1" selected>true</option>
                                <option value="2">false</option>
                            </select></pre>


                    <pre>Số CMND       <input name="idNumber" type="text"></pre>

                    <pre>Số điện thoại <input name="phoneNumber" type="text"></pre>


                    <pre>Email         <input name="email" type="text"></pre>


                    <pre>Địa chỉ       <input name="address" type="text"></pre>

                    <pre>Loại khách    <select name="customerType" style="width: 45%"
                                               class="form-select form-control-sm"
                                               aria-label="Default select example">
                                <option value="Diamond" selected>Diamond</option>
                                <option value="Platinum">Platinum</option>
                                <option value="Gold">Gold</option>
                                <option value="Silver">Silver</option>
                                <option value="Member">Member</option>
                            </select></pre>
                </div>

                <div class="modal-footer">

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                    <button type="submit" class="btn btn-primary">Xác nhận</button>

                </div>
            </form>
        </div>

    </div>

</div>
</body>
</html>

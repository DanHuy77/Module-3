package controller;

import model.CustomerType;
import model.Customers;
import service.ICustomerTypeService;
import service.ICustomersService;
import service.impl.CustomerTypeService;
import service.impl.CustomersService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import static jdk.nashorn.internal.runtime.regexp.joni.Syntax.Java;

@WebServlet(name = "controller.CustomersServlet", value = "/customers")
public class CustomersServlet extends HttpServlet {
    ICustomersService customersService = new CustomersService();
    ICustomerTypeService customerTypeService = new CustomerTypeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(request, response);
                break;
            case "edit":
                update(request, response);
                break;
            case "remove":
                remove(request, response);
            case "view":

            default:

        }
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        customersService.remove(id);
        response.sendRedirect("/customers");
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        Date birthday = Date.valueOf(request.getParameter("birthday"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idNumber = request.getParameter("idNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeCode = Integer.parseInt(request.getParameter("customerTypeCode"));
        Customers customers = new Customers(name,birthday,gender,idNumber,phoneNumber,email, address,customerTypeCode);
        boolean check = customersService.save(customers);
        String message = "Thêm mới không thành công";
        if (check){
            message = "Thêm mới thành công";
        }
        request.setAttribute("message", message);
        showCustomersList(request,response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if ("edit".equals(action)) {
        } else {
            showCustomersList(request, response);
        }
    }

    private void showCustomersList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customers> customersList = customersService.findAll();
        request.setAttribute("customersList", customersList);
        List<CustomerType> customerTypeList = customerTypeService.findAll();
        request.setAttribute("customerTypeList", customerTypeList);
        request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
    }
}

package controller;

import model.Customers;
import service.ICustomersService;
import service.impl.CustomersService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "controller.CustomersServlet", value = "/customers")
public class CustomersServlet extends HttpServlet {
    ICustomersService customersService = new CustomersService();

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

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        LocalDate birthday = LocalDate.parse(request.getParameter("birthday"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idNumber = request.getParameter("idNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String customerType = request.getParameter("customerType");
        Customers customers = new Customers(id, name, birthday, gender, idNumber, phoneNumber, email, address, customerType);
        customersService.save(customers);
        response.sendRedirect("/customers");
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        LocalDate birthday = LocalDate.parse(request.getParameter("birthday"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idNumber = request.getParameter("idNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String customerType = request.getParameter("customerType");
        Customers customers = customersService.findByID(id);
        customers.setName(name);
        customers.setBirthday(birthday);
        customers.setGender(gender);
        customers.setIdNumber(idNumber);
        customers.setPhoneNumber(phoneNumber);
        customers.setEmail(email);
        customers.setAddress(address);
        customers.setCustomerType(customerType);
        customersService.update(id, customers);
//        request.setAttribute("customers", customers);
//        request.setAttribute("message", "Updated");
//        request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        response.sendRedirect("/customers");
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
        request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
    }
}

package controller;

import model.Customer;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {

    private ICustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                save(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "remove":
                removeCustomer(request, response);
            default:
        }
    }

    private void removeCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findByID(id);
        customerService.remove(id);
        response.sendRedirect("/customer");
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = customerService.findByID(id);
        customer.setName(name);
        customer.setEmail(email);
        customer.setAddress(address);
        customerService.update(id, customer);
        request.setAttribute("customer", customer);
        request.setAttribute("message", "Updated");
        request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, name, email, address);
        customerService.save(customer);
        request.setAttribute("message", "Input Succeed");
        request.getRequestDispatcher("view/customer/customer_info_input.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showCustomerInputForm(request, response);
                break;
            case "edit":
                showCustomerEditForm(request, response);
                break;
            case "remove":
                showCustomerRemoveForm(request, response);
            case "view":
                showCustomerDetail(request, response);
            default:
                showCustomerList(request, response);
        }
    }

    private void showCustomerDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findByID(id);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/view/customer/view.jsp").forward(request,response);
    }

    private void showCustomerRemoveForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findByID(id);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/view/customer/remove.jsp").forward(request, response);
    }

    private void showCustomerEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findByID(id);

        if (customer == null) {
            request.getRequestDispatcher("view/customer/error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
        }
    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
    }

    private void showCustomerInputForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/customer/customer_info_input.jsp").forward(request, response);
    }
}

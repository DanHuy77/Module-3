import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customers = new ArrayList<>();

    static {
        customers.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaG-zRvboWmtcsDkkQN265IJXz9T_AIUwWgA&usqp=CAU"));
        customers.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnB0-WVphwGsWiUtUtewtaJbN8y2_JYi4r0w&usqp=CAU"));
        customers.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB_QXdutCfHI2pHJT2yCxFdO2IHOzFauVGuQ&usqp=CAU"));
        customers.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm6khwcQVea71OSRDqWljeBz8gyhQDba55DQ&usqp=CAU"));
        customers.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnB0-WVphwGsWiUtUtewtaJbN8y2_JYi4r0w&usqp=CAU"));


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("customer.jsp").forward(request, response);
    }
}

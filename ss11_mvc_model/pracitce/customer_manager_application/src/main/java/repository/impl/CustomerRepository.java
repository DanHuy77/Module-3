package repository.impl;

import model.Customer;
import repository.ICustomerRepository;

import java.util.ArrayList;
import java.util.List;


public class CustomerRepository implements ICustomerRepository {

    static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer(1, "Đặng Nhật Huy", "b77cwalk@gmail.com", "Hòa Xuân"));
    }


    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public void save(Customer customer) {
        customerList.add(customer);
    }

    @Override
    public Customer findByID(int ID) {
        for (int i = 0; i < customerList.size(); i++) {
            if (customerList.get(i).getId() == ID) {
                return customerList.get(i);
            }
        }
        return null;
    }

    @Override
    public void update(int id, Customer customer) {
        for (int i = 0; i < customerList.size(); i++) {
            if (customerList.get(i).getId() == id) {
                customerList.set(i, customer);
            }
        }
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i < customerList.size() ; i++) {
            if (customerList.get(i).getId() == id){
                customerList.remove(customerList.get(i));
            }
        }
    }
}

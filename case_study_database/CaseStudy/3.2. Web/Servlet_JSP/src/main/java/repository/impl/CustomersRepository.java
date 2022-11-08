package repository.impl;

import model.Customers;
import repository.ICustomersRepository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomersRepository implements ICustomersRepository {

    static List<Customers> customersList = new ArrayList<>();

    static {
        customersList.add(new Customers(1, "Đặng Nhật Huy", LocalDate.parse("1996-07-07"), true, "771996", "0799440683", "b77cwalk@gmail.com", "Cẩm Lệ", "Diamond"));
    }

    @Override
    public List<Customers> findAll() {
        return customersList;
    }

    @Override
    public void save(Customers customers) {
        customersList.add(customers);
    }

    @Override
    public Customers findByID(int id) {
        for (int i = 0; i < customersList.size(); i++) {
            if (customersList.get(i).getId() == id) {
                return customersList.get(i);
            }
        }
        return null;
    }

    @Override
    public void update(int id, Customers customers) {
        for (int i = 0; i < customersList.size(); i++) {
            if (customersList.get(i).getId() == id) {
                customersList.set(i, customers);
            }
        }
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i < customersList.size(); i++) {
            if (customersList.get(i).getId() == id) {
                customersList.remove(customersList.get(i));
            }
        }
    }

    @Override
    public Customers searchByName(String name) {
        for (int i = 0; i < customersList.size(); i++) {
            if (customersList.get(i).getName().matches(name)) {
                return customersList.get(i);
            }
        }
        return null;
    }
}

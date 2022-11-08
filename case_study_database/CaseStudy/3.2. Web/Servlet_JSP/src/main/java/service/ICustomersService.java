package service;

import model.Customers;

import java.util.List;

public interface ICustomersService {
    List<Customers> findAll();
    boolean save(Customers customers);
    Customers findByID(int id);
    void update(int id, Customers customers);
    void remove(int id);
    Customers searchByName(String name);
}

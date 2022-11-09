package service;

import model.Customers;

import java.util.List;

public interface ICustomersService {
    List<Customers> findAll();
    boolean save(Customers customers);
    Customers findByID(int id);
    boolean update(int id, Customers customers);
    boolean remove(int id);
    Customers searchByName(String name);
}

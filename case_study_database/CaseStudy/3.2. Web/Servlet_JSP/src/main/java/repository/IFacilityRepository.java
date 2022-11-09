package repository;

import model.Customers;
import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAll();
    boolean save(Facility facility);
    Facility findByID(int id);
    boolean update(int id, Facility facility);
    boolean remove(int id);
    Facility searchByName(String name);
}

package repository.impl;

import model.Facility;
import repository.IFacilityRepository;

import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    @Override
    public List<Facility> findAll() {
        return null;
    }

    @Override
    public boolean save(Facility facility) {
        return false;
    }

    @Override
    public Facility findByID(int id) {
        return null;
    }

    @Override
    public boolean update(int id, Facility facility) {
        return false;
    }

    @Override
    public boolean remove(int id) {
        return false;
    }

    @Override
    public Facility searchByName(String name) {
        return null;
    }
}

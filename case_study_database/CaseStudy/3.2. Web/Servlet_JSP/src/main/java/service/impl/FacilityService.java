package service.impl;

import model.Facility;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
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

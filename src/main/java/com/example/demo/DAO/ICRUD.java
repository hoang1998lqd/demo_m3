package com.example.demo.DAO;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ICRUD<E>{
    ArrayList<E> findAll();
    void create (E e);
    void update (E e) throws SQLException;
    void deleteById(int id) throws SQLException;
    E findById(int id) throws SQLException;
}

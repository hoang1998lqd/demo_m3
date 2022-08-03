package com.example.demo.service;

import com.example.demo.DAO.CustomerRepository;
import com.example.demo.DAO.ICRUD;
import com.example.demo.model.Customer;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CustomerService implements ICRUD<Customer> {
    private final CustomerRepository repository = new CustomerRepository();
    @Override
    public ArrayList<Customer> findAll() {
        return repository.findAll();
    }

    @Override
    public void create(Customer customer) {
        repository.create(customer);
    }

    @Override
    public void update(Customer customer) throws SQLException {
        repository.update(customer);
    }

    @Override
    public void deleteById(int id) throws SQLException {
        repository.deleteById(id);
    }

    @Override
    public Customer findById(int id) throws SQLException {
        return repository.findById(id);
    }




    public int checkTagName(String tagName, ArrayList<Customer> customers){
        for (Customer customer : customers){
            if (customer.getAccount().equals(tagName)){
                return 1;
            } else if (customer.getPhone().equals(tagName)) {
                return 2;
            } else if (customer.getEmail().equals(tagName)) {
                return 3;
            } else if (customer.getPassword().equals(tagName)) {
                return 4;
            }
        }
        return 0;
    }


    //Validate email phone

    public boolean checkEmailByCharacter (String email){
        String regex = "^[a-zA-Z]+[a-zA-Z\\d]*@\\w+mail.com$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.find();
    }

    public boolean checkPhoneByChar(String phone){
        String regex = "^0[3-9][1-9]\\d{7}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phone);
        return matcher.find();
    }

    // Check Phone
    public int checkPhone(String phone, ArrayList<Customer> customers){
        if (checkTagName(phone,customers) == 2){
            // Kiểm tra trùng Phone trong list Customer
            return 1;
        } else if (checkPhoneByChar(phone)) {
            return 2;
        }
        return 0;
    }

    public void updatePassword(Customer customer) throws SQLException {
        repository.updatePassword(customer);
    }

    // Check password có ký tự là số
    public boolean checkPassword(String pass, ArrayList<Customer> customers){
        String regex = "^\\d{6,8}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(pass);
        return matcher.find();
    }

    public int checkPass(String pass, ArrayList<Customer> customers){
        if(checkTagName(pass,customers)==4){
            return 1;
        } else if (checkPassword(pass,customers)) {
            return 2;
        }
        return 0;
    }

    // Check Email
    public int checkEmail(String email, ArrayList<Customer> customers){
        if (checkTagName(email,customers) == 3){
            // Kiểm tra trùng Email trong list Customer
            return 1;
        } else if (checkEmailByCharacter(email)) {
            // Kiểm tra Regex Email
            return 2;
        }
        return 0;
    }

    // Tìm tài khoản để hiển thị thông qua Account

    public Customer findCustomerByAccount(String account, ArrayList<Customer> customers){
        for (Customer customer : customers){
            if (customer.getAccount().equals(account) || customer.getEmail().equals(account)){
                return customer;
            }
        }
        return null;
    }



}

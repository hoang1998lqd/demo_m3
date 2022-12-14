package com.example.demo.DAO;

import com.example.demo.connection.connectMySQL;
import com.example.demo.model.Brand;
import com.example.demo.model.Category;
import com.example.demo.model.Product;
import com.example.demo.model.ProductStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductRepository {
    private final com.example.demo.connection.connectMySQL connectMySQL = new connectMySQL();
    private final CategoryRepository categoryRepository = new CategoryRepository();
    private final BrandRepository brandRepository = new BrandRepository();
    private final String SELECT_ALL_PRODUCT = "select * from product";
    private final String INSERT_PRODUCT = "insert into product(name, price, description, image, amount,category_id,discount,brand_id)" +
            "value(?,?,?,?,?,?,?,?)";
    private final String DELETE_PRODUCT_BY_ID = "delete from product where id = ?";
    private final String SELECT_PRODUCT_BY_ID = "select * from product where id = ?";
    private final String UPDATE_PRODUCT = "update product set name = ?, price = ?, description = ?, image = ?" +
            ", amount = ?,category_id = ?, discount = ?, brand_id = ? where id = ?";

    private final String SELECT_PRODUCT_BY_CATEGORY = "select * from product where product.category_id = ?";
    private final String SELECT_PRODUCT_BY_BRAND = "select * from product where product.brand_id = ?";
    private final String SELECT_PRODUCT_BY_BRAND_AND_CATEGORY = "select * from product where product.category_id = ? " +
            "and product.brand_id = ?";
    private final String SELECT_TOP3_PRODUCT_BUY = "select product_id from product_buy order by tong desc limit 3";

    private final String SELECT_SEARCH = "select * from product where name like ?";


    private Product getProduct(int id, ResultSet resultSet) throws SQLException {
        String name = resultSet.getString("name");
        int price = resultSet.getInt("price");
        String description = resultSet.getString("description");
        String img = resultSet.getString("image");
        int amount = resultSet.getInt("amount");
        int category_id = resultSet.getInt("category_id");
        Category category = categoryRepository.findById(category_id);
        int status = resultSet.getInt("status");
        int discount = resultSet.getInt("discount");
        int brand_id = resultSet.getInt("brand_id");
        Brand brand = brandRepository.findById(brand_id);
        return  new Product(id,name,price,description,img,amount,category,status,discount,brand);
    }
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;


    // T??m ki???m s???n ph???m theo danh m???c
    public  ArrayList<Product> findProductByCategory(int id){
        ArrayList<Product> products = new ArrayList<>();
        try{
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(SELECT_PRODUCT_BY_CATEGORY);
            statement.setInt(1,id);
            resultSet =statement.executeQuery();
            while (resultSet.next()){
                int idProduct  = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String img = resultSet.getString("image");
                int amount = resultSet.getInt("amount");
                Category category = categoryRepository.findById(id);
                int status = resultSet.getInt("status");
                int discount = resultSet.getInt("discount");
                int brand_id = resultSet.getInt("brand_id");
                Brand brand = brandRepository.findById(brand_id);
                products.add(new Product(idProduct,name,price,description,img,amount,category,status,discount,brand));
            }

        }catch (SQLException e){
            System.err.println(e.getMessage());
        }
        return products;
    }

    // T??m ki???m g???n ????ng
    public ArrayList<Product>searchProduct(String search){
        ArrayList<Product> products = new ArrayList<>();
        try{
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(SELECT_SEARCH);
            statement.setString(1,"%" + search + "%");
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                int idProduct = resultSet.getInt("id");
                products.add(findById(idProduct));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }


    // T??m ki???m top 3 s???n ph???m b??n ch???y nh???t
    public ArrayList<Product>findProductTop(){
        ArrayList<Product> products = new ArrayList<>();
        try {
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(SELECT_TOP3_PRODUCT_BUY);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                int idProduct = resultSet.getInt("product_id");
                Product product = findById(idProduct);
                products.add(product);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }

    // T??m ki???m s???n ph???m theo th????ng hi???u
    public ArrayList<Product> findProductByBrand(int id){
        ArrayList<Product> products = new ArrayList<>();
        try{
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(SELECT_PRODUCT_BY_BRAND);
            statement.setInt(1,id);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                int idProduct  = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String img = resultSet.getString("image");
                int amount = resultSet.getInt("amount");
                int category_id = resultSet.getInt("category_id");
                Category category = categoryRepository.findById(category_id);
                int status = resultSet.getInt("status");
                int discount = resultSet.getInt("discount");
                Brand brand = brandRepository.findById(id);
                Product product = new Product(idProduct,name,price,description,img,amount,category,status,discount,brand);
                products.add(product);
            }
        }catch (SQLException e){
            System.err.println(e.getMessage());
        }
        return products;
    }

    // T??m ki???m s???n ph???m theo th????ng hi???u v?? danh m???c

    public ArrayList<Product> findProductByBrandCategory(int category_id, int brand_id){
        ArrayList<Product> products = new ArrayList<>();
        try{
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(SELECT_PRODUCT_BY_BRAND_AND_CATEGORY);
            statement.setInt(1,category_id);
            statement.setInt(2,brand_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                int idProduct  = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String img = resultSet.getString("image");
                int amount = resultSet.getInt("amount");
                Category category = categoryRepository.findById(category_id);
                int status = resultSet.getInt("status");
                int discount = resultSet.getInt("discount");
                Brand brand = brandRepository.findById(brand_id);
                Product product = new Product(idProduct,name,price,description,img,amount,category,status,discount,brand);
                products.add(product);
            }

        }catch (SQLException e){
            System.err.println(e.getMessage());
        }
        return products;
    }


    public Product findById(int id) {
        try {
            connection = connectMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return getProduct(id, resultSet);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Product> findAll() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            Connection connection = connectMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Product product = getProduct(id, resultSet);
                products.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return products;
    }


    public void create(Product product) {
        try {
            PreparedStatement preparedStatement = getPreparedStatement(INSERT_PRODUCT, product);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public void update(Product product) {
        try {
            PreparedStatement preparedStatement = getPreparedStatement(UPDATE_PRODUCT, product);
            preparedStatement.setInt(9,product.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());;
        }
    }

    private PreparedStatement getPreparedStatement(String SQL, Product product) throws SQLException {
        Connection connection = connectMySQL.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1, product.getName());
        preparedStatement.setInt(2, product.getPrice());
        preparedStatement.setString(3, product.getDescription());
        preparedStatement.setString(4, product.getImg());
        preparedStatement.setInt(5, product.getAmount());
        preparedStatement.setInt(6,product.getCategory().getId());
        preparedStatement.setInt(7,product.getDiscount());
        preparedStatement.setInt(8,product.getBrand().getId());
        return preparedStatement;
    }

//    name, price, description, image, amount,category_id,discount,brand_id

    public void deleteById(int id) {
        try {
            Connection connection = connectMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }
}

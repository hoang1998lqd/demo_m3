package com.example.demo.DAO;

import com.example.demo.connection.connectMySQL;
import com.example.demo.model.Brand;
import com.example.demo.model.Category;
import com.example.demo.model.Product;

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
            "amount = ?,category_id = ?, discount = ?, brand_id = ? where id = ?";


    public static void main(String[] args) {
        Category category = new Category(1,"Máy tính");
        Brand brand = new Brand(1,"Dell");
        Product product = new Product("Laptop Dell Gaming G15 5515",23500000,
                "Dell inspiron 5515 là một cái tên quá hot trong năm 2021 và nửa đầu năm 2022. Khi Dell tung ra một " +
                        "loạt các sản phẩm giá rẻ trong thời điểm giữa năm 2021, thì Inspiron 5515 nổi bật như một best " +
                        "choice trong phân khúc dưới 20 triệu. Vậy Dell 5515 có những điểm gì nổi bật mà lại được ưu ái " +
                        "đến vậy. Hãy cùng tìm hiểu qua bài viết dưới đây của Electronic Store nhé !",
                "https://laptop123.com.vn/upload/product/laptop-dell-g15-gia-soc.png",10,category,10,brand);
        ProductRepository productRepository = new ProductRepository();
        productRepository.create(product);
    }

    private Product getProduct(int id, ResultSet resultSet) throws SQLException {
        String name = resultSet.getString("name");
        int price = resultSet.getInt("price");
        String description = resultSet.getString("description");
        String img = resultSet.getString("image");
        int amount = resultSet.getInt("amount");
        int category_id = resultSet.getInt("category_id");
        Category category = categoryRepository.findById(category_id);
        int discount = resultSet.getInt("discount");
        int brand_id = resultSet.getInt("brand_id");
        Brand brand = brandRepository.findById(brand_id);
        return new Product(name, price, description, img, amount, category,discount,brand);
    }

    public Product findById(int id) {
        try {
            Connection connection = connectMySQL.getConnection();
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

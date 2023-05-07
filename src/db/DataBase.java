package db;



import db.models.UserOffer;

import java.sql.*;
import java.util.ArrayList;

public class DataBase {

    private String url;
    private String user;
    private String password;

    public DataBase(String url, String user, String password) {
        this.url = url;
        this.user = user;
        this.password = password;
    }

    public Connection getDbConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

   public ArrayList<UserOffer> getUserOffers(int userId) throws SQLException {
        ArrayList<UserOffer> usersOffers = new ArrayList<>();

        Connection connection = this.getDbConnection();
        String sql = "SELECT brand, model, insurer, price FROM (Users INNER JOIN Vehicles ON Users.login = Vehicles.login) " +
       " INNER JOIN Insurance_offers ON Vehicles.id = Insurance_offers.vehicle_id" +
       " WHERE Users.id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, userId);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            String brand = resultSet.getString("brand");
            String model = resultSet.getString("model");
            String insurer =  resultSet.getString("insurer");
            float price = resultSet.getFloat("price");
            UserOffer userOffer = new UserOffer(brand, model, insurer, price);
            usersOffers.add(userOffer);
        }

        connection.close();

        return usersOffers;
   }

   public boolean checkIfUserExists(int userId) throws SQLException {
       Connection connection = this.getDbConnection();
       String sql = "SELECT * FROM Users WHERE Users.id = ?";
       PreparedStatement statement = connection.prepareStatement(sql);
       statement.setLong(1, userId);
       ResultSet resultSet = statement.executeQuery();

       return resultSet.next();

   }


}

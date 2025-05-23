package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Load driver explicit
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String dbURL = "jdbc:mysql://localhost:3306/phar_db?useSSL=false&serverTimezone=UTC";
		String username = "root";
		String password = "";
		Connection conn = DriverManager.getConnection(dbURL, username, password);
		if (conn != null) {
			System.out.println("Kết nối thành công");
			return conn;
		}
		return null;
	}


	public static void closeConnection(Connection connection) throws SQLException {
		if (connection != null && !connection.isClosed()) {
			connection.close();
		}
	}

	public static void main(String[] args) {
		try (Connection conn = getConnection()) {
			if (conn != null) {
				System.out.println("Kết nối cơ sở dữ liệu thành công!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Lỗi kết nối: " + e.getMessage());
		}
	}
}
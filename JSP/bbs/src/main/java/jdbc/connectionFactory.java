package jdbc;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class connectionFactory {
	private String driver;
	private String url;
	private String id;
	private String pw;
	private int maxConn;
	private static connectionFactory instance = new connectionFactory();
	public static connectionFactory getInstance() {
		return instance;
	}
	private connectionFactory() {
		Properties prop = new Properties();
		InputStream reader = getClass().getClassLoader()
				.getResourceAsStream("config/db.properties");
		try {
			prop.load(reader);
			//파일에 작성된 정보 가져옴
			driver = prop.getProperty("driver");//driver = 내용
			url = prop.getProperty("url");
			id = prop.getProperty("id");
			pw = prop.getProperty("password");
			maxConn = Integer.parseInt(prop.getProperty("maxConn"));
			
			//드라이버 로딩
			Class.forName(driver);
			
		} catch (IOException e) {
			
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection() throws SQLException {
		Connection conn =DriverManager.getConnection(url, id, pw);
		return conn;
	}
	public static void main(String[] args) {
		connectionFactory test = connectionFactory.getInstance();
		try {
			Connection con = test.getConnection();
			System.out.println(con);
			System.out.println("접속됨");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getMaxConn() {
		return maxConn;
	}
	public void setMaxConn(int maxConn) {
		this.maxConn = maxConn;
	}
	
	
}

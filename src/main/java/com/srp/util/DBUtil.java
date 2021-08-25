package com.srp.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

//数据库相关配置
public class DBUtil {
    private static String driver;
    private static String url;
    private static String username;
    private static String password;

    static {
        try {
            // 1.通过当前类获取类加载器
            ClassLoader classLoader = DBUtil.class.getClassLoader();
            // 2.通过类加载器的方法获得一个输入流
            InputStream is = classLoader.getResourceAsStream("db.properties");
            // 3.创建一个properties对象
            Properties props = new Properties();
            // 4.加载输入流
            props.load(is);
            // 5.获取相关参数的值
            driver = props.getProperty("jdbc.driver");
            url = props.getProperty("jdbc.url");
            username = props.getProperty("jdbc.username");
            password = props.getProperty("jdbc.password");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 获取连接方法
     */
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("数据库对象实例化成功:)*_*(:");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }



    //关闭数据库
    public static void close(Connection connection,PreparedStatement preparedStatement, ResultSet resultSet) throws SQLException {
        if (resultSet!=null)
            resultSet.close();

        if (preparedStatement!=null)
            preparedStatement.close();

        if (connection!=null)
            connection.close();
        System.out.println("数据库对象销毁成功:)~_~(:");
    }

    public static void close(Connection connection,PreparedStatement preparedStatement) throws SQLException {
        if (preparedStatement!=null)
            preparedStatement.close();

        if (connection!=null)
            connection.close();
        System.out.println("数据库对象销毁成功:)~_~(:");
    }

    public static void close(Connection connection) throws SQLException {
        if (connection!=null)
            connection.close();
        System.out.println("数据库对象销毁成功:)~_~(:");
    }

}

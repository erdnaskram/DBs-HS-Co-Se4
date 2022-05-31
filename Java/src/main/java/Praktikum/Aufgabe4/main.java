package Praktikum.Aufgabe4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

public class main {
    static final String DB_URL = "jdbc:mysql://localhost:3306/wwfmaba";
    static final String USER = "root";
    static final String PASS = "G$aPh$FM(TB7hRbQDtiSJGmU@bVu";

//   FLUG '2022-07-24', 312, 'D-ABYZ'
//   MERKMAL 3, 'Kafeevollautomat'
//   FLUGZEUGTYP 'A320', 'Airbus',40000

    public static void main(String[] args) {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

        try {
            System.out.println("Geben Sie die Tabelle an, in die Sie einen Datensatz schreiben wollen");
            String table = in.readLine();
            System.out.println("Geben Sie die Werte an");
            String value = in.readLine();
            insertSQL(table, value);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    public static boolean insertSQL(String table, String value){
        String sql = "INSERT INTO " + table + " VALUES (" + value + ")";
        try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement stmt = conn.createStatement();
        ) {
            System.out.println("Daten werden eingefügt...");
            stmt.executeUpdate(sql);
            System.out.println("Daten wurden ERFOLGREICH eingefügt...");
        } catch (SQLException e) {
            if(e.toString().contains("Duplicate entry")
                    && e.toString().contains("for key") ){
                System.err.println("Daten '" + value + "' existieren bereits");
            } else {
                e.printStackTrace();
            }
            return false;
        }
        return true;
    }

//    public static void test(){
//        try
//        {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection con= DriverManager.getConnection(DB_URL,USER,PASS);
//            Statement stmt=con.createStatement();
//            ResultSet rs=stmt.executeQuery("show databases;");
//            System.out.println("Connected");
//        }
//        catch(Exception e)
//        {
//            System.out.println(e);
//        }
//        insertSQL("Merkmal", "3, 'Kafeevollautomat'");
//        insertSQL("FlugzeugTyp", "'A320', 'Airbus',40000");
//    }
}

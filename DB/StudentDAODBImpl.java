/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.pccu.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class StudentDAODBImpl implements StudentDAO
{
    final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    final String CONN_STRING = "jdbc:mysql://localhost:3306/mydb?" +
                    "user=root&password=123456";
    @Override
    public void add(Student student) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            PreparedStatement pstmt = conn.prepareStatement("Insert into students (student_name, student_tel) values (?,?)");
            pstmt.setString(1, student.student_name);
            pstmt.setString(2, student.student_tel);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void update(Student student) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            PreparedStatement pstmt = conn.prepareStatement("Update students Set student_name=?, student_tel=? Where student_id=?");
            pstmt.setString(1, student.student_name);
            pstmt.setString(2, student.student_tel);
            pstmt.setInt(3, student.student_id);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void remove(Student student) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            PreparedStatement pstmt = conn.prepareStatement("Delete From students Where student_id=?");
            pstmt.setInt(1, student.student_id);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Student findById(int student_id) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            PreparedStatement pstmt = conn.prepareStatement("Select * from students where student_id = ?");
            pstmt.setInt(1, student_id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next())
            {
                Student s = new Student(rs.getInt(1), rs.getString(2), rs.getString(3));
                return s;
            }
            else
            {
                return null;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
            
    }

    @Override
    public ArrayList<Student> getAllStudents() {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);    
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from students Order By student_id");
            
            ArrayList<Student> mylist = new ArrayList();
            
            while(rs.next())
            {
                mylist.add(new Student(rs.getInt(1), rs.getString(2), rs.getString(3)));                
            }
            rs.close();
            stmt.close();
            conn.close();
            return mylist;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Student> getRangeStudents(int start, int size) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);    
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from students Order By student_id " +  
                    "Limit " + (start-1) + "," + size);
            
            ArrayList<Student> mylist = new ArrayList();
            
            while(rs.next())
            {
                mylist.add(new Student(rs.getInt(1), rs.getString(2), rs.getString(3)));                
            }
            rs.close();
            stmt.close();
            conn.close();
            return mylist;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}

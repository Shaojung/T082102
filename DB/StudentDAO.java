/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.pccu.student;

import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public interface StudentDAO {
    public void add(Student student);
    public void update(Student student);
    public void remove(Student student);
    public Student findById(int student_id);
    public ArrayList<Student> getAllStudents();        
    public ArrayList<Student> getRangeStudents(int start, int size);
}

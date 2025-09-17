package models;

import java.util.ArrayList;

public class Department {
    private String name;
    private ArrayList<Teacher> teachers;

    public Department(String name, ArrayList<Teacher> teachers){
        this.name = name;
        this.teachers = teachers;
    }

}

package models;

public class Course {
    private String name;
    private Teacher teacher;

    public Course(String name, Teacher teacher){
        this.name = name;
        this.teacher = teacher;
    }
}

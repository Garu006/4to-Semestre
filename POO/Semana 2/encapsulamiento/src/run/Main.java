package run;

import models.Course;
import models.Teacher;

import java.util.zip.CheckedOutputStream;

public class Main {
    public static void main(String[] args){
        Teacher teacher = new Teacher("Gabriel Rojas");
        Course course = new Course("Java programming", teacher);
    }
}

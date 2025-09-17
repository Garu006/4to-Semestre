package models;

public class Teacher {
    private String name;
    private Degree degree;

    public Teacher(String nameDegree){
        this.degree = new Degree(nameDegree);
    }

    public Teacher(String name, String nameDegree){ // el constructor se crea en el objeto
        this.name = name;
        this.degree = new Degree(nameDegree);
    }
}

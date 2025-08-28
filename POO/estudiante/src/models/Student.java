package models;

public class Student {
    //atributos
    private String firstName;
    private String lasttName;
    private String major;
    private float average;

    //Metodos - Constructor
    public Student() {
    }

    public Student(String firstName, String LastName, float average, String major) {
        this.lasttName = lasttName;
        this.major = major;
        this.average = average;
        this.firstName = firstName;
    }

    //getter y setter

    public float getAverage() {
        return average;
    }

    public void setAverage(float average) {
        this.average = average;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getLasttName() {
        return lasttName;
    }

    public void setLasttName(String lasttName) {
        this.lasttName = lasttName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    //toString()
    @Override // Toda clase tiene una clase padre, la clase object, por que aparece el icono del circulito
    public String toString() {
        return "Student{" +
                "firstName='" + firstName + '\'' +
                ", lasttName='" + lasttName + '\'' +
                ", major='" + major + '\'' +
                ", average=" + average +
                '}';
    }
}

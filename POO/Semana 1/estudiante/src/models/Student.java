package models;

public class Student {
    //atributos
    private String firstName;
    private String lastName;
    private String major;
    private float average;

    //Metodos - Constructor
    public Student() {
    }

    public Student(String firstName, String LastName, float average, String major) {
        this.lastName = lastName;
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

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lasttName) {
        this.lastName = lasttName;
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
                ", lastName='" + lastName + '\'' +
                ", major='" + major + '\'' +
                ", average=" + average +
                '}';
    }
}

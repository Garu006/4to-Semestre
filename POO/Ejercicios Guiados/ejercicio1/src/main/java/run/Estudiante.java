package run;

public class Estudiante {
    //atributos nombre, matricula, promedio
    String nombre;
    int matricula;
    double promedio;

    public Estudiante(String nombre, int matricula, double promedio)
    {
        this.nombre = nombre;
        this.matricula = matricula;
        this.promedio = promedio;
    }
    //metodo que indica si el estudiante aprobo
    public boolean aprobar()
    {
        return promedio >= 70;
    }

    //metodo para mostrar datos
    public String mostrarDatos(){
        return "Nombre: " + nombre + ", Matrícula: " + matricula + ", Promedio: " + promedio;
    }
}

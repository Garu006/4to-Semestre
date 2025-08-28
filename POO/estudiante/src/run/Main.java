package run;

import models.Student;

import javax.swing.*;

public class Main{
    //psmv shortcut
    public static void main(String[] args) {
        //sout shortcut
        System.out.println("Sesion 2, Miercoles, 27 de agosto");
        //variable primitivas
        //int
        int numero = 0;
        int Numero = 1;
        int numerO = 3;
        System.out.println(""+numero);
        System.out.println(""+Numero);
        System.out.println(""+numerO);
        //float
        float salario = 25000.00f; //especificar el tipo de formato, aunque funcionaria bien con un double pero consume mas memoria;
        System.out.println(""+salario);
        //double
        double promedio = salario*0.5;
        System.out.println(""+promedio);
        //strings
        //en java String es con mayuscula a que es una clase
        String carrera = "Ingeniería en sistemas de la información";
        System.out.println(""+carrera);
        JOptionPane.showMessageDialog(null,carrera);
        //Primer objeto
        Student student = new Student("Gabriel", "Rojas", 89, "Ingenieria en Sistemas");
        JOptionPane.showMessageDialog();
    }
}

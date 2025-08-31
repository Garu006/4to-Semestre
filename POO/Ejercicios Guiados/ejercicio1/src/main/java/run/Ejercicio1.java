package run;

public class Ejercicio1 {
    public static void main(String[] agrs){
        //Crear un objeto de la clase Persona
        Persona persona = new Persona();
        Coche coche = new Coche();
        Libro libro = new Libro();
        CuentaBancaria cuenta = new CuentaBancaria("Barak Obama", 2000);
        Estudiante estudiante = new Estudiante("Gabriel", 24010226, 89.55);

        //Asignar valores a los atributos
        persona.nombre = "Gabriel Rojas, ";
        persona.edad = 19;
        //
        coche.marca = "volkswagen";
        coche.coche = "bettle";
        coche.year = 1938;
        //
        libro.titulo = "El diario de Greg";
        libro.autor = "Jeff Kinney";
        libro.NumPaginas = 216;
        //
        cuenta.depositar(500);
        cuenta.retirar(100);
        //
        //Mostrar los datos de la persona
        System.out.println(cuenta.mostrarDatos());
        System.out.println(persona.mostrarDatos());
        System.out.println(coche.mostrarDatos());
        System.out.println(libro.mostrarDatos());
        System.out.println(estudiante.mostrarDatos());
        if (estudiante.aprobar())
        {
            System.out.println("El estudiante aprobó.");
        }else{
            System.out.println("El estudiante no aprobó.");
        }
    }
}

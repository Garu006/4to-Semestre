package run;

public class Libro {
    //atributos titulo, autor y NumPaginas
    String titulo;
    String autor;
    int NumPaginas;

    //Metodo para mostrar los datos
    public String mostrarDatos(){
        return "titulo: " + titulo + ", autor: " + autor + ", número de paginas: " + NumPaginas;
    }
}

package run;

public class CuentaBancaria {
    //atributos titular y saldo
    String titular;
    double saldo;

    //Constructor
    public CuentaBancaria(String titular, double saldoInicial)
    {
        this.titular = titular;
        this.saldo = saldoInicial;
    }

    //Metodo para depositar dinero
    public void depositar(double cantidad)
    {
        if (cantidad > 0)
        {
            saldo += cantidad; // Suma la cantidad al saldo
            System.out.println("El deposito ha sido efectuado, nuevo saldo: " + saldo);
        }else{
            System.out.println("La cantidad que vaya a depositar debe ser mayor a cero");
        }
    }

    //metodo para retirar el dinero
    public void retirar(double cantidad)
    {
        if (cantidad > 0 && cantidad <= saldo)
        {
            saldo -= cantidad; // se resta la cantidad al saldo
            System.out.println("El retiro ha sido efectuado, nuevo saldo: " + saldo);
        }else{
            System.out.println("Saldo insuficiente o cantidad ingresada invalida");
        }
    }

    //metodo para imprimir los datos
    public String mostrarDatos(){
        return "titular: " + titular + ", saldo: " + saldo;
    }
}

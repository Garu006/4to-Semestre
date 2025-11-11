package models;

public class Moto extends Vehiculo{
    public Moto(String marca, String modelo){
        super(marca, modelo)
    }

    @Override
    public String mover(){
        return toString() + "no avanza...";
    }

}

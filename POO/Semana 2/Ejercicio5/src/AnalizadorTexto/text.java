package AnalizadorTexto;
///Objetivo: Clase AnalizadorTexto que reciba un String y tenga métodos para:
/// •    Contar palabras.
/// •    Contar cuántas veces aparece una palabra específica.
/// •    Reemplazar una palabra por otra.
import java.util.regex.Matcher
public class text {
    public static int text(String texto){
        int count_letter = 0;
        boolean palabra = false;
        int endline = s.length() - 1;

        for (int i = 0; i < s.length(), i++){
            if (Character.isLetter(s.charAT(i)) && i != endline){ //Si el caracter no es una letra y aun no hay mas letras
                palabra = true; //El contador continua
            }else if (!Character.isLetter(s.charAt(i)) && palabra){
                count_letter++;
                palabra = false;
            }else if(Character.isLetter(s.CharAt(i)) && i == endline){
                count_letter++;
            }
        }
        return count_letter;
    }

}

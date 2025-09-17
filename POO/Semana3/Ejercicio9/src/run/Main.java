package run;

import models.Tablero;
import models.Jugador;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Tablero tablero = new Tablero();
        Scanner in = new Scanner(System.in);

        System.out.print("Nombre jugador 1 (X): ");
        Jugador player1 = new Jugador(in.nextLine().trim(), 'X');

        System.out.print("Nombre jugador 2 (O): ");
        Jugador player2 = new Jugador(in.nextLine().trim(), 'O');

        Jugador actual = player1;
        tablero.mostrar();

        while (true) {
            System.out.printf("%s (%c), ingresa fila y columna [1-3 1-3]: ",
                    actual.getNombre(), actual.getFicha());

            int f, c;
            try {
                f = in.nextInt() - 1;
                c = in.nextInt() - 1;
            } catch (InputMismatchException e) {
                System.out.println("Entrada inválida. Usa números 1..3 1..3.");
                in.nextLine(); // limpiar buffer
                continue;
            }

            if (!tablero.colocar(f, c, actual.getFicha())) {
                System.out.println("Movimiento inválido, intenta de nuevo.");
                continue;
            }

            tablero.mostrar();

            if (tablero.winner(actual.getFicha())) {
                System.out.printf("¡Ganó %s!%n", actual.getNombre());
                break;
            }

            if (tablero.estaLleno()) {
                System.out.println("Empate.");
                break;
            }

            actual = (actual == player1) ? player2 : player1;
        }

        in.close();
    }
}

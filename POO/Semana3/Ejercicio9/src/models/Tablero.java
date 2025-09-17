package models;

import java.util.Arrays;

public class Tablero {
    private final char[][] celdas = new char[3][3];

    public Tablero() {
        limpiar();
    }

    public void limpiar() {
        for (char[] fila : celdas) Arrays.fill(fila, ' ');
    }

    public boolean colocar(int fila, int col, char ficha) {
        if (!range(fila, col) || celdas[fila][col] != ' ') return false;
        celdas[fila][col] = ficha;   // <- ¡esto faltaba!
        return true;
    }

    public boolean winner(char f) {
        // filas y columnas
        for (int i = 0; i < 3; i++) {
            if (celdas[i][0] == f && celdas[i][1] == f && celdas[i][2] == f) return true;
            if (celdas[0][i] == f && celdas[1][i] == f && celdas[2][i] == f) return true;
        }
        // diagonales
        if (celdas[0][0] == f && celdas[1][1] == f && celdas[2][2] == f) return true;
        if (celdas[0][2] == f && celdas[1][1] == f && celdas[2][0] == f) return true;

        return false;
    }

    public boolean estaLleno() {
        for (char[] fila : celdas)
            for (char c : fila)
                if (c == ' ') return false;
        return true;
    }

    public void mostrar() {
        System.out.println();
        for (int i = 0; i < 3; i++) {
            System.out.printf(" %c | %c | %c%n", celdas[i][0], celdas[i][1], celdas[i][2]);
            if (i < 2) System.out.println("---+---+---");
        }
        System.out.println();
    }

    private boolean range(int f, int c) {
        return f >= 0 && f < 3 && c >= 0 && c < 3;  // <- estaba `c > 3`
    }
}




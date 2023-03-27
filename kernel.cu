
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <stdio.h>
using namespace std;
#include <string>
#include <vector>




__global__ void bajarBloquesKernel(int *c, const int *a, const int *b)
{
    int i = threadIdx.x;
    c[i] = a[i] + b[i];
}

int* generar_matriz(int filas, int columnas, int maximo) {

    int* tablero = new int[filas * columnas];

    srand(time(NULL));

    // Generar números aleatorios y almacenarlos en la matriz
    for (int i = 0; i < filas; i++) {
        for (int j = 0; j < columnas; j++) {
            tablero[i * columnas + j] = rand() % maximo + 1;
        }
    }

    return tablero;
}

// definición de la función
string seleccionarConfiguracion() {
    char ejecucion;
    int nivel, filas, columnas;
    string salida;
    cout << "Introduce el modo de ejecucion: ";
    cin >> ejecucion;
    cout << "Introduce el nivel de dificultad (1 o 2): ";
    cin >> nivel;
    cout << "Introduce el numero de filas del tablero: ";
    cin >> filas;
    cout << "Introduce el nivel numero de columnas del tablero: ";
    cin >> columnas;
    salida = string(1, ejecucion) + to_string(nivel) + to_string(filas) + to_string(columnas);
    return salida;
}

void print_matriz(int* matriz, int filas, int columnas) {
    for (int i = 0; i < (filas + 1); i++) {
        for (int j = 0; j < (columnas + 1); j++) {
            if (j == 0) {
                printf("%d ", i);

            }
            else if (i == 0) {
                printf("%d ", j);

            }
            else {
                printf("%d ", matriz[((i - 1) * columnas) + (j - 1)]);
            }
            //printf("%d ", matriz[i * columnas + j]);
        }
        printf("\n");
    }
    printf("\n");
}




int main() {

    int vidas, maximo, fila, columna = 5;

    // llamada a la función y guardado del resultado en una variable
    string salida = seleccionarConfiguracion();

    // impresión de la salida por pantalla
    cout << "La configuración elegida es: " << salida << endl;

    if (salida[1] == '1') {
        maximo = 4;
    }
    else {
        maximo = 6;
    }
    //Se resta 48 al valor de salida[x] para cambiar el valor de ascii al número que nos interesa
    int filas = salida[2] - 48;
    int columnas = salida[3] - 48;

    // Generar la matriz y mostrarla por pantalla
    int* tablero = generar_matriz(filas, columnas, maximo);

    print_matriz(tablero, filas, columnas);


    /*while (vidas > 0) {
        print_matriz(tablero, filas, columnas);
        printf("Haga la fila seleccionada")
        

    }*/

    return 0;
}




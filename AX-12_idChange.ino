#include <AX12A.h>
#define DirectionPin  (10u)     // Pin de control
#define BaudRate (1000000ul)    // Baud rate
#define ID     (1u)

void setup() {
     ax12a.begin(BaudRate, DirectionPin, &Serial);      // Encender el motor
     delay(1000);                                       // Tiempo de retraso de 1 segundo para que el motor se encienda
     ax12a.setID(ID, 4);                               // Cambiar el ID actual del motor al que se indica en el 
}                                                       // segundo parametro de la funcion setID

void loop() {

}

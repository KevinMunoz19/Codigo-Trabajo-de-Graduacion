#include "AX12A.h"

#define DirectionPin  (10u)
#define BaudRate    (1000000ul)
#define ID    (1u)            //ID del motor 1.
#define ID2   (2u)            //ID del motor 2.
#define ID3   (3u)            //ID del motor 3.
#define ID4   (4u)            //ID del motor 4.


const int buttonPinRW = 2;     //Boton para activar los motores para el mecanismo rimless wheel.
int buttonStateRW = 0;         //Variable para leer el estado del boton para el mecanismo rimless wheel.

const int buttonPinH = 3;      //Boton para activar los motores para el mecanismo hibrido.
int buttonStateH = 0;          //Variable para leer el estado del boton para el mecanismo hibrido.

int VMotor = 200;              //Variable para velocidad de motor.

void setup() {

  pinMode(buttonPinRW, INPUT);  //Declarar el pin 2 como entrada.
  pinMode(buttonPinH, INPUT);   //Declarar el pin 3 como entrada.
  
  ax12a.begin(BaudRate, DirectionPin, &Serial);     //Colocar el baud rate de trabajo, el pin de direccion y el serial para el motor
  ax12a.setEndless(ID, ON);                         //Usar el motor 1 en modo sin fin.
  ax12a.setEndless(ID2, ON);                        //Usar el motor 2 en modo sin fin.
  ax12a.setEndless(ID3, ON);                        //Usar el motor 3 en modo sin fin.
  ax12a.setEndless(ID4, ON);                        //Usar el motor 4 en modo sin fin.
}

void loop() {                                       // Con la funcion ax12a.turn se gira el motor que posee el ID correspondiente,
                                                    // en el sentido indicado, a la velocidad indicada.
  if (buttonStateRW == HIGH) {                      // Si el boton para el mecanismo rimless wheel se encuentra presionado, 
    ax12a.ledStatus(ID, ON);                        // girar el motor 1 y 2 a la velocidad de la variable VMotor.
    ax12a.turn(ID, RIGHT, VMotor);

    ax12a.ledStatus(ID2, ON);
    ax12a.turn(ID2, LEFT, VMotor);
  
  } else if (buttonStateRW == HIGH){                // Si el boton para el mecanismo hibrido se encuentra presionado,
    ax12a.ledStatus(ID, ON);                        // girar el motor 1, 2, 3 y 4 a la velocidad de la variable VMotor.
    ax12a.turn(ID, RIGHT, VMotor);

    ax12a.ledStatus(ID2, ON);
    ax12a.turn(ID2, LEFT, VMotor);

    ax12a.ledStatus(ID3, ON);
    ax12a.turn(ID3, LEFT, VMotor);

    ax12a.ledStatus(ID4, ON);
    ax12a.turn(ID4, RIGHT, VMotor);
  }

}

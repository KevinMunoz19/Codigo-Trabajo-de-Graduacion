%Codigo para simulacion de posicion x,z del mecanismo rimless wheel
%Kevin Munoz

%% Variables
% Arreglo de valores de theta entre -1 y 1 con un paso de 0.001 
\*theta=(-1:0.01:1);
% Largo de la pata
length=3.6;

%% Ecuaciones de Posicion
% Posicion z
z=(length)*(1-((theta.^2)/2));
%Posicion x
x=(0.5)*(length)*(theta.*(sqrt(1-(theta.^2))) + asin(theta));

%% Grafica
figure()
plot(x,z);
% Titulo de la grafica
title('Centro de Masa Mecanismo Rimless Wheel')
% Leyenda
legend("Trayectoria");
% Quitar caja de leyenda
legend('boxoff')
% Rango para grafica eje y
ylim([1 5])
% Rango para grafica eje x
xlim([-4 4])
% Nombre del eje x
xlabel('X (m)')
% Nombre del eje y
ylabel('Z (m)')

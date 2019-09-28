%% Funcion MeanVector
%Kevin Munoz
%% Funcion
% Entradas  tres vectores del mismo tamano, un valor int que indica el tamano de los vectores
% Salidas  un vector de tamano igual al de los vectores de entrada que
% contiene el valor medio para cada punto evaluado
function [MV,SDV] =MeanVector(MinVal,T1,T2,T3)
    Mean=[];
    StndDev=[];
    % Se crea un ciclo desde 1 hasta el valor indicado por el tamano de los
    % vectores, se recorren los vectores en la misma posicion, y se saca
    % una media de los tres valores.
    for i = 1:MinVal
        Array = [T1(i),T2(i),T3(i)];
        Mean(i)= mean(Array);
        StndDev(i)= std(Array);
    end
    MV = Mean';
    SDV =  StndDev';

end

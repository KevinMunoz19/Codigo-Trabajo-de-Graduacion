
%% Analisis de datos en Matlab
% Kevin Munoz

%% Lectura de Archivos CSV
%Variable para seleccionar archivos a leer, clasificados por velocidad de
%motor
string = '1000';

% Formar strings con el nombre de los archicos csv a leer para velocidad,
% aceleracion, desplazamiento vertical y tiempo

str1 = ['A1-',string,'.csv'];
str2 = ['A2-',string,'.csv'];
str3 = ['A3-',string,'.csv'];
str4 = ['HA1-',string,'.csv'];
str5 = ['HA2-',string,'.csv'];
str6 = ['HA3-',string,'.csv'];

str11 = ['S1-',string,'.csv'];
str12 = ['S2-',string,'.csv'];
str13 = ['S3-',string,'.csv'];
str14 = ['HS1-',string,'.csv'];
str15 = ['HS2-',string,'.csv'];
str16 = ['HS3-',string,'.csv'];

str21 = ['VD1-',string,'.csv'];
str22 = ['VD2-',string,'.csv'];
str23 = ['VD3-',string,'.csv'];
str24 = ['HVD1-',string,'.csv'];
str25 = ['HVD2-',string,'.csv'];
str26 = ['HVD3-',string,'.csv'];

str31 = ['T1-',string,'.csv'];
str32 = ['T2-',string,'.csv'];
str33 = ['T3-',string,'.csv'];

str41 = ['HT1-',string,'.csv'];
str42 = ['HT2-',string,'.csv'];
str43 = ['HT3-',string,'.csv'];


%Lectura de archivos .CSV de tiempo
Time1 = readtable(str31);
Time2 = readtable(str32);
Time3 = readtable(str33);

HTime1 = readtable(str41);
HTime2 = readtable(str42);
HTime3 = readtable(str43);

%Lectura archivos .CSV de Aceleracion
A1 = readtable(str1);
A2 = readtable(str2);
A3 = readtable(str3);
HA1 = readtable(str4);
HA2 = readtable(str5);
HA3 = readtable(str6);
%Lectura archivos .CSV de velocidad
S1 = readtable(str11);
S2 = readtable(str12);
S3 = readtable(str13);
HS1 = readtable(str14);
HS2 = readtable(str15);
HS3 = readtable(str16);
%Lectura archivos .CSV de desplazamiento vertical
VD1 = readtable(str21);
VD2 = readtable(str22);
VD3 = readtable(str23);
HVD1 = readtable(str24);
HVD2 = readtable(str25);
HVD3 = readtable(str26);

%% Interpolacion de datos

% Listado con datos entre 0 y 1 con un paso de 0.001
TimeStep=0:0.001:1;
TimeStep=TimeStep';

%Interpolacion de datos de aceleracion
InterpolationA1 = interp1(A1.Time, A1.Trajectory1, TimeStep, 'PCHIP');
InterpolationA2 = interp1(A2.Time, A2.Trajectory1, TimeStep, 'PCHIP');
InterpolationA3 = interp1(A3.Time, A3.Trajectory1, TimeStep, 'PCHIP');
InterpolationHA1 = interp1(HA1.Time, HA1.Trajectory1, TimeStep, 'PCHIP');
InterpolationHA2 = interp1(HA2.Time, HA2.Trajectory1, TimeStep, 'PCHIP');
InterpolationHA3 = interp1(HA3.Time, HA3.Trajectory1, TimeStep, 'PCHIP');
%Interpolacion de datos de velocidad
InterpolationS1 = interp1(S1.Time, S1.Trajectory1, TimeStep, 'PCHIP');
InterpolationS2 = interp1(S2.Time, S2.Trajectory1, TimeStep, 'PCHIP');
InterpolationS3 = interp1(S3.Time, S3.Trajectory1, TimeStep, 'PCHIP');
InterpolationHS1 = interp1(HS1.Time, HS1.Trajectory1, TimeStep, 'PCHIP');
InterpolationHS2 = interp1(HS2.Time, HS2.Trajectory1, TimeStep, 'PCHIP');
InterpolationHS3 = interp1(HS3.Time, HS3.Trajectory1, TimeStep, 'PCHIP');
%Interpolacion de datos de desplazamiento vertical
InterpolationVD1 = interp1(VD1.Time, VD1.Trajectory1, TimeStep, 'PCHIP');
InterpolationVD2 = interp1(VD2.Time, VD2.Trajectory1, TimeStep, 'PCHIP');
InterpolationVD3 = interp1(VD3.Time, VD3.Trajectory1, TimeStep, 'PCHIP');
InterpolationHVD1 = interp1(HVD1.Time, HVD1.Trajectory1, TimeStep, 'PCHIP');
InterpolationHVD2 = interp1(HVD2.Time, HVD2.Trajectory1, TimeStep, 'PCHIP');
InterpolationHVD3 = interp1(HVD3.Time, HVD3.Trajectory1, TimeStep, 'PCHIP');


%% Calculo de Media  trayectoria de Aceleracion, Velocidad y Desplazamiento Vertical
%Aceleracion
[AMean200,AStndDev200]=MeanVector(length(TimeStep),InterpolationA1,InterpolationA2,InterpolationA3);
[HAMean200,HAStndDev200]=MeanVector(length(TimeStep),InterpolationHA1,InterpolationHA2,InterpolationHA3);
%Velocidad
[SMean200,SStndDev200]=MeanVector(length(TimeStep),InterpolationS1,InterpolationS2,InterpolationS3);
[HSMean200,HSStndDev200]=MeanVector(length(TimeStep),InterpolationHS1,InterpolationHS2,InterpolationHS3);
%Desplazamiento Vertical
[VDMean200,VDStndDev200]=MeanVector(length(TimeStep),InterpolationVD1,InterpolationVD2,InterpolationVD3);
[HVDMean200,HVDStndDev200]=MeanVector(length(TimeStep),InterpolationHVD1,InterpolationHVD2,InterpolationHVD3);
%% Calculo de Media y Desviacion Estandar de cada corrida
%Media de aceleracion, velocidad y desplazamiento vertical mcanismo rimless wheel
MeanArrayA = [mean(InterpolationA1),mean(InterpolationA2),mean(InterpolationA3)]';
MeanArrayS = [mean(InterpolationS1),mean(InterpolationS2),mean(InterpolationS3)]';
MeanArrayVD = [mean(InterpolationVD1),mean(InterpolationVD2),mean(InterpolationVD3)]';
%Media de aceleracion, velocidad y desplazamiento vertical mcanismo hibrido
MeanArrayHA = [mean(InterpolationHA1),mean(InterpolationHA2),mean(InterpolationHA3)]';
MeanArrayHS = [mean(InterpolationHS1),mean(InterpolationHS2),mean(InterpolationHS3)]';
MeanArrayHVD = [mean(InterpolationHVD1),mean(InterpolationHVD2),mean(InterpolationHVD3)]';
%Desviacion Estandar de aceleracion, velocidad y desplazamiento vertical mcanismo rimless wheel
SDArrayA = [std(InterpolationA1),std(InterpolationA2),std(InterpolationA3)]';
SDArrayS = [std(InterpolationS1),std(InterpolationS2),std(InterpolationS3)]';
SDArrayVD = [std(InterpolationVD1),std(InterpolationVD2),std(InterpolationVD3)]';
%Desviacion Estandar de aceleracion, velocidad y desplazamiento vertical
%mecanismo hibrido
SDArrayHA = [std(InterpolationHA1),std(InterpolationHA2),std(InterpolationHA3)]';
SDArrayHS = [std(InterpolationHS1),std(InterpolationHS2),std(InterpolationHS3)]';
SDArrayHVD = [std(InterpolationHVD1),std(InterpolationHVD2),std(InterpolationHVD3)]';

%% Tablas de datos
%tabla de media y desviacion estandar para cada corrida para ambos
%mecanismos
TableData = [mean(InterpolationA1),mean(InterpolationA2),mean(InterpolationA3),mean(InterpolationHA1),mean(InterpolationHA2),mean(InterpolationHA3);
    std(InterpolationA1),std(InterpolationA2),std(InterpolationA3),std(InterpolationHA1),std(InterpolationHA2),std(InterpolationHA3);
    mean(InterpolationS1),mean(InterpolationS2),mean(InterpolationS3),mean(InterpolationHS1),mean(InterpolationHS2),mean(InterpolationHS3);
    std(InterpolationS1),std(InterpolationS2),std(InterpolationS3),std(InterpolationHS1),std(InterpolationHS2),std(InterpolationHS3);
    mean(InterpolationVD1),mean(InterpolationVD2),mean(InterpolationVD3),mean(InterpolationHVD1),mean(InterpolationHVD2),mean(InterpolationHVD3);
    std(InterpolationVD1),std(InterpolationVD2),std(InterpolationVD3),std(InterpolationHVD1),std(InterpolationHVD2),std(InterpolationHVD3)    ];

%tabla de tiempo para cada corrida para ambos
%mecanismos
TableDataTime = [Time1.Time_ms_(end);Time2.Time_ms_(end);Time3.Time_ms_(end);HTime1.Time_ms_(end);HTime2.Time_ms_(end);HTime3.Time_ms_(end)] / 1000

%%
%Resultados Aceleracion
subplot(3,1,1);
plot(TimeStep,AMean200);
hold on
plot(TimeStep,HAMean200);
hold on
legend({'Rimless Wheel','Hibrido'},'FontSize',6)
legend('boxoff')
strt1 = [' Aceleracion '];
title(strt1,'FontSize',10);
xlabel('Tiempo Normalizado','FontSize',8);
ylabel('Aceleracion (m/s^{2})','FontSize',8);

%Resultados Velocidad
subplot(3,1,2);
plot(TimeStep,SMean200);
hold on
plot(TimeStep,HSMean200);
hold on
legend({'Rimless Wheel','Hibrido'},'FontSize',6)
legend('boxoff')
strt2 = [' Velocidad '];
title(strt2,'FontSize',10);
xlabel('Tiempo Normalizado','FontSize',8);
ylabel('Velocidad (m/s)','FontSize',8);

%Resultados Velocidad
subplot(3,1,3);
plot(TimeStep,VDMean200);
hold on
plot(TimeStep,HVDMean200);
hold on
legend({'Rimless Wheel','Hibrido'},'FontSize',6)
legend('boxoff')
strt2 = [' Desplazamiento Vertical '];
title(strt2,'FontSize',10);
xlabel('Tiempo Normalizado','FontSize',8);
ylabel('Desplazamiento Vertical (cm)','FontSize',8);

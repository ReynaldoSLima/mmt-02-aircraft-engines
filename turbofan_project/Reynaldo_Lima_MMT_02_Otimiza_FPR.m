%% Exame de MMT-02
%  Reynaldo Santos de Lima
%  Código Otimiza_FPR:
%  "utilziando a função "Reynaldo_Lima_Exame_MMT_02_Regiao", com parâmetros
%  obtidos pelo estudo do envelope do motor (com PRT = 20 e TIT = 1520K),
%  segue-se o estudo para a otimização de FPR. BRP = 4 é fixo" 


clear;
clc

FPR = fminsearch(@(x) otimizaFPR(x), 1.5)
if FPR < 1.8    
    SFC = otimizaFPR(FPR)
else
    % Máximo de 1.8
    % Por ser um avião comercial, busca-se limitar a 1.8 para diminuir
    % ruídos
    SFC = otimizaFPR(1.8)
end

range = 1.4:0.01:3.4;

sfc1 = [];
fs1  = [];
sfc2 = [];
fs2  = [];
sfc3 = [];
fs3  = [];

for i=1:length(range)
    [SFC1, Fs1] = variandoFPR(range(i), 1480, 4);
    [SFC2, Fs2] = variandoFPR(range(i), 1500, 4);
    [SFC3, Fs3] = variandoFPR(range(i), 1520, 4);
    sfc1 = [sfc1, SFC1];
    fs1  = [fs1, Fs1];
    sfc2 = [sfc2, SFC2];
    fs2  = [fs2, Fs2];
    sfc3 = [sfc3, SFC3];
    fs3  = [fs3, Fs3];
end

figure = subplot(2, 1, 1);
polygon1 = [1.5 0.06;...
            1.8 0.06;...
            1.8 0.02;...
            1.5 0.02];
oinf1 = polyshape(polygon1);
plot(range, sfc1, 'b-', 'linewidth', 1.5)
hold on
plot(range, sfc2, 'y-', 'linewidth', 1.5)
plot(range, sfc3, 'r-', 'linewidth', 1.5)
plot(oinf1, 'EdgeColor',[0 0 1], 'FaceColor',[0 0 0.6]);

set(gca,'TickLabelInterpreter','latex', 'XLim', [1.4 3.4], 'YLim', [0.03, 0.05])
ax = gca;
ax.GridLineStyle = '-';
ax.GridColor = 'k';
ax.GridAlpha = 0.4; % maximum line opacity
grid on;
grid minor;
xlabel('$FPR$','Interpreter','latex', 'FontSize', 14);
ylabel('$SFC$ $[kg/h.N]$', 'FontSize', 14,'Interpreter','latex');
legend("$T = 1480K$", "$T = 1500K$", "$T = 1520K$", "Regi\~{a}o ideal",'Interpreter','latex', 'FontSize', 10, 'Location', 'best')

subplot(2,1,2)
polygon2 = [1.5 300;...
            1.8 300;...
            1.8 700;...
            1.5 700];
oinf2 = polyshape(polygon2);
plot(range, fs1, 'b-', 'linewidth', 1.5)
hold on
plot(range, fs2, 'y-', 'linewidth', 1.5)
plot(range, fs3, 'r-', 'linewidth', 1.5)
plot(oinf2, 'EdgeColor',[0 0 1], 'FaceColor',[0 0 0.6]);

set(gca,'TickLabelInterpreter','latex', 'XLim', [1.4 3.4], 'YLim', [360, 620])  
ax = gca;
ax.GridLineStyle = '-';
ax.GridColor = 'k';
ax.GridAlpha = 0.4; % maximum line opacity
grid on;
grid minor;
ylabel('$F_s$ $[N.s/kg]$','Interpreter','latex', 'FontSize', 14);
xlabel('$FPR$', 'FontSize', 14,'Interpreter','latex');
legend("$T = 1480K$", "$T = 1500K$", "$T = 1520K$", "Regi\~{a}o ideal",'Interpreter','latex', 'FontSize', 10, 'Location', 'best')

function [SFC] = otimizaFPR(FPR)
    % Valores de projeto, escolhidos do envelope:
    PRT = 20;
    TIT = 1520;
    BPR = 4;
        
    parametrosFixos.Rar = 8310/28.97;
    parametrosFixos.Rgas = 8310/29.13;
    parametrosFixos.T = 63; % kN
    parametrosFixos.etaExaustor = 0.96;
    parametrosFixos.etaEixo = 0.99;
    parametrosFixos.etaCombustao = 0.99;
    parametrosFixos.perdaComb = 0.02;
    parametrosFixos.gammaAr = 1.4;
    parametrosFixos.gammaGas = 1.333;
    parametrosFixos.cpAr = 1005;
    parametrosFixos.cpGas = 1148;
    parametrosFixos.etaPoli = 0.9;
    parametrosFixos.pa = 22.7; % kPa,  10972.8 altitude ~ 11km
    parametrosFixos.Ta = 216.8; % K 10972.8 altitude ~ 11km
    parametrosFixos.Va = 833/3.6; % m/s, 833 kmph, média 460 - 575 mph
    parametrosFixos.a = 295.2; % m/s, 10972.8 altitude ~ 11km
    % Fonte para altitude e velocidade:
    % https://www.flightdeckfriend.com/ask-a-pilot/how-fast-do-commercial-aeroplanes-fly

    
    [SFC, ~] = Reynaldo_Lima_Exame_MMT_02_Regiao(FPR, BPR, PRT, TIT, parametrosFixos);
    
end

function [SFC, Fs] = variandoFPR(FPR, TIT, BPR)
    % Valores de projeto, escolhidos do envelope:
    PRT = 20;
        
    parametrosFixos.Rar = 8310/28.97;
    parametrosFixos.Rgas = 8310/29.13;
    parametrosFixos.T = 63; % kN
    parametrosFixos.etaExaustor = 0.96;
    parametrosFixos.etaEixo = 0.99;
    parametrosFixos.etaCombustao = 0.99;
    parametrosFixos.perdaComb = 0.02;
    parametrosFixos.gammaAr = 1.4;
    parametrosFixos.gammaGas = 1.333;
    parametrosFixos.cpAr = 1005;
    parametrosFixos.cpGas = 1148;
    parametrosFixos.etaPoli = 0.9;
    parametrosFixos.pa = 22.7; % kPa,  10972.8 altitude ~ 11km
    parametrosFixos.Ta = 216.8; % K 10972.8 altitude ~ 11km
    parametrosFixos.Va = 833/3.6; % m/s, 833 kmph, média 460 - 575 mph
    parametrosFixos.a = 295.2; % m/s, 10972.8 altitude ~ 11km
    % Fonte para altitude e velocidade:
    % https://www.flightdeckfriend.com/ask-a-pilot/how-fast-do-commercial-aeroplanes-fly

    
    [SFC, Fs] = Reynaldo_Lima_Exame_MMT_02_Regiao(FPR, BPR, PRT, TIT, parametrosFixos);
    
end
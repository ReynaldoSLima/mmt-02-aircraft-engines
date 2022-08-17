%% Exame de MMT-02
%  Reynaldo Santos de Lima
%  Código gera_envelope:
%  "Amostram-se diversos pontos para o motor Turbofan. Fixando-se FPR e BPR
%  inicialmente, variam-se TIT e PRT de modo a estudar a região. Escolhe-se
%  uma semi-região para explorar a otimização de FPR. Plotam-se as regiões"

clear;
clc;

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

TITTest = 1100:5:1600;
PRTTest = 5:0.25:25;
BPR = 4;
FPR = 1.6;

SFCTest = [];
FsTest = [];

for i = 1:length(TITTest)
    for j = 1:length(PRTTest)
        [SFC, Fs] = Reynaldo_Lima_Exame_MMT_02_Regiao(FPR, BPR, PRTTest(j), TITTest(i), parametrosFixos);
        SFCTest = [SFCTest, SFC];
        FsTest = [FsTest, Fs];
    end
end

figure;
l1 = plot(FsTest, SFCTest, 'k.','DisplayName','Amostra');
hold on;

for r = 5:5:25
    SFCFronteiras = [];
    FsFronteiras = [];
    for i = 1:length(TITTest)
        
            [SFC, Fs] = Reynaldo_Lima_Exame_MMT_02_Regiao(FPR, BPR, r, TITTest(i), parametrosFixos);
            SFCFronteiras = [SFCFronteiras, SFC];
            FsFronteiras = [FsFronteiras, Fs];
    end
    plot(FsFronteiras, SFCFronteiras, 'r-', 'linewidth', 2)
    
    txt = ['$\leftarrow r = ', mat2str(r), '$'];
    text(FsFronteiras(end)+3, SFCFronteiras(end), txt,'Interpreter','latex', 'FontSize', 12, 'Color', 'r')
end

for t = 1100:100:1500
    SFCFronteiras = [];
    FsFronteiras = [];
    for i = 1:length(PRTTest)
        
            [SFC, Fs] = Reynaldo_Lima_Exame_MMT_02_Regiao(FPR, BPR, PRTTest(i), t, parametrosFixos);
            SFCFronteiras = [SFCFronteiras, SFC];
            FsFronteiras = [FsFronteiras, Fs];
    end
    plot(FsFronteiras, SFCFronteiras, 'r-', 'linewidth', 2)

    txt = ['$\uparrow T = ', mat2str(t), 'K$'];
    text(FsFronteiras(end), SFCFronteiras(end) - 0.001, txt,'Interpreter','latex', 'FontSize', 12, 'Color', 'r')
end

Teste = [464.057 0.04151;...
 455.043 0.04210;...
 453.582 0.04199;...
 452.537 0.04155;...
 453.087 0.04107;...
 455.438 0.04053;...
 458.960 0.04034;...
 463.715 0.04028;...
 468.360 0.04038;...
 472.984 0.04053;...
 475.958 0.04079];

Oinf = polyshape(Teste);
l2 = plot(Oinf, 'EdgeColor',[1 1 0], 'FaceColor',[0.9 0.9 0],'DisplayName','Regi\~{a}o para projeto');

set(gca,'TickLabelInterpreter','latex', 'XLim', [275, 525])    
ax = gca;
ax.GridLineStyle = '-';
ax.GridColor = 'k';
ax.GridAlpha = 0.4; % maximum line opacity
grid on;
grid minor;
xlabel('$F_s$ $[N.s/kg]$','Interpreter','latex', 'FontSize', 14);
ylabel('$SFC$ $[kg/h.N]$', 'FontSize', 14,'Interpreter','latex');
legend([l1, l2],'Interpreter','latex', 'FontSize', 10, 'Location', 'northwest')
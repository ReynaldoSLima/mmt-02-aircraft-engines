%% Exame de MMT-02
%  Reynaldo Santos de Lima
%  Código varia_bpr:
%  "Amostram-se diversos pontos para o motor Turbofan. Fixando-se FPR = 1.8
%  , varia-se BPR."
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

TITTest = 1520;
PRTTest = 20;
FPR = 1.5:0.05:1.8;


%% BRR = 4

BPRTest = [4 4.2 4.4 4.6 4.8];
%figure;
hold on;
color = [[1 0 0]; [1 1 0]; [0 0 1]; [1 0 1]; [0 1 0]];
for k = 1:length(BPRTest)
    BPR = BPRTest(k);
    SFCTest = [];
    FsTest = [];
    
    for i = 1:length(FPR)
            [SFC, Fs] = Reynaldo_Lima_Exame_MMT_02_Regiao(FPR(i), BPR, PRTTest, TITTest, parametrosFixos);
            SFCTest = [SFCTest, SFC];
            FsTest = [FsTest, Fs];
    end
    plot(FsTest, SFCTest,'-', 'linewidth',1.5);
    text(FsTest(1), SFCTest(1), '$FPR=1,5$','Interpreter','latex', 'FontSize', 10)
    text(FsTest(end), SFCTest(end), '$FPR=1,8$','Interpreter','latex', 'FontSize', 10)
end
txt=text(435, 0.04,'$\longleftarrow$ \textbf{Crescimento de BPR ------}','Interpreter','latex', 'FontSize', 12,'HorizontalAlignment','center','VerticalAlignment', 'bottom');
set(txt, {'Rotation'}, num2cell(28))
set(gca,'TickLabelInterpreter','latex', 'XLim', [390, 475])    
ax = gca;
ax.GridLineStyle = '-';
ax.GridColor = 'k';
ax.GridAlpha = 0.4; % maximum line opacity
grid on;
grid minor;
xlabel('$F_s$ $[N.s/kg]$','Interpreter','latex', 'FontSize', 14);
ylabel('$SFC$ $[kg/h.N]$', 'FontSize', 14,'Interpreter','latex');
legend("$BPR=4$","$BPR=4,2$","$BPR=4,4$","$BPR=4,6$","$BPR=4,8$",'Interpreter','latex', 'FontSize', 10, 'Location', 'northwest')
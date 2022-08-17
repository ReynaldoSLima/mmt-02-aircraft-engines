function [SFC, Fs] = Reynaldo_Lima_Exame_MMT_02_Regiao(FPR, BPR, PRT, TIT, parametrosFixos)
%% Exame de MMT-02
%  Reynaldo Santos de Lima
%  Código Regiao:
%  "função realiza o cálculo do SFC e Fs do motor turbofan, considerando a 
%  possibilidade de os exaustores estarem com engasgo"
%  Entradas:
%  FPR, BPR, PRT, TIT, parametrosFixos
%  parametrosFixos é uma struct com diversas propriedades de interesse

    Rgas = parametrosFixos.Rgas;
    Rar = parametrosFixos.Rar;
    etaExaustor = parametrosFixos.etaExaustor;
    etaEixo = parametrosFixos.etaEixo;
    etaCombustao = parametrosFixos.etaCombustao;
    perdaComb = parametrosFixos.perdaComb;
    gammaAr = parametrosFixos.gammaAr;
    gammaGas = parametrosFixos.gammaGas;
    cpAr = parametrosFixos.cpAr;
    cpGas = parametrosFixos.cpGas;
    etaPoli = parametrosFixos.etaPoli;
    pa = parametrosFixos.pa;
    Ta = parametrosFixos.Ta;
    Va = parametrosFixos.Va;
    a = parametrosFixos.a;
    T = parametrosFixos.T;
    M = Va/a;
    
    expCompr = (gammaAr-1)/(gammaAr*etaPoli); % expoente de compressão (n-1)/n
    expExpan = (gammaGas-1)*etaPoli/gammaGas; % expoente de expansão (n-1)/n
   
    T01 = Ta + Va^2/(2*cpAr); % K
    p01 = pa * (T01/Ta)^(gammaAr/(gammaAr-1)); % kPa
    p02 = p01 * FPR;
    T02 = T01 * (p02/p01)^expCompr;
    p03 = PRT*p01;
    T03 = T02 * (p03/p02)^expCompr;
    T04 = TIT;
    p04 = (1-perdaComb)*p03;
    T05 = T04 - cpAr/cpGas*1/etaEixo*(T03-T02);
    T06 = T05 - (BPR+1)*cpAr/cpGas*1/etaEixo*(T02-T01);
    p05 = p04*(T05/T04)^(1/expExpan);
    p06 = p05*(T06/T05)^(1/expExpan);
    FPROutput = p06/pa;

    f = Reynaldo_Lima_Exame_MMT_02_f(T03, T04-T03, 0) / etaCombustao;

    if isempty(f)
        SFC = f;
        Fs = f;
        return
    end

    rCritAr = (1-1/etaExaustor*((gammaAr-1)/(gammaAr+1)))^...
        (gammaAr/(gammaAr-1));
    rCritGas = (1-1/etaExaustor*((gammaGas-1)/(gammaGas+1)))^...
        (gammaGas/(gammaGas-1));

    if FPR < 1/rCritAr
        p8 = pa;
    else
        p8 = p02*rCritAr;
        %display('Erro: M=1 no exaustor frio');
    end

    CC = a;
    Tc7 = T04 - 1/etaExaustor*T04*(1-2/(gammaGas+1));
    rhoC7 = p04*rCritGas/(Rgas*Tc7);
    Tc8 = T02 - 1/etaExaustor*T02*(1-2/(gammaAr+1));
    rhoC8 = p02*rCritAr/(Rar*Tc8);

    CCold = sqrt(2*cpAr*etaExaustor*T02*(1-(1/(p02/pa))^((gammaAr-1)/gammaAr)));
    CHot = sqrt(2*cpGas*etaExaustor*T06*(1-(1/(p06/pa))^((gammaGas-1)/gammaGas)));

    if FPROutput < 1/rCritGas
        p7 = pa;
    else
        p7 = p04*rCritGas;
        %display(mat2str(FPROutput));
    end
    

    m = T/((CHot-Va)/(BPR+1) + BPR*(CCold-Va)/(BPR+1) + (p7-pa)/(rhoC7*CC)/(BPR+1) + BPR/(BPR+1)*(p8-pa)/(rhoC8*CC));
    mh = m/(BPR+1);
    mc = m - mh;
    
    SFC = mh*f*3600/T;
    Fs = T / m;

end
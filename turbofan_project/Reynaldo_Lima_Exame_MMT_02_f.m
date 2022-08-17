function f = Reynaldo_Lima_Exame_MMT_02_f(Ti, DT, print)
%% Exame de MMT-02
%  Reynaldo Santos de Lima
%  Função f:
%  "transição do gráfico para o querosene do Saravanamuttoo, temperaturas
%  de entrada da turbina variando de 400 a 900 e fazendo interpolações
%  nessa direção. O delta T é aproximado para o múltimo de 5 mais próximo"
%  Entradas:
%  Ti, DT, Temperatura de entrada da CC, Diferençã de temperatura na CC
%  print: 1 ou 0 para indicar se há desejo de exibir o gráfico de f

f_400 = [0.00365 150;...
         0.00375 155;...
         0.00385 160;...
         0.00400 165;...
         0.00415 170;...
         0.00425 175;...
         0.00438 180;...
         0.00448 185;...
         0.00458 190;...
         0.00470 195;...
         0.00483 200;...
         0.00498 205;...
         0.00508 210;...
         0.00520 215;...
         0.00532 220;...
         0.00541 225;...
         0.00556 230;...
         0.00573 235;...
         0.00585 240;...
         0.00600 245;...
         0.00612 250;...
         0.00621 255;...
         0.00633 260;...
         0.00650 265;...
         0.00662 270;...
         0.00678 275;...
         0.00690 280;...
         0.00700 285;...
         0.00713 290;...
         0.00730 295;...
         0.00740 300;...
         0.00752 305;...
         0.00769 310;...
         0.00779 315;...
         0.00790 320;...
         0.00805 325;...
         0.00820 330;...
         0.00830 335;...
         0.00840 340;...
         0.00857 345;...
         0.00868 350;...
         0.00880 355;...
         0.00895 360;...
         0.00906 365;...
         0.00920 370;...
         0.00933 375;...
         0.00950 380;...
         0.00962 385;...
         0.00971 390;...
         0.00990 395;...
         0.01000 400;...
         0.01015 405;...
         0.01027 410;...
         0.01042 415;...
         0.01055 420;...
         0.01067 425;...
         0.01085 430;...
         0.01100 435;...
         0.01106 440;...
         0.01120 445;...
         0.01135 450;...
         0.01150 455;...
         0.01163 460;...
         0.01178 465;...
         0.01188 470;...
         0.01200 475;...
         0.01216 480;...
         0.01230 485;...
         0.01245 490;...
         0.01258 495;...
         0.01270 500;...
         0.01285 505;...
         0.01300 510;...
         0.01312 515;...
         0.01328 520;...
         0.01340 525;...
         0.01360 530;...
         0.01375 535;...
         0.01385 540;...
         0.01400 545;...
         0.01416 550;...
         0.01430 555;...
         0.01442 560;...
         0.01458 565;...
         0.01470 570;...
         0.01485 575;...
         0.01500 580;...
         0.01516 585;...
         0.01535 590;...
         0.01548 595;...
         0.01560 600;...
         0.01580 605;...
         0.01595 610;...
         0.01605 615;...
         0.01619 620;...
         0.01630 625;...
         0.01640 630;...
         0.01655 635;...
         0.01670 640;...
         0.01688 645;...
         0.01700 650;...
         0.01720 655;...
         0.01735 660;...
         0.01745 665;...
         0.01760 670;...
         0.01775 675;...
         0.01790 680;...
         0.01806 685;...
         0.01822 690;...
         0.01835 695;...
         0.01855 700;...
         0.01868 705;...
         0.01882 710;...
         0.01900 715;...
         0.01910 720;...
         0.01928 725;...
         0.01940 730;...
         0.01959 735;...
         0.01975 740;...
         0.01990 745;...
         0.02005 750;...
         0.02015 755;...
         0.02030 760;...
         0.02045 765;...
         0.02060 770;...
         0.02078 775;...
         0.02090 780;...
         0.02105 785;...
         0.02125 790;...
         0.02140 795;...
         0.02155 800;...
         0.02170 805;...
         0.02182 810;...
         0.02200 815;...
         0.02215 820;...
         0.02230 825;...
         0.02248 830;...
         0.02262 835;...
         0.02278 840;...
         0.02295 845;...
         0.02305 850;...
         0.02324 855;...
         0.02338 860;...
         0.02352 865;...
         0.02370 870;...
         0.02385 875;...
         0.02398 880;...
         0.02415 885;...
         0.02430 890;...
         0.02445 895;...
         0.02460 900;...
         0.02478 905;...
         0.02495 910;...
         0.02510 915;...
         0.02528 920;...
         0.02537 925;...
         0.02550 930;...
         0.02565 935;...
         0.02583 940;...
         0.02600 945;...
         0.02615 950];

f_500 = [0.00370 150;...
         0.00390 155;...
         0.00392 160;...
         0.00405 165;...
         0.00418 170;...
         0.00430 175;...
         0.00443 180;...
         0.00452 185;...
         0.00470 190;...
         0.00485 195;...
         0.00498 200;...
         0.00510 205;...
         0.00526 210;...
         0.00535 215;...
         0.00550 220;...
         0.00563 225;...
         0.00575 230;...
         0.00590 235;...
         0.00602 240;...
         0.00615 245;...
         0.00630 250;...
         0.00640 255;...
         0.00653 260;...
         0.00667 265;...
         0.00680 270;...
         0.00696 275;...
         0.00707 280;...
         0.00720 285;...
         0.00731 290;...
         0.00742 295;...
         0.00753 300;...
         0.00772 305;...
         0.00783 310;...
         0.00797 315;...
         0.00813 320;...
         0.00830 325;...
         0.00845 330;...
         0.00850 335;...
         0.00867 340;...
         0.00880 345;...
         0.00892 350;...
         0.00910 355;...
         0.00925 360;...
         0.00935 365;...
         0.00950 370;...
         0.00962 375;...
         0.00976 380;...
         0.00992 385;...
         0.01008 390;...
         0.01022 395;...
         0.01033 400;...
         0.01046 405;...
         0.01060 410;...
         0.01075 415;...
         0.01090 420;...
         0.01105 425;...
         0.01118 430;...
         0.01132 435;...
         0.01148 440;...
         0.01160 445;...
         0.01170 450;...
         0.01185 455;...
         0.01200 460;...
         0.01215 465;...
         0.01226 470;...
         0.01243 475;...
         0.01256 480;...
         0.01270 485;...
         0.01288 490;...
         0.01299 495;...
         0.01310 500;...
         0.01326 505;...
         0.01340 510;...
         0.01354 515;...
         0.01372 520;...
         0.01383 525;...
         0.01400 530;...
         0.01415 535;...
         0.01426 540;...
         0.01440 545;...
         0.01460 550;...
         0.01475 555;...
         0.01486 560;...
         0.01498 565;...
         0.01518 570;...
         0.01532 575;...
         0.01550 580;...
         0.01565 585;...
         0.01580 590;...
         0.01595 595;...
         0.01608 600;...
         0.01620 605;...
         0.01636 610;...
         0.01650 615;...
         0.01668 620;...
         0.01685 625;...
         0.01700 630;...
         0.01714 635;...
         0.01725 640;...
         0.01738 645;...
         0.01750 650;...
         0.01770 655;...
         0.01784 660;...
         0.01796 665;...
         0.01812 670;...
         0.01826 675;...
         0.01845 680;...
         0.01860 685;...
         0.01872 690;...
         0.01886 695;...
         0.01903 700;...
         0.01924 705;...
         0.01940 710;...
         0.01955 715;...
         0.01965 720;...
         0.01980 725;...
         0.01998 730;...
         0.02015 735;...
         0.02030 740;...
         0.02043 745;...
         0.02060 750;...
         0.02077 755;...
         0.02090 760;...
         0.02100 765;...
         0.02120 770;...
         0.02138 775;...
         0.02150 780;...
         0.02166 785;...
         0.02185 790;...
         0.02200 795;...
         0.02215 800;...
         0.02230 805;...
         0.02245 810;...
         0.02260 815;...
         0.02278 820;...
         0.02296 825;...
         0.02310 830;...
         0.02325 835;...
         0.02340 840;...
         0.02357 845;...
         0.02370 850;...
         0.02390 855;...
         0.02405 860;...
         0.02420 865;...
         0.02438 870;...
         0.02450 875;...
         0.02465 880;...
         0.02480 885;...
         0.02500 890;...
         0.02515 895;...
         0.02530 900;...
         0.02545 905;...
         0.02566 910;...
         0.02580 915;...
         0.02600 920;...
         0.02615 925;...
         0.02629 930;...
         0.02640 935;...
         0.02655 940;...
         0.02676 945;...
         0.02690 950];

f_600 = [0.00370 150;...
         0.00385 155;...
         0.00400 160;...
         0.00410 165;...
         0.00423 170;...
         0.00435 175;...
         0.00443 180;...
         0.00459 185;...
         0.00472 190;...
         0.00481 195;...
         0.00500 200;...
         0.00520 205;...
         0.00535 210;...
         0.00550 215;...
         0.00562 220;...
         0.00572 225;...
         0.00584 230;...
         0.00595 235;...
         0.00610 240;...
         0.00630 245;...
         0.00645 250;...
         0.00660 255;...
         0.00672 260;...
         0.00685 265;...
         0.00700 270;...
         0.00715 275;...
         0.00725 280;...
         0.00738 285;...
         0.00754 290;...
         0.00767 295;...
         0.00780 300;...
         0.00800 305;...
         0.00815 310;...
         0.00823 315;...
         0.00830 320;...
         0.00847 325;...
         0.00865 330;...
         0.00875 330;...
         0.00889 345;...
         0.00900 345;...
         0.00915 350;...
         0.00930 355;...
         0.00945 360;...
         0.00955 365;...
         0.00970 370;...
         0.00985 375;...
         0.01000 380;...
         0.01015 385;...
         0.01030 390;...
         0.01045 395;...
         0.01055 400;...
         0.01068 405;...
         0.01085 410;...
         0.01100 415;...
         0.01115 420;...
         0.01130 425;...
         0.01143 430;...
         0.01162 435;...
         0.01170 440;...
         0.01190 445;...
         0.01203 450;...
         0.01220 455;...
         0.01232 460;...
         0.01248 465;...
         0.01260 470;...
         0.01273 475;...
         0.01290 480;...
         0.01302 485;...
         0.01312 490;...
         0.01330 495;...
         0.01344 500;...
         0.01355 505;...
         0.01370 510;...
         0.01393 515;...
         0.01410 520;...
         0.01420 525;...
         0.01432 530;...
         0.01450 535;...
         0.01462 540;...
         0.01476 545;...
         0.01494 550;...
         0.01511 555;...
         0.01527 560;...
         0.01545 565;...
         0.01560 570;...
         0.01577 575;...
         0.01589 580;...
         0.01608 585;...
         0.01621 590;...
         0.01640 595;...
         0.01652 600;...
         0.01670 605;...
         0.01683 610;...
         0.01700 615;...
         0.01710 620;...
         0.01730 625;...
         0.01745 630;...
         0.01760 635;...
         0.01772 640;...
         0.01790 645;...
         0.01805 650;...
         0.01819 655;...
         0.01830 660;...
         0.01846 665;...
         0.01860 670;...
         0.01878 675;...
         0.01895 680;...
         0.01905 685;...
         0.01922 690;...
         0.01940 695;...
         0.01958 700;...
         0.01970 705;...
         0.01990 710;...
         0.02005 715;...
         0.02020 720;...
         0.02035 725;...
         0.02050 730;...
         0.02067 735;...
         0.02082 740;...
         0.02100 745;...
         0.02112 750;...
         0.02128 755;...
         0.02140 760;...
         0.02158 765;...
         0.02180 770;...
         0.02192 775;...
         0.02210 780;...
         0.02221 785;...
         0.02240 790;...
         0.02256 795;...
         0.02278 800;...
         0.02292 805;...
         0.02309 810;...
         0.02328 815;...
         0.02346 820;...
         0.02360 825;...
         0.02378 830;...
         0.02395 835;...
         0.02410 840;...
         0.02426 845;...
         0.02445 850;...
         0.02460 855;...
         0.02477 860;...
         0.02497 865;...
         0.02500 870;...
         0.02515 875;...
         0.02531 880;...
         0.02545 885;...
         0.02560 890;...
         0.02578 895;...
         0.02595 900;...
         0.02615 905;...
         0.02630 910;...
         0.02645 915;...
         0.02660 920;...
         0.02678 925;...
         0.02690 930];

f_700 = [0.00390 150;...
         0.00400 155;...
         0.00412 160;...
         0.00421 165;...
         0.00437 170;...
         0.00451 175;...
         0.00470 180;...
         0.00485 185;...
         0.00500 190;...
         0.00510 195;...
         0.00525 200;...
         0.00538 205;...
         0.00552 210;...
         0.00563 215;...
         0.00580 220;...
         0.00591 225;...
         0.00605 230;...
         0.00620 235;...
         0.00635 240;...
         0.00650 245;...
         0.00662 250;...
         0.00680 255;...
         0.00690 260;...
         0.00710 265;...
         0.00722 270;...
         0.00730 275;...
         0.00745 280;...
         0.00762 285;...
         0.00775 290;...
         0.00790 295;...
         0.00800 300;...
         0.00818 305;...
         0.00829 310;...
         0.00838 315;...
         0.00850 320;...
         0.00870 325;...
         0.00890 330;...
         0.00900 335;...
         0.00915 340;...
         0.00930 345;...
         0.00942 350;...
         0.00954 355;...
         0.00969 360;...
         0.00983 365;...
         0.00996 370;...
         0.01011 375;...
         0.01030 380;...
         0.01040 385;...
         0.01058 390;...
         0.01070 395;...
         0.01085 400;...
         0.01100 405;...
         0.01118 410;...
         0.01130 415;...
         0.01148 420;...
         0.01160 425;...
         0.01172 430;...
         0.01190 435;...
         0.01200 440;...
         0.01219 445;...
         0.01239 450;...
         0.01252 455;...
         0.01270 460;...
         0.01280 465;...
         0.01292 470;...
         0.01305 475;...
         0.01320 480;...
         0.01334 485;...
         0.01350 490;...
         0.01365 495;...
         0.01380 500;...
         0.01395 505;...
         0.01410 510;...
         0.01428 515;...
         0.01445 520;...
         0.01460 525;...
         0.01480 530;...
         0.01495 535;...
         0.01505 540;...
         0.01525 545;...
         0.01542 550;...
         0.01558 555;...
         0.01570 560;...
         0.01580 565;...
         0.01600 570;...
         0.01616 575;...
         0.01630 580;...
         0.01645 585;...
         0.01663 590;...
         0.01680 595;...
         0.01690 600;...
         0.01709 605;...
         0.01726 610;...
         0.01738 615;...
         0.01754 620;...
         0.01771 625;...
         0.01789 630;...
         0.01802 635;...
         0.01814 640;...
         0.01830 645;...
         0.01845 650;...
         0.01860 655;...
         0.01872 660;...
         0.01896 665;...
         0.01910 670;...
         0.01925 675;...
         0.01940 680;...
         0.01955 685;...
         0.01972 690;...
         0.01990 695;...
         0.02005 700;...
         0.02020 705;...
         0.02040 710;...
         0.02055 715;...
         0.02065 720;...
         0.02082 725;...
         0.02097 730;...
         0.02115 735;...
         0.02135 740;...
         0.02150 745;...
         0.02165 750;...
         0.02180 755;...
         0.02195 760;...
         0.02210 765;...
         0.02230 770;...
         0.02248 775;...
         0.02256 780;...
         0.02275 785;...
         0.02295 790;...
         0.02310 795;...
         0.02322 800;...
         0.02340 805;...
         0.02355 810;...
         0.02376 815;...
         0.02395 820;...
         0.02410 825;...
         0.02430 830;...
         0.02445 835;...
         0.02458 840;...
         0.02475 845;...
         0.02496 850;...
         0.02513 855;...
         0.02530 860;...
         0.02540 865;...
         0.02562 870;...
         0.02580 875;...
         0.02600 880;...
         0.02612 885;...
         0.02630 890;...
         0.02642 895;...
         0.02660 900;...
         0.02675 905;...
         0.02692 910];

f_800 = [0.00400 150;...
         0.00412 155;...
         0.00425 160;...
         0.00442 165;...
         0.00455 170;...
         0.00468 175;...
         0.00485 180;...
         0.00500 185;...
         0.00515 190;...
         0.00528 195;...
         0.00540 200;...
         0.00553 205;...
         0.00567 210;...
         0.00579 215;...
         0.00596 220;...
         0.00608 225;...
         0.00620 230;...
         0.00636 235;...
         0.00650 240;...
         0.00665 245;...
         0.00682 250;...
         0.00690 255;...
         0.00708 260;...
         0.00726 265;...
         0.00740 270;...
         0.00753 275;...
         0.00767 280;...
         0.00780 285;...
         0.00790 290;...
         0.00812 295;...
         0.00825 300;...
         0.00842 305;...
         0.00851 310;...
         0.00866 315;...
         0.00878 320;...
         0.00898 325;...
         0.00910 330;...
         0.00921 335;...
         0.00940 340;...
         0.00952 345;...
         0.00970 350;...
         0.00982 355;...
         0.00999 360;...
         0.01010 365;...
         0.01030 370;...
         0.01040 375;...
         0.01056 380;...
         0.01070 385;...
         0.01090 390;...
         0.01105 395;...
         0.01120 400;...
         0.01131 405;...
         0.01150 410;...
         0.01165 415;...
         0.01180 420;...
         0.01190 425;...
         0.01205 430;...
         0.01219 435;...
         0.01235 440;...
         0.01250 445;...
         0.01263 450;...
         0.01280 455;...
         0.01300 460;...
         0.01310 465;...
         0.01328 470;...
         0.01336 475;...
         0.01354 480;...
         0.01370 485;...
         0.01385 490;...
         0.01400 495;...
         0.01410 500;...
         0.01430 505;...
         0.01444 510;...
         0.01460 515;...
         0.01475 520;...
         0.01492 525;...
         0.01510 530;...
         0.01526 535;...
         0.01546 540;...
         0.01567 545;...
         0.01578 550;...
         0.01592 555;...
         0.01608 560;...
         0.01620 565;...
         0.01637 570;...
         0.01650 575;...
         0.01667 580;...
         0.01682 585;...
         0.01700 590;...
         0.01715 595;...
         0.01730 600;...
         0.01746 605;...
         0.01765 610;...
         0.01782 615;...
         0.01800 620;...
         0.01812 625;...
         0.01830 630;...
         0.01850 635;...
         0.01860 640;...
         0.01880 645;...
         0.01895 650;...
         0.01910 655;...
         0.01920 660;...
         0.01940 665;...
         0.01950 670;...
         0.01970 675;...
         0.01986 680;...
         0.02000 685;...
         0.02016 690;...
         0.02032 695;...
         0.02050 700;...
         0.02070 705;...
         0.02080 710;...
         0.02100 715;...
         0.02120 720;...
         0.02135 725;...
         0.02150 730;...
         0.02167 735;...
         0.02180 740;...
         0.02200 745;...
         0.02215 750;...
         0.02230 755;...
         0.02242 760;...
         0.02261 765;...
         0.02280 770;...
         0.02300 775;...
         0.02315 780;...
         0.02330 785;...
         0.02350 790;...
         0.02362 795;...
         0.02380 800;...
         0.02400 805;...
         0.02415 810;...
         0.02432 815;...
         0.02450 820;...
         0.02465 825;...
         0.02480 830;...
         0.02500 835;...
         0.02515 840;...
         0.02530 845;...
         0.02546 850;...
         0.02567 855;...
         0.02585 860;...
         0.02600 865;...
         0.02616 870;...
         0.02630 875;...
         0.02650 880;...
         0.02667 885;...
         0.02682 890;...
         0.02695 895];

f_900 = [0.00415 150;...
         0.00425 155;...
         0.0044  160;...
         0.0046  165;...
         0.00472 170;...
         0.00485 175;...
         0.0050  180;...
         0.00513 185;...
         0.0053  190;...
         0.0054  195;...
         0.0055  200;...
         0.00565 205;...
         0.0058  210;...
         0.00595 215;...
         0.0061  220;...
         0.00624 225;...
         0.0064  230;...
         0.00655 235;...
         0.0067  240;...
         0.0068  245;...
         0.0070  250;...
         0.00715 255;...
         0.00726 260;...
         0.00744 265;...
         0.00758 270;...
         0.00772 275;...
         0.00787 280;...
         0.00801 285;...
         0.00816 290;...
         0.0083  295;...
         0.00848 300;...
         0.0086  305;...
         0.00875 310;...
         0.00890 315;...
         0.00905 320;...
         0.00919 325;...
         0.00937 330;...
         0.00950 335;...
         0.00965 340;...
         0.00980 345;...
         0.00990 350;...
         0.01010 355;...
         0.01025 360;...
         0.01036 365;...
         0.01050 370;...
         0.01065 375;...
         0.01085 380;...
         0.0110  385;...
         0.01114 390;...
         0.01130 395;...
         0.01146 400;...
         0.01160 405;...
         0.01170 410;...
         0.01189 415;...
         0.01208 420;...
         0.01215 425;...
         0.01230 430;...
         0.01248 435;...
         0.01260 440;...
         0.01280 445;...
         0.01300 450;...
         0.01318 455;...
         0.01330 460;...
         0.01346 465;...
         0.01355 470;...
         0.01370 475;...
         0.01380 480;...
         0.01405 485;...
         0.01415 490;...
         0.01434 495;...
         0.01450 500;...
         0.01470 505;...
         0.01480 510;...
         0.01495 515;...
         0.01513 520;...
         0.01530 525;...
         0.01542 530;...
         0.01560 535;...
         0.01580 540;...
         0.01595 545;...
         0.01610 550;...
         0.01625 555;...
         0.01640 560;...
         0.01660 565;...
         0.01672 570;...
         0.01690 575;...
         0.01705 580;...
         0.01720 585;...
         0.01735 590;...
         0.01752 595;...
         0.01772 600;...
         0.01792 605;...
         0.01802 610;...
         0.01820 615;...
         0.01836 620;...
         0.01850 625;...
         0.01865 630;...
         0.01886 635;...
         0.01899 640;...
         0.01916 645;...
         0.01930 650;...
         0.01945 655;...
         0.01960 660;...
         0.01980 665;...
         0.01995 670;...
         0.02010 675;...
         0.02026 680;...
         0.02044 685;...
         0.02060 690;...
         0.02078 695;...
         0.02096 700;...
         0.02115 705;...
         0.02130 710;...
         0.02150 715;...
         0.02165 720;...
         0.02180 725;...
         0.02196 730;...
         0.02216 735;...
         0.02232 740;...
         0.02250 745;...
         0.02267 750;...
         0.02278 755;...
         0.02295 760;...
         0.02315 765;...
         0.02330 770;...
         0.02350 775;...
         0.02362 780;...
         0.02379 785;...
         0.02398 790;...
         0.02415 795;...
         0.02425 800;...
         0.02445 805;...
         0.02460 810;...
         0.02477 815;...
         0.02500 820;...
         0.02512 825;...
         0.02530 830;...
         0.02546 835;...
         0.02565 840;...
         0.02578 845;...
         0.02590 850];

resto = mod(DT, 5);
pInt  = DT - resto;

if resto < 5/2
    DT_interp = pInt;
else
    DT_interp = pInt + 5;
end

if (Ti >= 400) && (Ti < 500)
    fe = f_400(f_400(:,2)==DT_interp,1);
    fd = f_500(f_500(:,2)==DT_interp,1);
    x  = (Ti-400)/(500-400);
    f  = fe*(1-x) + fd*x;
elseif (Ti >= 500) && (Ti < 600)
    fe = f_500(f_500(:,2)==DT_interp,1);
    fd = f_600(f_600(:,2)==DT_interp,1);
    x  = (Ti-500)/(600-500);
    f  = fe*(1-x) + fd*x;
elseif (Ti >= 600) && (Ti < 700)
    fe = f_600(f_600(:,2)==DT_interp,1);
    fd = f_700(f_700(:,2)==DT_interp,1);
    x  = (Ti-600)/(700-600);
    f  = fe*(1-x) + fd*x;
elseif (Ti >= 700) && (Ti < 800)
    fe = f_700(f_700(:,2)==DT_interp,1);
    fd = f_800(f_800(:,2)==DT_interp,1);
    x  = (Ti-700)/(800-700);
    f  = fe*(1-x) + fd*x;
elseif (Ti >= 800) && (Ti < 900)
    fe = f_800(f_800(:,2)==DT_interp,1);
    fd = f_900(f_900(:,2)==DT_interp,1);
    x  = (Ti-800)/(900-800);
    f  = fe*(1-x) + fd*x;
else
    error("Inlet temperature out of range");
end


if print == 1
    plot(f_400(:,1), f_400(:,2),...
        'linewidth', 1.5)
    hold on
    plot(f_500(:,1), f_500(:,2),...
        'linewidth', 1.5)
    plot(f_600(:,1), f_600(:,2),...
        'linewidth', 1.5)
    plot(f_700(:,1), f_700(:,2),...
        'linewidth', 1.5)
    plot(f_800(:,1), f_800(:,2),...
        'linewidth', 1.5)
    plot(f_900(:,1), f_900(:,2),...
        'linewidth', 1.5)
    set(gca,'TickLabelInterpreter','latex', 'XLim', [min(f_400(:,1)), max(f_500(:,1))], 'YLim', [min(f_500(:,2)), max(f_500(:,2))])
    ax = gca;
    ax.GridLineStyle = '-';
    ax.GridColor = 'k';
    ax.GridAlpha = 0.4; % maximum line opacity
    grid on;
    grid minor;
    xlabel('$f$ $[\dot{m}_{f}/\dot{m}_{ar}]$','Interpreter','latex', 'FontSize', 14);
    ylabel('$\Delta T_{CC}$ $[K]$', 'FontSize', 14,'Interpreter','latex');
    legend("$T_e = 400 K$",...
        "$T_e = 500 K$",...
        "$T_e = 600 K$",...
        "$T_e = 700 K$",...
        "$T_e = 800 K$",...
        "$T_e = 900 K$",'Interpreter','latex', 'FontSize', 10, 'Location', 'northwest')
end
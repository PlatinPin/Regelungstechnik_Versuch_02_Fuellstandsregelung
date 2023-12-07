clear all;

AB = 0.0226;
sim_time = 70;
h = 0.1;
KR_array = [0.002, 0.004, 0.006, 0.008, 0.01];


for count=1:length(KR_array)
KR = KR_array(count);

opt = simset('MaxStep', 0.01);
simout = sim("Versuch_1_Aufgabe_1.slx",[0 sim_time],opt);
time = simout.tout;

fuehrungsgroesse = simout.ScopeData.signals(1).values;
stellgroesse = simout.ScopeData.signals(2).values;
regelgroesse = simout.ScopeData.signals(3).values;

figure(count),clf;

counttxt = num2str(KR_array(count));
titlestr = strcat("KR=", counttxt);
title(titlestr);

yyaxis left;plot(time,fuehrungsgroesse,'-','LineWidth',2);
ylim([0,0.12]);
hold on;
plot(time,regelgroesse,'-','LineWidth',2);
yyaxis right;plot(time,stellgroesse,'-','LineWidth',2);
%ylim([0,0.4]);

ylabel("m");
xlabel("s");
grid;
legend("Fuehrungsgroesse", "Stellgroesse", "Regelgroesse");
end

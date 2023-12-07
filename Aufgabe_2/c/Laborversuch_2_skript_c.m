%clear all;
KR = 0.01;
AB = 0.0226;
C = 0.003;
TN_array = [0.7,0.8,0.9,0.10, 0.11, 0.12, 0.13, 0.14, 0.15];
k = 0.00134;

for count=1:length(TN_array)

TN = TN_array(count);
 

opt = simset('MaxStep', 0.01);
simout=sim("Labor_2_Aufgabe_2_c.slx",[0 40],opt);

time = simout.tout;
fuehrungsgroesse = simout.ScopeData.signals(1).values;
regelgroesse = simout.ScopeData.signals(2).values;
stellgroesse = simout.ScopeData.signals(3).values;

figure(count),clf;
counttxt=num2str(TN_array(count));
titlestr = strcat("TN=", counttxt);

title(titlestr)

yyaxis left;plot(time,fuehrungsgroesse,'-','LineWidth',2);
hold on;
plot(time,regelgroesse,'-',"LineWidth",2);
ylabel("Führungs- und Regelgröße");

yyaxis right;plot(time,stellgroesse,'-','LineWidth',2);
xlabel("Stellgröße");
grid;
end





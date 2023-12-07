%clear all;
KR = 0.01;
AB = 0.0226;
c = 0.003;
h = 0.1;
sim_time = 70;
TN_array = [0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.10];

for count=1:length(TN_array)

TN = TN_array(count);
 

opt = simset('MaxStep', 0.01);
simout=sim("Regelungslabor_02_Aufgabe_02_b_schaltung.slx",[0 sim_time],opt);

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
ylim([0,0.2]);

yyaxis right;plot(time,stellgroesse,'-','LineWidth',2);
xlabel("Stellgröße");
grid;
legend("Führungsgröße","Regelgröße","Stellgröße");
end





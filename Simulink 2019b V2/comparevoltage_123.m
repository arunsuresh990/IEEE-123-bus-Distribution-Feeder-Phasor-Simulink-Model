%% Author: Arun Suresh,Dr. Sukumar Kamalasadan, University of North Carolina, Charlotte
% This code compares the node voltage obtained from Simulink model against the benchmark voltages for IEEE 123 bus system 
% Run the simulink model first and run this code to compare node voltages
Vs123=V123(end,:)';
Vsim=reshape(Vs123,3,length(Vs123)/3)';% Three Phase Steady State Node Voltage of All Nodes
load('BenchmarkVoltage');
Va=Vsim(:,1);Vb=Vsim(:,2);Vc=Vsim(:,3);
Vab=BM(:,1);Vbb=BM(:,2);Vcb=BM(:,3);
id1 = find(isnan(Vab));Vab(id1) = [];
id1 = find((Va==0));Va(id1) = [];
h1=figure('Color','white');
hold on;
plot(Vab,'r*','Linewidth',2);
hold on;
plot(Va,'ko','Linewidth',2)
legend('BenchMark','Simulink');
legend boxoff
ax=gca;
ax.FontSize=15;
ax.FontWeight='bold';
ax.Title.FontSize=15;
ax.Title.FontWeight='bold';
ax.LineWidth=2;
ax.XLabel.String='Bus';
ax.XLabel.FontSize=20;
ax.XLabel.FontWeight='bold';
ax.XLabel.FontName='Times New Roman';
ax.YLabel.String='V pu ';
ax.YLabel.FontSize=20;
ax.YLabel.FontWeight='bold';
ax.YLabel.FontName='Times New Roman';


id1 = find(isnan(Vbb));Vbb(id1) = [];
id1 = find((Vb==0));Vb(id1) = [];
h2=figure('Color','white');
hold on;
plot(Vbb,'r*','Linewidth',2);
hold on;
plot(Vb,'ko','Linewidth',2);
legend('BenchMark','Simulink');
legend boxoff
ax=gca;
ax.FontSize=15;
ax.FontWeight='bold';
ax.Title.FontSize=15;
ax.Title.FontWeight='bold';
ax.LineWidth=2;
ax.XLabel.String='Bus';
ax.XLabel.FontSize=20;
ax.XLabel.FontWeight='bold';
ax.XLabel.FontName='Times New Roman';
ax.YLabel.String='V pu ';
ax.YLabel.FontSize=20;
ax.YLabel.FontWeight='bold';
ax.YLabel.FontName='Times New Roman';


id1 = find(isnan(Vcb));Vcb(id1) = [];
id2 = find((Vc==0));Vc(id2) = [];
h3=figure('Color','white');
hold on;
plot(Vcb,'r*','Linewidth',2);
hold on;
plot(Vc,'ko','Linewidth',2);
legend('BenchMark','Simulink');
legend boxoff
ax=gca;
ax.FontSize=15;
ax.FontWeight='bold';
ax.Title.FontSize=15;
ax.Title.FontWeight='bold';
ax.LineWidth=2;
ax.XLabel.String='Bus';
ax.XLabel.FontSize=20;
ax.XLabel.FontWeight='bold';
ax.XLabel.FontName='Times New Roman';
ax.YLabel.String='V pu ';
ax.YLabel.FontSize=20;
ax.YLabel.FontWeight='bold';
ax.YLabel.FontName='Times New Roman';

% Era=Vab-Va;Erb=Vbb-Vb;Erc=Vcb-Vc;
Era=100*(Vab-Va)./Vab;Erb=100*(Vbb-Vb)./Vbb;Erc=100*(Vcb-Vc)./Vcb;
CIa=max(abs(Vab-Va))
CIb=max(abs(Vbb-Vb))
CIc=max(abs(Vcb-Vc))
h4=figure('Color','white');
hold on;
plot(Era,'b','Linewidth',2);
hold on;
plot(Erb,'r','Linewidth',2);
hold on;
plot(Erc,'y','Linewidth',2);
legend('A','B','C');
legend boxoff
ax=gca;
ax.FontSize=15;
ax.FontWeight='bold';
ax.Title.FontSize=15;
ax.Title.FontWeight='bold';
ax.LineWidth=2;
ax.XLabel.String='Bus';
ax.XLabel.FontSize=20;
ax.XLabel.FontWeight='bold';
ax.XLabel.FontName='Times New Roman';
ax.YLabel.String='% Error ';
ax.YLabel.FontSize=20;
ax.YLabel.FontWeight='bold';
ax.YLabel.FontName='Times New Roman';


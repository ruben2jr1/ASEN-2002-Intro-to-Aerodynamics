filename = "BoundaryLAyer_S011_G05.csv";
Data = load(filename);
[airSpeed] = airSpeedCalc(Data(:,4), 287, Data(:,2), Data(:,1), 1/9.5);

scatter(airSpeed,Data(:,6),'.');

myfittype = fittype('a + b*log(airSpeed)',...
    'dependent',{'y'},'independent',{'airSpeed'},...
    'coefficients',{'a','b'});

myfit = fit(airSpeed,Data(:,6),myfittype);

hold on

plot(airSpeed,p_x);
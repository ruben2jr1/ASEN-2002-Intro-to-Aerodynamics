%Run Main.
%   This is meant to run main with different files.

% Filenames for groups 1 3 5 7 9 11 13 15.
filename = ["VelocityVoltage_S011_G01.csv",...
    "VelocityVoltage_S011_G03.csv",...
    "VelocityVoltage_S011_G05.csv",...
    "VelocityVoltage_S011_G07.csv",...
    "VelocityVoltage_S011_G09.csv",...
    "VelocityVoltage_S011_G11.csv",...
    "VelocityVoltage_S011_G13.csv",...
    "VelocityVoltage_S011_G15.csv"];

VectorOfVoltages = .5:.5:10;
MatrixOfAirSpeeds = zeros(length(filename),length(VectorOfVoltages));
MatrixOfUAirSpeed = zeros(length(filename),length(VectorOfVoltages));
for i = 1:length(filename)
    [vectorOfAirSpeed, vectorOfUAirSpeed] = main(filename(1,i));
    
%     Group = (erase(erase(filename(1,i),".csv"),"VelocityVoltage_S011_"));
%     fprintf('For File: %s \n',Group);
%     printGroupREsults(vectorOfAirSpeed,vectorOfUAirSpeed);

    MatrixOfAirSpeeds(i,:) = vectorOfAirSpeed;
    MatrixOfUAirSpeed(i,:) = vectorOfUAirSpeed;
    
    
end

FinalVectorAirSpeed = zeros(1,length(VectorOfVoltages));
FinalVectorUAirSpeed = zeros(1,length(VectorOfVoltages));
for i = 1:length(VectorOfVoltages)
    FinalVectorAirSpeed(1,i) = sum(MatrixOfAirSpeeds(:,i))./2;
    FinalVectorUAirSpeed(1,i) = sum(MatrixOfUAirSpeed(:,i))./2;
end

p = polyfit(VectorOfVoltages,FinalVectorAirSpeed,1);
fprintf('Mathematical Model AirSpeed(V) = %.2d*V + (%.2d)\n',p(1),p(2));

f1 = figure();
         errorbar(VectorOfVoltages,FinalVectorAirSpeed,FinalVectorUAirSpeed,'-s','MarkerSize',10,...
             'MarkerEdgeColor','red','MarkerFaceColor','red');
         title('Voltage vs. Air Speed');
         ylabel('Air Speed');
         xlabel('Voltage');
         imageFileName = "VoltagevsAirSpeed_AllGroups.jpg";
         saveas(f1,imageFileName);
f2 = figure();
         plot(FinalVectorAirSpeed,FinalVectorUAirSpeed);
         title('Avg Air Speed vs. Uncertainty in Air Speed');
         ylabel('Uncertainty in Air Speed');
         xlabel('Avg Air Speed');
         imageFileName = "AirSpeedvsUAirSpeed_AllGroups.jpg";
         saveas(f2,imageFileName);
    
% close all;
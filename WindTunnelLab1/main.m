%main script
function [VectorAirSpeed, VectorUAirSpeed] = main(filename)
    % Voltages are from:
    %   0.5 1 1.5 --- 10.
    % Indexes for final array insertion. (VectorAirSpeed and VectorUAirSpeed)
    indexesfor0P5 = 1:4:17;
    indexesfor1P5 = 3:4:19;
    indexesfor1 = 2:4:18;
    indexesfor2 = 4:4:20;
    
    % Initializing Final Vectors.
    VectorAirSpeed = zeros(1,length(.5:.5:10));
    VectorUAirSpeed = zeros(1,length(.5:.5:10));

    R = 287; %J/kg*K
    AreaRatio = 1/9.5; %Ainlet/Atest

    %Uncertainties:
    %   Uncertainty in Atmospheric Pressure Measurement.
    UPressAtm = (3.45*10^3); %Pa
    %   Uncertainty in Atmospheric Temperature Measurement.
    UTempAtm = .25; %degree Celsius same as kelvin.
    %   Uncertainty in Differential Pressure Measuremnt
    UPressDiff = (68.9); %Pa
    
    Type = getType(filename);
    
    if Type == 1
        [V_1,~,V_3,~,V_5,~,V_7,~,V_9,~] = dataparse10(filename);
        
        %Define Avg Air speed vector.
        avgAirSpeed = zeros(1,5);
        %Define Avg Uncertainty for Air Speed Vector.
        avgUAirSpeed = zeros(1,5);
        
        airSpeedV_1 = airSpeedCalc(V_1(:,3), R, V_1(:,2), V_1(:,1), AreaRatio);
        UAirSpeedV_1 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_1(:,3), V_1(:,1), V_1(:,2), AreaRatio);
        NV_1Samples = length(airSpeedV_1);
        avgAirSpeed(1,1) = sum(airSpeedV_1)/NV_1Samples;
        avgUAirSpeed(1,1) = sum(UAirSpeedV_1)/NV_1Samples;
        
        airSpeedV_3 = airSpeedCalc(V_3(:,3), R, V_3(:,2), V_3(:,1), AreaRatio);
         UAirSpeedV_3 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_3(:,3), V_3(:,1), V_3(:,2), AreaRatio);
         NV_3Samples = length(airSpeedV_3);
         avgAirSpeed(1,2) = sum(airSpeedV_3)/NV_1Samples;
         avgUAirSpeed(1,2) = sum(UAirSpeedV_3)/NV_3Samples;
         
         airSpeedV_5 = airSpeedCalc(V_5(:,3), R, V_5(:,2), V_5(:,1), AreaRatio);
         UAirSpeedV_5 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_5(:,3), V_5(:,1), V_5(:,2), AreaRatio);
         NV_5Samples = length(airSpeedV_5);
         avgAirSpeed(1,3) = sum(airSpeedV_5)/NV_5Samples;
         avgUAirSpeed(1,3) = sum(UAirSpeedV_5)/NV_5Samples;
         
         airSpeedV_7 = airSpeedCalc(V_7(:,3), R, V_7(:,2), V_7(:,1), AreaRatio);
         UAirSpeedV_7 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_7(:,3), V_7(:,1), V_7(:,2), AreaRatio);
         NV_7Samples = length(airSpeedV_7);
         avgAirSpeed(1,4) = sum(airSpeedV_7)/NV_7Samples;
         avgUAirSpeed(1,4) = sum(UAirSpeedV_7)/NV_7Samples;
         
         airSpeedV_9 = airSpeedCalc(V_9(:,3), R, V_9(:,2), V_9(:,1), AreaRatio);
         UAirSpeedV_9 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_9(:,3), V_9(:,1), V_9(:,2), AreaRatio);
         NV_9Samples = length(airSpeedV_9);
         avgAirSpeed(1,5) = sum(airSpeedV_9)/NV_9Samples;
         avgUAirSpeed(1,5) = sum(UAirSpeedV_9)/NV_9Samples;
         
         j = 1;
         for i = indexesfor1
             VectorAirSpeed(1,i) = avgAirSpeed(1,j);
             VectorUAirSpeed(1,i) = avgUAirSpeed(1,j);
             j = j + 1;
         end
         
%          X = 1:2:9;
%          f1 = figure();
%          %
%          p = polyfit(X,avgAirSpeed,1);
%          fprintf('For File: ');
%          fprintf(erase(filename,".csv"));
%          fprintf(' --- Mathematical Model AirSpeed(V) = %.2d*V + (%.2d)\n',p(1),p(2));
%          %
%          errorbar(X,avgAirSpeed,avgUAirSpeed,'-s','MarkerSize',10,...
%              'MarkerEdgeColor','red','MarkerFaceColor','red');
%          title('Voltage vs. Air Speed');
%          ylabel('Air Speed');
%          xlabel('Voltage');
%          legend(filename);
%          imageFileName = strcat(erase(filename,".csv"),"_Image_VvsAS.jpg");
%          saveas(f1,imageFileName);
%          
%          f2 = figure();
%          plot(avgAirSpeed,avgUAirSpeed);
%          title('Avg Air Speed vs. Uncertainty in Air Speed');
%          ylabel('Uncertainty in Air Speed');
%          xlabel('Avg Air Speed');
%          legend(filename);
%          imageFileName = strcat(erase(filename,".csv"),"_Image_VvsUAS.jpg");
%          saveas(f2,imageFileName);
         
    end
    
    if Type == 2
        [~,V_2,~,V_4,~,V_6,~,V_8,~,V_10] = dataparse10(filename);
        
        %Define Avg Air speed vector.
        avgAirSpeed = zeros(1,5);
        %Define Avg Uncertainty for Air Speed Vector.
        avgUAirSpeed = zeros(1,5);
         
         airSpeedV_2 = airSpeedCalc(V_2(:,3), R, V_2(:,2), V_2(:,1), AreaRatio);
         UAirSpeedV_2 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_2(:,3), V_2(:,1), V_2(:,2), AreaRatio);
         NV_2Samples = length(airSpeedV_2);
         avgAirSpeed(1,1) = sum(airSpeedV_2)/NV_2Samples;
         avgUAirSpeed(1,1) = sum(UAirSpeedV_2)/NV_2Samples;

         airSpeedV_4 = airSpeedCalc(V_4(:,3), R, V_4(:,2), V_4(:,1), AreaRatio);
         UAirSpeedV_4 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_4(:,3), V_4(:,1), V_4(:,2), AreaRatio);
         NV_4Samples = length(airSpeedV_4);
         avgAirSpeed(1,2) = sum(airSpeedV_4)/NV_4Samples;
         avgUAirSpeed(1,2) = sum(UAirSpeedV_4)/NV_4Samples;

         airSpeedV_6 = airSpeedCalc(V_6(:,3), R, V_6(:,2), V_6(:,1), AreaRatio);
         UAirSpeedV_6 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_6(:,3), V_6(:,1), V_6(:,2), AreaRatio);
         NV_6Samples = length(airSpeedV_6);
         avgAirSpeed(1,3) = sum(airSpeedV_6)/NV_6Samples;
         avgUAirSpeed(1,3) = sum(UAirSpeedV_6)/NV_6Samples;

         airSpeedV_8 = airSpeedCalc(V_8(:,3), R, V_8(:,2), V_8(:,1), AreaRatio);
         UAirSpeedV_8 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_8(:,3), V_8(:,1), V_8(:,2), AreaRatio);
         NV_8Samples = length(airSpeedV_8);
         avgAirSpeed(1,4) = sum(airSpeedV_8)/NV_8Samples;
         avgUAirSpeed(1,4) = sum(UAirSpeedV_8)/NV_8Samples;

         airSpeedV_10 = airSpeedCalc(V_10(:,3), R, V_10(:,2), V_10(:,1), AreaRatio);
         UAirSpeedV_10 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_10(:,3), V_10(:,1), V_10(:,2), AreaRatio);
         NV_10Samples = length(airSpeedV_10);
         avgAirSpeed(1,5) = sum(airSpeedV_10)/NV_10Samples;
         avgUAirSpeed(1,5) = sum(UAirSpeedV_10)/NV_10Samples;
         
         j = 1;
         for i = indexesfor2
             VectorAirSpeed(1,i) = avgAirSpeed(1,j);
             VectorUAirSpeed(1,i) = avgUAirSpeed(1,j);
             j = j + 1;
         end
         
%          X = 2:2:10;
%          f1 = figure();
%          %
%          p = polyfit(X,avgAirSpeed,1);
%          fprintf('For File: ');
%          fprintf(erase(filename,".csv"));
%          fprintf(' --- Mathematical Model AirSpeed(V) = %.2d*V + (%.2d)\n',p(1),p(2));
%          %
%          errorbar(X,avgAirSpeed,avgUAirSpeed,'-s','MarkerSize',10,...
%              'MarkerEdgeColor','red','MarkerFaceColor','red')
%          title('Voltage vs. Air Speed');
%          ylabel('Air Speed');
%          xlabel('Voltage');
%          legend(filename);
%          imageFileName = strcat(erase(filename,".csv"),"_Image_VvsAS.jpg");
%          saveas(f1,imageFileName);
%          
%          f2 = figure();
%          plot(avgAirSpeed,avgUAirSpeed);
%          title('Avg Air Speed vs. Uncertainty in Air Speed');
%          ylabel('Uncertainty in Air Speed');
%          xlabel('Avg Air Speed');
%          legend(filename);
%          imageFileName = strcat(erase(filename,".csv"),"_Image_VvsUAS.jpg");
%          saveas(f2,imageFileName);
    end
    
    if Type == .5
        [V_1,~,V_3,~,V_5,~,V_7,~,V_9,~] = dataparseDot5(filename);
        
        %Define Avg Air speed vector.
        avgAirSpeed = zeros(1,5);
        %Define Avg Uncertainty for Air Speed Vector.
        avgUAirSpeed = zeros(1,5);
        
        airSpeedV_1 = airSpeedCalc(V_1(:,3), R, V_1(:,2), V_1(:,1), AreaRatio);
        UAirSpeedV_1 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_1(:,3), V_1(:,1), V_1(:,2), AreaRatio);
        NV_1Samples = length(airSpeedV_1);
        avgAirSpeed(1,1) = sum(airSpeedV_1)/NV_1Samples;
        avgUAirSpeed(1,1) = sum(UAirSpeedV_1)/NV_1Samples;
        
        airSpeedV_3 = airSpeedCalc(V_3(:,3), R, V_3(:,2), V_3(:,1), AreaRatio);
         UAirSpeedV_3 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_3(:,3), V_3(:,1), V_3(:,2), AreaRatio);
         NV_3Samples = length(airSpeedV_3);
         avgAirSpeed(1,2) = sum(airSpeedV_3)/NV_1Samples;
         avgUAirSpeed(1,2) = sum(UAirSpeedV_3)/NV_3Samples;
         
         airSpeedV_5 = airSpeedCalc(V_5(:,3), R, V_5(:,2), V_5(:,1), AreaRatio);
         UAirSpeedV_5 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_5(:,3), V_5(:,1), V_5(:,2), AreaRatio);
         NV_5Samples = length(airSpeedV_5);
         avgAirSpeed(1,3) = sum(airSpeedV_5)/NV_5Samples;
         avgUAirSpeed(1,3) = sum(UAirSpeedV_5)/NV_5Samples;
         
         airSpeedV_7 = airSpeedCalc(V_7(:,3), R, V_7(:,2), V_7(:,1), AreaRatio);
         UAirSpeedV_7 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_7(:,3), V_7(:,1), V_7(:,2), AreaRatio);
         NV_7Samples = length(airSpeedV_7);
         avgAirSpeed(1,4) = sum(airSpeedV_7)/NV_7Samples;
         avgUAirSpeed(1,4) = sum(UAirSpeedV_7)/NV_7Samples;
         
         airSpeedV_9 = airSpeedCalc(V_9(:,3), R, V_9(:,2), V_9(:,1), AreaRatio);
         UAirSpeedV_9 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_9(:,3), V_9(:,1), V_9(:,2), AreaRatio);
         NV_9Samples = length(airSpeedV_9);
         avgAirSpeed(1,5) = sum(airSpeedV_9)/NV_9Samples;
         avgUAirSpeed(1,5) = sum(UAirSpeedV_9)/NV_9Samples;
         
         j = 1;
         for i = indexesfor0P5
             VectorAirSpeed(1,i) = avgAirSpeed(1,j);
             VectorUAirSpeed(1,i) = avgUAirSpeed(1,j);
             j = j + 1;
         end
         
%          X = .5:2:8.5;
%          f1 = figure();
%          %
%          p = polyfit(X,avgAirSpeed,1);
%          fprintf('For File: ');
%          fprintf(erase(filename,".csv"));
%          fprintf(' --- Mathematical Model AirSpeed(V) = %.2d*V + (%.2d)\n',p(1),p(2));
%          %
%          errorbar(X,avgAirSpeed,avgUAirSpeed,'-s','MarkerSize',10,...
%              'MarkerEdgeColor','red','MarkerFaceColor','red')
%          title('Voltage vs. Air Speed');
%          ylabel('Air Speed');
%          xlabel('Voltage');
%          legend(filename);
%          imageFileName = strcat(erase(filename,".csv"),"_Image_VvsAS.jpg");
%          saveas(f1,imageFileName);
%          
%          f2 = figure();
%          plot(avgAirSpeed,avgUAirSpeed);
%          title('Avg Air Speed vs. Uncertainty in Air Speed');
%          ylabel('Uncertainty in Air Speed');
%          xlabel('Avg Air Speed');
%          legend(filename);
%          imageFileName = strcat(erase(filename,".csv"),"_Image_VvsUAS.jpg");
%          saveas(f2,imageFileName);
               
    end
    
    if Type == 1.5
        [~,V_2,~,V_4,~,V_6,~,V_8,~,V_10] = dataparseDot5(filename);
        
        %Define Avg Air speed vector.
        avgAirSpeed = zeros(1,5);
        %Define Avg Uncertainty for Air Speed Vector.
        avgUAirSpeed = zeros(1,5);
         
         airSpeedV_2 = airSpeedCalc(V_2(:,3), R, V_2(:,2), V_2(:,1), AreaRatio);
         UAirSpeedV_2 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_2(:,3), V_2(:,1), V_2(:,2), AreaRatio);
         NV_2Samples = length(airSpeedV_2);
         avgAirSpeed(1,1) = sum(airSpeedV_2)/NV_2Samples;
         avgUAirSpeed(1,1) = sum(UAirSpeedV_2)/NV_2Samples;

         airSpeedV_4 = airSpeedCalc(V_4(:,3), R, V_4(:,2), V_4(:,1), AreaRatio);
         UAirSpeedV_4 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_4(:,3), V_4(:,1), V_4(:,2), AreaRatio);
         NV_4Samples = length(airSpeedV_4);
         avgAirSpeed(1,2) = sum(airSpeedV_4)/NV_4Samples;
         avgUAirSpeed(1,2) = sum(UAirSpeedV_4)/NV_4Samples;

         airSpeedV_6 = airSpeedCalc(V_6(:,3), R, V_6(:,2), V_6(:,1), AreaRatio);
         UAirSpeedV_6 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_6(:,3), V_6(:,1), V_6(:,2), AreaRatio);
         NV_6Samples = length(airSpeedV_6);
         avgAirSpeed(1,3) = sum(airSpeedV_6)/NV_6Samples;
         avgUAirSpeed(1,3) = sum(UAirSpeedV_6)/NV_6Samples;

         airSpeedV_8 = airSpeedCalc(V_8(:,3), R, V_8(:,2), V_8(:,1), AreaRatio);
         UAirSpeedV_8 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_8(:,3), V_8(:,1), V_8(:,2), AreaRatio);
         NV_8Samples = length(airSpeedV_8);
         avgAirSpeed(1,4) = sum(airSpeedV_8)/NV_8Samples;
         avgUAirSpeed(1,4) = sum(UAirSpeedV_8)/NV_8Samples;

         airSpeedV_10 = airSpeedCalc(V_10(:,3), R, V_10(:,2), V_10(:,1), AreaRatio);
         UAirSpeedV_10 = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, V_10(:,3), V_10(:,1), V_10(:,2), AreaRatio);
         NV_10Samples = length(airSpeedV_10);
         avgAirSpeed(1,5) = sum(airSpeedV_10)/NV_10Samples;
         avgUAirSpeed(1,5) = sum(UAirSpeedV_10)/NV_10Samples;
         
         j = 1;
         for i = indexesfor1P5
             VectorAirSpeed(1,i) = avgAirSpeed(1,j);
             VectorUAirSpeed(1,i) = avgUAirSpeed(1,j);
             j = j + 1;
         end
         
%          X = 1.5:2:9.5;
%          f1 = figure();
%          %
%          p = polyfit(X,avgAirSpeed,1);
%          fprintf('For File: ');
%          fprintf(erase(filename,".csv"));
%          fprintf(' --- Mathematical Model AirSpeed(V) = %.2d*V + (%.2d)\n',p(1),p(2));
%          %
%          errorbar(X,avgAirSpeed,avgUAirSpeed,'-s','MarkerSize',10,...
%              'MarkerEdgeColor','red','MarkerFaceColor','red')
%          title('Voltage vs. Air Speed');
%          ylabel('Air Speed');
%          xlabel('Voltage');
%          legend(filename);
%          imageFileName = strcat(erase(filename,".csv"),"_Image_VvsAS.jpg");
%          saveas(f1,imageFileName);
%          
%          f2 = figure();
%          plot(avgAirSpeed,avgUAirSpeed);
%          title('Avg Air Speed vs. Uncertainty in Air Speed');
%          ylabel('Uncertainty in Air Speed');
%          xlabel('Avg Air Speed');
%          legend(filename);
%          imageFileName = strcat(erase(filename,".csv"),"_Image_VvsUAS.jpg");
%          saveas(f2,imageFileName);
    end
end

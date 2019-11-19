%reading in data from csv file
%seperating voltage readings into their own respective matrices 
%ASEN 2002 Wind Tunnel Lab
%Nicholas Dembiczak
%Ruben Hinojosa Torres --- For 0.5 incremental.

function[V_1,V_2,V_3,V_4,V_5,V_6,V_7,V_8,V_9,V_10] = dataparseDot5(filename)

matrix = load(filename); %reads in data from cvs file and stores in matrix A

%Establishing Voltage Matrices

 V_1 = zeros(length(matrix),7);
 iteratorV_1 = 0; 
 V_2 = zeros(length(matrix),7);
 iteratorV_2 = 0;
 V_3 = zeros(length(matrix),7);
 iteratorV_3 = 0;
 V_4 = zeros(length(matrix),7);
 iteratorV_4 = 0;
 V_5 = zeros(length(matrix),7);
 iteratorV_5 = 0;
 V_6 = zeros(length(matrix),7);
 iteratorV_6 = 0;
 V_7 = zeros(length(matrix),7);
 iteratorV_7 = 0;
 V_8 = zeros(length(matrix),7);
 iteratorV_8 = 0;
 V_9 = zeros(length(matrix),7);
 iteratorV_9 = 0;
 V_10 = zeros(length(matrix),7);
 iteratorV_10 = 0;

for i = 1:length(matrix)
    if (matrix(i,7) == 0.5)
          iteratorV_1 = iteratorV_1 + 1;
          V_1(iteratorV_1, :) = matrix(i, :);
    elseif (matrix(i,7) == 1.5)
          iteratorV_2 = iteratorV_2 + 1;
          V_2(iteratorV_2, :) = matrix(i, :);
    elseif (matrix(i,7) == 2.5)
          iteratorV_3 = iteratorV_3 + 1;
          V_3(iteratorV_3, :) = matrix(i, :);
    elseif (matrix(i,7) == 3.5)
          iteratorV_4 = iteratorV_4 + 1;
          V_4(iteratorV_4, :) = matrix(i, :);
    elseif (matrix(i,7) == 4.5)
          iteratorV_5 = iteratorV_5 + 1;
          V_5(iteratorV_5, :) = matrix(i, :);
    elseif (matrix(i,7) == 5.5)
          iteratorV_6 = iteratorV_6 + 1;
          V_6(iteratorV_6, :) = matrix(i, :);
    elseif (matrix(i,7) == 6.5)
          iteratorV_7 = iteratorV_7 + 1;
          V_7(iteratorV_7, :) = matrix(i, :);
    elseif (matrix(i,7) == 7.5)
          iteratorV_8 = iteratorV_8 + 1;
          V_8(iteratorV_8, :) = matrix(i, :);
    elseif (matrix(i,7) == 8.5)
          iteratorV_9 = iteratorV_9 + 1;
          V_9(iteratorV_9, :) = matrix(i, :);
    elseif (matrix(i,7) == 9.5)
          iteratorV_10 = iteratorV_10 + 1;
          V_10(iteratorV_10, :) = matrix(i, :);
    end
     
    
end

V_1 = V_1(1:iteratorV_1,:);     %scraps zero entries
V_2 = V_2(1:iteratorV_2,:);
V_3 = V_3(1:iteratorV_3,:);
V_4 = V_4(1:iteratorV_4,:);
V_5 = V_5(1:iteratorV_5,:);
V_6 = V_6(1:iteratorV_6,:);
V_7 = V_7(1:iteratorV_7,:);
V_8 = V_8(1:iteratorV_8,:);
V_9 = V_9(1:iteratorV_9,:);
V_10 = V_10(1:iteratorV_10,:);

end


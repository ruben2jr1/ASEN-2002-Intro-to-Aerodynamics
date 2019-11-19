function [] = printGroupREsults(VectorAirSpeed,VectorUAirSpeed)

fprintf('               AirSpeed = ');
for i = 1:length(VectorAirSpeed)
    fprintf('| %.2d |',VectorAirSpeed(1,i));
end
fprintf('\n');
fprintf('Uncertainty in Airspeed = ');
for i = 1:length(VectorUAirSpeed)
    fprintf('| %.2d |',VectorUAirSpeed(1,i));
end
fprintf('\n');
end

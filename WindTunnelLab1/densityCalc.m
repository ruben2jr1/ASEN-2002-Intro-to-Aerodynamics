%calculate density via ideal gas law


function[density] = densityCalc(Pressure,Temperature, R)

density = Pressure./(R*Temperature);

end


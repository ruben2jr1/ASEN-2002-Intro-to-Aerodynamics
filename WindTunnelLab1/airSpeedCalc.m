%air speed calculation

function[airSpeed] = airSpeedCalc(airSpeedDiffPressure, R, TempAtm, PressureAtm, AreaRatio)

airSpeedDiffPressure = abs(airSpeedDiffPressure);
airSpeed = sqrt((2*R*airSpeedDiffPressure.*TempAtm)./(PressureAtm*(1 - AreaRatio^2)));

end
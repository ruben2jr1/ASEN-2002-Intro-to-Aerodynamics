function [UAirSpeed] = uncertaintyCalc(R, UPressDiff, UPressAtm, UTempAtm, PressDiff, PressAtm, TempAtm, AreaRatio)
%UNCERTAINTYCALC Calculates the uncertainty for each airspeed measurement.
PressDiff = abs(PressDiff);

OneMinusAreaRatio = (1-AreaRatio^2);

ChainRule = (2*R*PressDiff.*TempAtm./(PressAtm*(OneMinusAreaRatio))).^(-1/2);

PartialPressDiff = ChainRule.*(R*TempAtm./(PressAtm*OneMinusAreaRatio));
PartialTempAtm = ChainRule.*(R*PressDiff./(PressAtm*OneMinusAreaRatio)); 
PartialPressAtm = ChainRule.*(R*PressDiff.*TempAtm./((PressAtm).^(2)*OneMinusAreaRatio));

UAirSpeed = sqrt(((PartialPressDiff)*(UPressDiff)).^(2)+((PartialTempAtm)*(UTempAtm)).^(2)+((PartialPressAtm)*(UPressAtm)).^(2));

end


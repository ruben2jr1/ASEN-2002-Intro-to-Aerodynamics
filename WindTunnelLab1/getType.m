function [Type] = getType(filename)
Data = load(filename);
i = 1;
TypeSet = 0;
while (i < length(Data)) && (TypeSet == 0)
    if Data(i,7) == 1
        Type = 1;
        TypeSet = 1;
    elseif Data(i,7) == 2
        Type = 2;
        TypeSet = 1;
    elseif Data(i,7) == .5
        Type = .5;
        TypeSet = 1;
    elseif Data(i,7) == 1.5
        Type = 1.5;
        TypeSet = 1;
    end
    i = i + 1;
end


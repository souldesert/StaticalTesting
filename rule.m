function [K] = rule(one, two)
if max(one) > max(two)
    top = one;
    bottom = two;
else
    top = two;
    bottom = one;
end
Kprev = NaN;
while 1
    minValue = min(top);
    maxValue = max(bottom);
    K = (minValue + maxValue) / 2;
    if K == Kprev
        break
    end
    Kprev = K;
    for i = 1:size(top)
        if i > size(top)
            break
        elseif top(i) < K
            bottom(end + 1) = top(i);
            top(i) = [];
        end
    end
    for i = 1:size(bottom)
        if i > size(bottom)
            break
        elseif bottom(i) > K
            top(end + 1) = bottom(i);
            bottom(i) = [];
        end
    end
end


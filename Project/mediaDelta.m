function [d] = mediaDelta(H)
n1 = sum(H(221,1:171))/171;
n2 = sum(H(220,1:171))/171;

d=n1-n2;
end


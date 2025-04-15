function S_n = approximerapuls(t,n) 
S_n = zeros(size(t))
for i = 1:n
    term =  (2 / (i * pi)) * (1 - (-1)^i) * sin(i * t);
    S_n = S_n + term;
end
end 


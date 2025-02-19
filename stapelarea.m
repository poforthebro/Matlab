function I = stapelarea(fun,a,b,n)
dx = (b-a)/n; % beräkna stapelbredden
I = 0; %sätt integralen till en nolla för att börja ifrån punkt
x = a + dx/2; % Första x värdet i summan
for i = 1:n % Loopa över alla staplar
    I = I +  fun(x)*dx; % adderea stapel arean
    x = x + dx; % stega upp tills alla staplar används.
end
end


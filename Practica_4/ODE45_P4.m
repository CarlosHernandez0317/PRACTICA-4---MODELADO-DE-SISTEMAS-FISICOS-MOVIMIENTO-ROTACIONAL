function dEstado = ecuacion(t, estado)
    theta = estado(1);
    theta_puntito = estado(2);

    dtheta = theta_puntito;
    dtheta_puntito = -(2*100)/(3*10)*theta;

    dEstado = [dtheta; dtheta_puntito];
end

m = 10;
k = 100;
r = 0.05;
coeficiente = (2*k)/(3*m);

theta = 0;
theta_puntito = 2;
estado_inicial = [theta; theta_puntito];

tspan = [0 10];

[t, sol] = ode45(@ecuacion, tspan, estado_inicial);

theta = sol(:, 1);
theta_puntito = sol(:, 2);

figure;
subplot(2,1,1);
plot(t, theta, 'b', 'LineWidth',1.5);
xlabel('Tiempo [s]');
ylabel('Desplazamiento \theta [rad]');
title('Movimiento rotacional del disco \theta(t)');
grid on;

subplot(2,1,2);
plot(t,theta_puntito,'r', 'LineWidth',1.5)
xlabel('Tiempo [s]');
ylabel('Velocidad angular [rad/s]');
title('Velocidad angular del sistema \theta(t)');
grid on;
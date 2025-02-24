clear; clc; close all;

% Given values
R = 1000;        % Resistance in ohms
L = 159e-3;      % Inductance in Henry
f = logspace(0, 6, 1000); % Frequency range from 1 Hz to 1 MHz (log scale)
omega = 2 * pi * f;  % Angular frequency

% Transfer function
H = (1j * L * omega) ./ (R + 1j * L * omega);

% Magnitude and phase
magH = abs(H);
magH_dB = 20 * log10(magH);
phaseH = angle(H) * (180 / pi);  % Convert to degrees

% Plot Bode Diagram
figure;
subplot(2,1,1);
semilogx(f, magH_dB, 'b', 'LineWidth', 2);
grid on;
xlabel('Frequency (Hz)');
ylabel('|H(j\omega)| (dB)');
title('Bode Plot - Magnitude');

subplot(2,1,2);
semilogx(f, phaseH, 'r', 'LineWidth', 2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
title('Bode Plot - Phase');

% Print values at 100 Hz, 1 kHz, 10 kHz
disp('Frequency | Magnitude (dB) | Phase (degrees)');
disp([100, 20*log10(abs((1j*L*2*pi*100)/(R + 1j*L*2*pi*100))), angle((1j*L*2*pi*100)/(R + 1j*L*2*pi*100)) * (180/pi)]);
disp([1000, 20*log10(abs((1j*L*2*pi*1000)/(R + 1j*L*2*pi*1000))), angle((1j*L*2*pi*1000)/(R + 1j*L*2*pi*1000)) * (180/pi)]);
disp([10000, 20*log10(abs((1j*L*2*pi*10000)/(R + 1j*L*2*pi*10000))), angle((1j*L*2*pi*10000)/(R + 1j*L*2*pi*10000)) * (180/pi)]);

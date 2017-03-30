    %% Voltage checking for the Smarticle-Photoresistor/potentiometer setup
close all; clear all; clc;

% Circuit parameters
vIn = 3.3; % volts
rOut = 10000; % voltage divider resistor which goes to ground

% Potentiometer parameters
% rl = 0.8;
% rh = 10000;

% Photoresistor parameters
rl = 100;
rh = 700000;

rRange = linspace(rl, rh, 1000); % not sure I am discretizing this the right way

vOut = vIn*rOut./(rOut+rRange); % basic voltage divider equation give the voltage across rOut

figure
plot(rRange, vOut)
title('V_{out} as a function of Varied Resistance')
xlabel('Resistance (\Omega)')
ylabel('Voltage (V)')
vrange = max(vOut) - min(vOut) % We are only using 418 of the avaiable 1024 values.

vMax = max(vOut)
vMin = min(vOut)

% Compute the analog resolution
adcReading = round(1023/vIn*vOut);
figure
plot(rRange, adcReading)
title('Estimated AnalogRead as a function of Varied Resistance')
xlabel('Resistance (\Omega)')
ylabel('Analog Output')

usedAnalogBits = max(adcReading) - min(adcReading)


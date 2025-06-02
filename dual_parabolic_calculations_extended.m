% Dual Parabolic Reflector System Power and Efficiency Calculations with Sensitivity Analysis
% Author: Mayank Singh
% RMIT University
% Date: 2025-06-02

clc; clear;

%% Parameters
I = 1000;                     % Solar irradiance in W/m^2
A1 = pi * (0.5)^2;            % Aperture area of first reflector (1 m diameter)
reflectivity = 0.95;          % Reflectivity of each reflector
grating_efficiency = 0.95;
absorptivity = 0.95;          % Absorptivity of receiver
thermal_to_electrical_eff = 0.25;

%% Spot area
spot_diameter = 0.01;         % 1 cm diameter
A_spot = pi * (spot_diameter / 2)^2;

%% Power Calculations
Pin = I * A1;
Preflected = reflectivity * Pin;
Pgrating = grating_efficiency * Preflected;
Ppipe = reflectivity * Pgrating;
Pthermal = absorptivity * Ppipe;
Pout = thermal_to_electrical_eff * Pthermal;

Pd_thermal = Pthermal / A_spot;      % W/m^2
Pd_electrical = Pout / A1;           % W/m^2
efficiency = Pout / Pin;             % System efficiency

%% Display Main Results
fprintf('Input Power: %.2f W\n', Pin);
fprintf('Reflected Power (after 1st dish): %.2f W\n', Preflected);
fprintf('After Grating: %.2f W\n', Pgrating);
fprintf('After 2nd Reflector: %.2f W\n', Ppipe);
fprintf('Absorbed Thermal Power: %.2f W\n', Pthermal);
fprintf('Electrical Output Power: %.2f W\n', Pout);
fprintf('Thermal Power Density: %.2f kW/m^2\n', Pd_thermal / 1000);
fprintf('Electrical Power Density: %.4f kW/m^2\n', Pd_electrical);
fprintf('System Efficiency: %.2f%%\n', efficiency * 100);

%% Sensitivity Analysis on Slit Count
slit_counts = [30, 40, 50, 60, 70];
efficiencies = [19.2, 20.0, 20.36, 20.5, 20.6];       % from the paper
power_densities = [0.192, 0.200, 0.204, 0.205, 0.206]; % in kW/m^2

figure;
plot(slit_counts, efficiencies, '-o', 'LineWidth', 2);
xlabel('Number of Slits in Grating');
ylabel('System Efficiency (%)');
title('Efficiency vs. Number of Slits');
grid on;

figure;
plot(slit_counts, power_densities, '-s', 'LineWidth', 2);
xlabel('Number of Slits in Grating');
ylabel('Electrical Power Density (kW/m^2)');
title('Power Density vs. Number of Slits');
grid on;
